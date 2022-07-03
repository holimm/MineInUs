<?php

//require_once("../../controller/class/connection.php");

date_default_timezone_set('Asia/Ho_Chi_Minh');

require_once("../../controller/authController.php");

$classconnection = new connection();

$connauthme = $classconnection->getConnectAuthme();

$curDate = date("Y-m-d H:i:s");



if(isset($_POST['realname']))

{

$ipclient = $_POST['clientip'];

$sqlcheckduplicateregister = ("SELECT * FROM accounttemp WHERE IP=?");

$stmt = $connauthme->prepare($sqlcheckduplicateregister);

$stmt->bind_param('s',$ipclient);

$stmt->execute();

$result = $stmt->get_result();

$numrowcheckdup = mysqli_num_rows($result);

if($numrowcheckdup > 5)

{
    echo '<script type="text/javascript">Swal.close();</script>';

    echo '<script type="text/javascript">Swal.fire("Thất bại","Bạn đã đăng ký quá 5 lần!","error");</script>';

}

else

{

    $realname = $_POST['realname'];

    $email = $_POST['email'];

    $password = $_POST['password'];

    $cpassword = $_POST['cpassword'];

    $secret=$captchaSecretKey; 

    $response=$_POST["captcha"];

    $verify=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret={$secret}&response={$response}");

    $captcha_success=json_decode($verify);

    if ($captcha_success->success==true) 

    {

        if($realname == "" || $email == "" || $password == ""|| $cpassword == "")

        {

	    echo '<script type="text/javascript">Swal.close();</script>';
            echo '<script type="text/javascript">toastr.error("Hãy nhập đầy đủ thông tin!");</script>';

            echo '<script type="text/javascript">grecaptcha.reset();</script>';

        }

        else

        {

            $pattern = "/^\w{4,16}$/i";

            if(!preg_match($pattern, $realname))

            {
		echo '<script type="text/javascript">Swal.close();</script>';
            echo '<script type="text/javascript">toastr.error("Tên ingame không phù hợp");</script>';

            echo '<script type="text/javascript">grecaptcha.reset();</script>';

            }

            else

            {

                if (!filter_var($email, FILTER_VALIDATE_EMAIL)) 

                {
		echo '<script type="text/javascript">Swal.close();</script>';
                echo '<script type="text/javascript">toastr.error("Sai định dạng email!");</script>';

                echo '<script type="text/javascript">grecaptcha.reset();</script>';

	            }

                else 

                {

                    if($password != $cpassword)

                    {
			echo '<script type="text/javascript">Swal.close();</script>';
                    echo '<script type="text/javascript">toastr.error("Mật khẩu không trùng khớp!");</script>';

                    echo '<script type="text/javascript">grecaptcha.reset();</script>';

                    }

                    else

                    {

                        if(strlen($password) < 8)

                        {
			echo '<script type="text/javascript">Swal.close();</script>';
                        echo '<script type="text/javascript">toastr.error("Mật khẩu phải lớn hơn 8 chữ!");</script>';

                        echo '<script type="text/javascript">grecaptcha.reset();</script>';

                        }

                        else

                        {

                            if($classaccount->getAccount($email,$connauthme)==false)

                            {

                                if($classaccount->getAccount($realname,$connauthme)==false)

                                {

                                    if($classaccount->getAccountTemp($email,$connauthme)==false)

                                    {         

                                        $username = strtolower($realname);

                                        $date = time()*1000;

                                        $passwordhash = $classaccount->hashBcrypt($password, $cost = null);

                                        $sqlregister = "INSERT INTO accounttemp(NICKNAME,LOWERCASENICKNAME,HASH,IP,REGDATE,EMAIL) VALUES (?,?,?,?,?,?);";

	                                    $stmt = $connauthme->prepare($sqlregister);

                                        $stmt->bind_param('ssssss',$realname,$username,$passwordhash,$ipclient,$date,$email);

                                        $stmt->execute();

                                        echo '<script type="text/javascript">sendEmail();</script>';


                                    }

                                    else

                                    {						
					
                                        if($classaccount->getAccountTemp($email,$connauthme))

                                        {
					    $temparray = $classaccount->getAccountTemp($email,$connauthme);
                                            if($temparray['exp_date'] >= $curDate)

                                            {
						echo '<script type="text/javascript">Swal.close();</script>';
                                                echo '<script type="text/javascript">toastr.error("Tài khoản đã đăng ký và email xác nhận còn hạn!");</script>';

                                                echo '<script type="text/javascript">grecaptcha.reset();</script>';

                                            }

                                            else

                                            {

                                                $sql_delete_row = "DELETE FROM accounttemp WHERE EMAIL=?";

                                                $stmt = $connauthme->prepare($sql_delete_row);

                                                $stmt->bind_param('s', $email);

                                                $stmt->execute();

                                                $username = strtolower($realname);

                                                //$ipclient = $classaccount->getUserIP();

                                                $date = time()*1000;

                                                $passwordhash = $classaccount->hashBcrypt($password, $cost = null);

                                                $sqlregister = "INSERT INTO accounttemp(NICKNAME,LOWERCASENICKNAME,HASH,IP,REGDATE,EMAIL) VALUES (?,?,?,?,?,?);";

	                                            $stmt = $connauthme->prepare($sqlregister);

                                                $stmt->bind_param('ssssss',$realname,$username,$passwordhash,$ipclient,$date,$email);

                                                $stmt->execute();
						
                                                echo '<script type="text/javascript">sendEmail();</script>';

                                            } 

                                        }

                                        else

                                        {
					echo '<script type="text/javascript">Swal.close();</script>';
                                            echo '<script type="text/javascript">toastr.error("Email đã được đăng ký!");</script>';

                                            echo '<script type="text/javascript">grecaptcha.reset();</script>';

                                        }                                 

                                    } 

                                }

                                else

                                {
				echo '<script type="text/javascript">Swal.close();</script>';
                                echo '<script type="text/javascript">toastr.error("Tên ingame đã tồn tại!");</script>';

                                echo '<script type="text/javascript">grecaptcha.reset();</script>';

                                } 

                            }

                            else

                            {
				echo '<script type="text/javascript">Swal.close();</script>';
                            echo '<script type="text/javascript">toastr.error("Email đã tồn tại!");</script>';

                            echo '<script type="text/javascript">grecaptcha.reset();</script>';

                            }    

                        }

                    }                

                }

            }		    

        }

    }

    else if ($captcha_success->success==false) 

    {
	echo '<script type="text/javascript">Swal.close();</script>';
        echo '<script type="text/javascript">toastr.error("Nhập captcha không thành công!");</script>';

    }

}

}

?>