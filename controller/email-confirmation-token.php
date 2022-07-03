<?php 

date_default_timezone_set('Asia/Ho_Chi_Minh');

require_once 'authController.php';

require_once 'model/maildb.php';

use PHPMailer\PHPMailer\PHPMailer;

use PHPMailer\PHPMailer\Exception;

use PHPMailer\PHPMailer\SMTP;

require 'Exception.php';

require 'PHPMailer.php';

require 'SMTP.php';

$status = "";

$status2 = "";

if(isset($_POST['email']))

{

  $email = $_POST['email'];

  $select=mysqli_query($connauthme,"SELECT EMAIL,HASH FROM accounttemp WHERE EMAIL='$email'");

  if(mysqli_num_rows($select)==1)

  {

//    while($row=mysqli_fetch_array($select))

//    {

//      $email=md5($row['email']);

//      $pass=md5($row['password']);

//    }

 	$token = md5($email).rand(10,9999);

 	$expFormat = mktime(date("H")+2, date("i"), date("s"), date("m") ,date("d"), date("Y"));

    $expDate = date("Y-m-d H:i:s",$expFormat);

	$update = mysqli_query($connauthme,"UPDATE accounttemp set token='".$token."' ,exp_date='".$expDate."' WHERE EMAIL='".$email."'");

    $link = "localhost/mineinus/email-confirmed.php?key=".$email."&token=".$token."";

    $mail = new PHPMailer();

    $mail->CharSet =  "utf-8";                      //Enable verbose debug output

    $mail->isSMTP();                                            //Send using SMTP

    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through

    $mail->SMTPAuth   = "true";    					  //Enable SMTP authentication

    $mail->Username   = "$emailhost";                     //SMTP username mineinusmc@gmail.com

    $mail->Password   = "$passwordhost";                               //SMTP password ynmizdlevrjintbc

    $mail->SMTPSecure = "ssl";            //tls Enable implicit TLS encryption

    $mail->Port       = "465";                                    //587 TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`



    //Recipients

    //$mail->setFrom('kahn12345678@gmail.com', 'Mailer');

	$mail->setFrom("no-reply@mineinus.com", "MineInUS");
    //$mail->addAddress('kahn12345678@gmail.com', 'Joe User');     //Add a recipient

    $mail->addAddress("$email");               //Name is optional

    //$mail->addReplyTo('info@example.com', 'Information');

    //$mail->addCC('cc@example.com');

    //$mail->addBCC('bcc@example.com');



    //Attachments

    //$mail->addAttachment('/var/tmp/file.tar.gz');         //Add attachments

    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    //Optional name



    //Content

    $mail->isHTML(true);                                  //Set email format to HTML

    $mail->Subject = 'Xác nhận email tài khoản!';

    $mail->Body    = "<p style='font-size: 16px; color: black'> Chúng tôi nhận được yêu cầu xác nhận Email tại id.mineinus.com<br><br>
    Bạn có thể xác nhận Email bằng cách nhấn vào <a href='".$link."'>LINK NÀY</a><br><br>
    Nếu bạn không đăng ký tài khoản, hãy bỏ qua email này.<br><br>
    Email reset mật khẩu sẽ hết hiệu lực trong vòng 2 tiếng. Chúc bạn chơi thật vui vẻ tại MineInUS	<br><br>
    — MineInUs Team</p>";

    //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';



//    $mail->send();

    if($mail->Send())

    {

	  //header ('location: ../password-reset-token-submit.php');

      echo '<script type="text/javascript">Swal.close();
			Swal.fire("Thành công","Đã gửi email xác nhận!","success");

			document.getElementById("register-form").reset();

			grecaptcha.reset();
		</script>';

    }

    else

    {

      echo '<script type="text/javascript">Swal.close();toastr.error("Không gửi được email!");</script>';

      //echo "Mail Error - >".$mail->ErrorInfo;

    }

  }	

}

?>