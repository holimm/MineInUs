<?php    

    session_start();

    require ("class/connection.php");

    require ("class/account.php");  

    header("Content-type: text/html; charset=utf-8");



    $classaccount = new account();

    $classconnection = new connection();

    $conn = $classconnection->getConnect();

    $connauthme = $classconnection->getConnectAuthme();

    $connluckperms = $classconnection->getConnectLuckPerms();



    $captchaSecretKey = "6LeLcgMdAAAAADpp1WAHR5RQLfg45SWxcl_2esaI";

    $captchaSiteKey = "6LeLcgMdAAAAAHMbA_HgF0kL4mFMw23XIipVjY6G";



    $donate_commission = getLinkCardValue('commission', $conn)/100;

    $donate_percent_bonus = getLinkCardValue('percent_bonus', $conn)/100;
	
    $donate_desc = getLinkCardValue('desc', $conn);



	$error = "";

    $realname = "";

	$username = "";	

	$title = "Mine In US - Minecraft Server Việt Nam";

    $siteicon="img/icon/mineinusiconwoword.png";

	

	$facebook = "Facebook";

	$discord = "Discord";

  

function getLinkSocialMedia($name, $conn)

{

	$socialmediaQuery = "SELECT * FROM socialmedia WHERE name=? LIMIT 1;";

    $stmt = $conn->prepare($socialmediaQuery);

    $stmt->bind_param('s',$name);

    $stmt->execute();

    $result = $stmt->get_result();

	$row = mysqli_fetch_assoc($result);

	$link = $row['link'];	

	$stmt->close();

	return $link;

}

function getLinkCardValue($name, $conn)

{

	$sql = "SELECT * FROM card_value WHERE name=? LIMIT 1;";

    $stmt = $conn->prepare($sql);

    $stmt->bind_param('s',$name);

    $stmt->execute();

    $result = $stmt->get_result();

	$row = $result->fetch_assoc();
	if($name == 'desc')
	{
		$value = $row['desc'];
		$stmt->close();
		return $value;
	}
	else 
	{

		$value = $row['percent'];	

    		if($value > 100 && $row['name']=='commission')

    		{

        	$stmt->close();

        	return 100;

    		}

    		if($value > 100 && $row['name']=='percent_bonus')

    		{

        	$stmt->close();

        	return 0;

    		}

		else

    		{

        	$stmt->close();

        	return $value;

    		}
	}

}

function getDataRefresh($connauthme,$connluckperms,$classaccount, $username)

{

    $accountarray = $classaccount->getAccount($username,$connauthme);

	$powername = $classaccount->getPower($accountarray['username'],$connluckperms);

	$_SESSION['username']= $accountarray['username'];

	$_SESSION['password']= $accountarray['password'];

	$_SESSION['realname']= $accountarray['realname'];

	$_SESSION['email']= $accountarray['email'];

	$_SESSION['regdate']= $accountarray['regdate'];

	$_SESSION['lastlogin']= $accountarray['lastlogin'];

	$_SESSION['power']= $powername;

}

$linkfacebook = getLinkSocialMedia($facebook, $conn);

$linkdiscord = getLinkSocialMedia($discord, $conn);



//log out user

if(isset($_GET['logout']))

{

    session_destroy();

    unset($_SESSION['id']);

    unset($_SESSION['username']);

    // unset($_SESSION['verified']);

    unset($_SESSION['password']);

    unset($_SESSION['realname']);

	unset($_SESSION['email']);

	unset($_SESSION['regdate']);

	unset($_SESSION['lastlogin']);

	unset($_SESSION['power']);

    header('location: login.php');

    exit();

}



?>