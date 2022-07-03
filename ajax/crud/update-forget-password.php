<?php

require_once("../../controller/authController.php");

$classconnection = new connection();

$conn = $classconnection->getConnectAuthme();



if(isset($_POST['reset_link_token']))

{

$curDate = date("Y-m-d H:i:s");

$email = $_POST['email'];

$token = $_POST['reset_link_token'];

$password = $_POST['password'];

$cpassword = $_POST['cpassword'];

if($password == "" || $cpassword=="")

{

	echo '<script type="text/javascript">toastr.error("Hãy nhập đầy đủ thông tin!");</script>';

}

else

{

$query = "SELECT * FROM `AUTHME` WHERE `token`='".$token."' and `EMAIL`='".$email."' LIMIT 1;";

$stmt = $conn->prepare($query);

$stmt->execute();

$result = $stmt->get_result();

$rowcount = mysqli_num_rows($result);

$row=$result->fetch_assoc();

	if($row['exp_date'] < $curDate)

	{

		echo '<script type="text/javascript">window.location = "index.php";</script>';

	}

	else if ($row['exp_date'] >= $curDate)

	{

		if($rowcount == 1 ) 

		{	

			if($password != $cpassword)

			{

				echo '<script type="text/javascript">toastr.error("Mật khẩu không trùng khớp!")</script>';

				echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

			}

			else

			{

				if(strlen($password)<8)

				{

					echo '<script type="text/javascript">toastr.error("Mật khẩu phải lớn hơn 8 chữ!")</script>';

					echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

				}

				else

				{

					$password_encrypted = $classaccount->hashBcrypt($password, $cost = null);

					$sqlchangepassword = "UPDATE AUTHME SET HASH=? WHERE EMAIL=?";

					$stmt = $connauthme->prepare($sqlchangepassword);

					$stmt->bind_param('ss',$password_encrypted,$email);

					$stmt->execute();

					$sqlremovetoken = "UPDATE AUTHME SET token='',exp_date='' WHERE EMAIL=?";

					$stmt = $connauthme->prepare($sqlremovetoken);

					$stmt->bind_param('s',$email);

					$stmt->execute();

					echo '<script type="text/javascript">Swal.fire("Thành công","Thay đổi mật khẩu thành công!","success");</script>';

					echo '<script type="text/javascript">window.location = "login";</script>';

				}

			}

		}

		else

		{

			echo '<script type="text/javascript">toastr.error("Có lỗi máy chủ vui lòng thử lại sau!");</script>';

			echo '<script type="text/javascript">grecaptcha.reset(1);</script>';

		}

	}

}

}

?>