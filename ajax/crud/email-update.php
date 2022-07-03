<?php

//require_once("../../controller/class/connection.php");

require_once("../../controller/authController.php");

$classconnection = new connection();

$connauthme = $classconnection->getConnectAuthme();





if(isset($_POST['iduser']))

{

$iduser = $_POST['iduser'];

$newemail = $_POST['newemail'];
$oldemail = $_POST['oldemail'];

$secret=$captchaSecretKey; 

$response=$_POST["captcha"];

$verify=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret={$secret}&response={$response}");

$captcha_success=json_decode($verify);

if ($captcha_success->success==true) 

{

    if($iduser == "" || $newemail == "" || $oldemail == "")

    {
	echo '<script type="text/javascript">Swal.close();</script>';
        echo '<script type="text/javascript">toastr.error("Hãy nhập đầy đủ thông tin!");</script>';

        echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

    }

    else

    {

		if (!filter_var($newemail, FILTER_VALIDATE_EMAIL)) 

        {
	echo '<script type="text/javascript">Swal.close();</script>';
        echo '<script type="text/javascript">toastr.error("Sai định dạng email!");</script>';

        echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

	    }

        else 

        {

            $accountarr = $classaccount->getAccount($_SESSION['realname'],$connauthme);

            $emailold = $accountarr['email'];

            if($oldemail == "dc937b59892604f5a86ac96936cd7ff09e25f18ae6b758e8014a24c7fa039e91")

            {

                $emailQuery = "SELECT * FROM AUTHME WHERE EMAIL=? LIMIT 1";

                $stmt = $connauthme->prepare($emailQuery);

                $stmt->bind_param('s',$newemail);

                $stmt->execute();

                $result = $stmt->get_result();

                $userCount = $result->num_rows;

                $stmt->close();	

                    if($userCount>0)

                    {
			echo '<script type="text/javascript">Swal.close();</script>';
                        echo '<script type="text/javascript">toastr.error("Email đã tồn tại!");</script>';

                        echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

                    }	

                    else

                    {
			
                        echo '<script type="text/javascript">sendEmail();</script>'; 

                    }   

            }

            else

            {

                if($emailold == $oldemail)

	            {

                $emailQuery = "SELECT * FROM AUTHME WHERE EMAIL=? LIMIT 1";

                $stmt = $connauthme->prepare($emailQuery);

                $stmt->bind_param('s',$newemail);

                $stmt->execute();

                $result = $stmt->get_result();

                $userCount = $result->num_rows;

                $stmt->close();	

                    if($userCount>0)

                    {
			echo '<script type="text/javascript">Swal.close();</script>';
                        echo '<script type="text/javascript">toastr.error("Email đã tồn tại!");</script>';

                        echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

                    }	

                    else

                    {

                        echo '<script type="text/javascript">sendEmail();</script>'; 

                    }     

                }

	            else

                {
		echo '<script type="text/javascript">Swal.close();</script>';

                echo '<script type="text/javascript">toastr.error("Bạn nhập sai email cũ!");</script>';

                echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

                }   

            }

        }

    }

}

else if ($captcha_success->success==false) 

{
    echo '<script type="text/javascript">Swal.close();</script>';
    echo '<script type="text/javascript">toastr.error("Nhập captcha không thành công!");</script>';

    echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

}

	

}

?>