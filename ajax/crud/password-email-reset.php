<?php
//require_once("../../controller/class/connection.php");
require_once("../../controller/authController.php");
$classconnection = new connection();
$connauthme = $classconnection->getConnectAuthme();

if(isset($_POST['realname']))
{
$email = $_POST['email'];
$realname = $_POST['realname'];

$secret=$captchaSecretKey; 
$response=$_POST["captcha"];
$verify=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret={$secret}&response={$response}");
$captcha_success=json_decode($verify);
if ($captcha_success->success==true) 
{
    if($email == "" || $realname == "")
    {
    echo '<script type="text/javascript">toastr.error("Hãy nhập đầy đủ thông tin!");</script>';
    echo '<script type="text/javascript">Swal.close();</script>';
    }
    else
    {
        $sql = "SELECT * FROM AUTHME WHERE NICKNAME=? AND email=?  LIMIT 1";
        $stmt = $connauthme->prepare($sql);
        $stmt->bind_param('ss', $realname , $email);
        $stmt->execute();
        $result = $stmt->get_result();
        $user = $result->fetch_assoc();
        $row = $result->num_rows;
        if($row == 1)
		{         
            echo '<script type="text/javascript">sendEmail();</script>';
                }
        else
		{
        echo '<script type="text/javascript">toastr.error("Email hoặc mật khẩu không đúng!");</script>';
        echo '<script type="text/javascript">document.getElementById("password-reset-form").reset();</script>';
        echo '<script type="text/javascript">grecaptcha.reset();</script>';
	echo '<script type="text/javascript">Swal.close();</script>';
        }              
    }
}
else if ($captcha_success->success==false) 
{
    echo '<script type="text/javascript">toastr.error("Nhập captcha không thành công!");</script>';
    echo '<script type="text/javascript">document.getElementById("password-reset-form").reset();</script>';
    echo '<script type="text/javascript">grecaptcha.reset();</script>';
    echo '<script type="text/javascript">Swal.close();</script>';

}
	
}
?>