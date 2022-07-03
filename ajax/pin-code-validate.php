<?php

require_once("../controller/authController.php");

if(isset($_POST['pincode'])){

$pincode = $_POST['pincode'];

$realname = $_POST['realname'];

	if($pincode=='')

	{

		echo '<script type="text/javascript">toastr.error("Hãy nhập mã pin!");</script>';

	}

	else

	{

		if(strlen($pincode)!=6)

		{

			echo '<script type="text/javascript">toastr.error("Hãy nhập đầy đủ 6 số!");</script>';

		}

		else

		{

			$return_var = $classaccount->checkPinCodeDecode($realname,$pincode,$connauthme);

			if($return_var == true) 

			{

			$accountarray = $classaccount->getAccount($realname,$connauthme);

			$powername = $classaccount->getPower($accountarray['username'],$connluckperms);

			$_SESSION['username']= $accountarray['username'];

			$_SESSION['password']= $accountarray['password'];

			$_SESSION['realname']= $accountarray['realname'];

			$_SESSION['email']= $accountarray['email'];

			$_SESSION['regdate']= $accountarray['regdate'];

			$_SESSION['lastlogin']= $accountarray['lastlogin'];

			$_SESSION['power']= $powername;

			echo '<script type="text/javascript">toastr.success("Đăng nhập thành công!");</script>';

			echo '<script type="text/javascript">window.location = "profile.php";</script>';

			}

			else

			{

			echo '<script type="text/javascript">toastr.error("Sai mã pin!");</script>';

			}

		}

	}

}    

?>