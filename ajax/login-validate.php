<?php

require_once("../controller/authController.php");

require_once("../controller/class/points.php");

$classpoints = new points();

if(isset($_POST['username'])){

$username = $_POST['username'];

$password = $_POST['password'];

if($username=='' || $password=='')

{

	echo '<script type="text/javascript">toastr.error("Hãy nhập đầy đủ tên tài khoản và mật khẩu!");</script>';
	echo '<script type="text/javascript">Swal.close();</script>';

}

else

{

	if (filter_var($username, FILTER_VALIDATE_EMAIL)) 

	{

		if($classaccount->getAccount($username,$connauthme) != false)

		{

		$accountarray = $classaccount->getAccount($username,$connauthme);

		$powername = $classaccount->getPower($accountarray['username'],$connluckperms);

		$return_var = $classaccount->check_password_db($accountarray['realname'],$password,$connauthme);

			if($return_var == true) 

			{

				$uuid = $classpoints->getUUID($accountarray['realname']);

				if($classaccount->checkPlayerBan($classaccount,$uuid,$accountarray['realname'],$conn))

				{

					$banarray = $classaccount->checkPlayerBan($classaccount,$uuid,$accountarray['realname'],$conn);

					$time_converted = $classaccount->converttime($banarray['time']);

					echo "<script type='text/javascript'>sendBannedDialog('".$banarray['username']."','".$banarray['reason']."','".$time_converted."','".$banarray['server_origin']."');</script>";

				}

				else if($classaccount->checkPlayerBan($classaccount,$uuid,$accountarray['realname'],$conn)==false)

				{
					
					if($classaccount->checkPinCode($accountarray['realname'],$connauthme))

					{

					echo '<script type="text/javascript">window.location = "check-pin-code.php?name='.$accountarray['realname'].'";</script>';

					}

					else

					{

						$classaccount->convertPassword($accountarray['realname'],$password,$connauthme);

						$_SESSION['username']= $accountarray['username'];

						$_SESSION['password']= $accountarray['password'];

						$_SESSION['realname']= $accountarray['realname'];

						$_SESSION['email']= $accountarray['email'];

						$_SESSION['regdate']= $accountarray['regdate'];

						$_SESSION['lastlogin']= $accountarray['lastlogin'];

						$_SESSION['power']= $powername;
						
						echo '<script type="text/javascript">Swal.close();</script>';

						echo '<script type="text/javascript">toastr.success("Đăng nhập thành công!");</script>';

						echo '<script type="text/javascript">window.location = "profile.php";</script>';

					}

				}

			}

			else {

				echo '<script type="text/javascript">toastr.error("Tài khoản hoặc mật khẩu không đúng!");</script>';
				echo '<script type="text/javascript">Swal.close();</script>';
			} 

		}

		else

		{

        echo '<script type="text/javascript">toastr.error("Tài khoản không tồn tại!");</script>';
	echo '<script type="text/javascript">Swal.close();</script>';

        } 

	}

	else if (!filter_var($username, FILTER_VALIDATE_EMAIL)) 

	{

		if($classaccount->getAccount($username,$connauthme) != false)

		{

		$accountarray = $classaccount->getAccount($username,$connauthme);

		$powername = $classaccount->getPower($accountarray['username'],$connluckperms);

		$return_var = $classaccount->check_password_db($accountarray['realname'],$password,$connauthme);

			if($return_var == true) 

			{

				$uuid = $classpoints->getUUID($accountarray['realname']);

				if($classaccount->checkPlayerBan($classaccount,$uuid,$username,$conn))

				{

					$banarray = $classaccount->checkPlayerBan($classaccount,$uuid,$username,$conn);

					$time_converted = $classaccount->converttime($banarray['time']);

					echo "<script type='text/javascript'>sendBannedDialog('".$banarray['username']."','".$banarray['reason']."','".$time_converted."','".$banarray['server_origin']."');</script>";

				}

				else if($classaccount->checkPlayerBan($classaccount,$uuid,$username,$conn)==false)

				{

					if($classaccount->checkPinCode($accountarray['realname'],$connauthme))

					{

					echo '<script type="text/javascript">window.location = "check-pin-code.php?name='.$accountarray['realname'].'";</script>';

					}

					else

					{

					$classaccount->convertPassword($accountarray['realname'],$password,$connauthme);

					$_SESSION['username']= $accountarray['username'];

					$_SESSION['password']= $accountarray['password'];

					$_SESSION['realname']= $accountarray['realname'];

					$_SESSION['email']= $accountarray['email'];

					$_SESSION['regdate']= $accountarray['regdate'];

					$_SESSION['lastlogin']= $accountarray['lastlogin'];

					$_SESSION['power']= $powername;

					echo '<script type="text/javascript">Swal.close();</script>';

					echo '<script type="text/javascript">toastr.success("Đăng nhập thành công!");</script>';

					echo '<script type="text/javascript">window.location = "profile.php";</script>';

					}

				}

			}

			else {

				echo '<script type="text/javascript">toastr.error("Tài khoản hoặc mật khẩu không đúng!");</script>';
				echo '<script type="text/javascript">Swal.close();</script>';

			}

		}

		else

		{

        echo '<script type="text/javascript">toastr.error("Tài khoản không tồn tại!");</script>';
	echo '<script type="text/javascript">Swal.close();</script>';

        }

	}



//            if($classaccount->getPower($accountarray['realname'],$connluckperms)!="Member")

//            {

//                $realnamestaff = $accountarray['realname'];

//                header("location: authen/index.php?name=".$realnamestaff."");

//                exit();

//           }

//            if($classaccount->checkTOTP($accountarray['username'],$connauthme)==true)

//            {

//                $realnametotp = $accountarray['realname'];

//                header("location: authen-member/index.php?name=".$realnametotp."");

//                exit();

//            }            

//            else

//            { 

}

}    

?>