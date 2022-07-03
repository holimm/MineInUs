<?php

//require_once("../../controller/class/connection.php");

require_once("../../controller/authController.php");

$classconnection = new connection();

$connauthme = $classconnection->getConnectAuthme();



if(isset($_POST['realname']))

{

$realname = $_POST['realname'];

$passwordold = $_POST['oldpassword'];

$password = $_POST['newpassword'];

$cpassword = $_POST['confirmpassword'];



$secret=$captchaSecretKey; 

$response=$_POST["captcha"];

$verify=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret={$secret}&response={$response}");

$captcha_success=json_decode($verify);

if ($captcha_success->success==true) 

{

    if($passwordold == "" || $password == "" || $cpassword == "" || $realname == "")

    {
	echo '<script type="text/javascript">Swal.close();</script>';
    echo '<script type="text/javascript">toastr.error("Hãy nhập đầy đủ thông tin!");</script>';

    }

    else

    {

        if($classaccount->check_password_db($realname,$passwordold,$connauthme))

        {

            if($password == $cpassword)

		    {

                if(strlen($password)<8)

				{
					echo '<script type="text/javascript">Swal.close();</script>';
					echo '<script type="text/javascript">toastr.error("Mật khẩu phải lớn hơn 8 chữ!")</script>';

				}

				else

				{

                    $password_encrypted = $classaccount->hashBcrypt($password, $cost = null);

				    $sqlchangepassword = "UPDATE AUTHME SET HASH=? WHERE NICKNAME=?";

                    $stmt = $connauthme->prepare($sqlchangepassword);

                    $stmt->bind_param('ss',$password_encrypted,$realname);

                    $stmt->execute();
			echo '<script type="text/javascript">Swal.close();</script>';
                    echo '<script type="text/javascript">Swal.fire("Thành công","Thay đổi mật khẩu thành công!","success");</script>';

                }

            }

            else

            {
		echo '<script type="text/javascript">Swal.close();</script>';
                echo '<script type="text/javascript">toastr.error("Mật khẩu không trùng khớp!")</script>';

            }

        }

        else

        {
		echo '<script type="text/javascript">Swal.close();</script>';
            echo '<script type="text/javascript">toastr.error("Mật khẩu cũ không đúng!")</script>';

        }     

    }

}

else if ($captcha_success->success==false) 

{
	echo '<script type="text/javascript">Swal.close();</script>';
    echo '<script type="text/javascript">toastr.error("Nhập captcha không thành công!");</script>';

}

	

}

?>