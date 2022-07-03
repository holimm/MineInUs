<?php



class account

{

	public function getAccount($username,$conn)

	{

	$account = array();

		if (filter_var($username, FILTER_VALIDATE_EMAIL)) 

		{

			$sql = "SELECT * FROM AUTHME WHERE EMAIL=? LIMIT 1";

			$stmt = $conn->prepare($sql);

			$stmt->bind_param('s', $username);

			$stmt->execute();

			$result = $stmt->get_result();

			$user = $result->fetch_assoc();

			$row = $result->num_rows;

			if($row==0)

			{

			return false;

			}

			else 

			{

			$account = array("username"=>$user['LOWERCASENICKNAME'],"password"=>$user['HASH'],"realname"=>$user['NICKNAME'],"email"=>$user['EMAIL'],"regdate"=>$user['REGDATE'],"lastlogin"=>$user['LASTLOGIN']);

			return $account;

			}

		}

		else 

		{

			$sql = "SELECT * FROM AUTHME WHERE NICKNAME=? LIMIT 1";

			$stmt = $conn->prepare($sql);

			$stmt->bind_param('s', $username);

			$stmt->execute();

			$result = $stmt->get_result();

			$user = $result->fetch_assoc();

			$row = $result->num_rows;

			if($row==0)

			{

			return false;

			}

			else 

			{

			$account = array("username"=>$user['LOWERCASENICKNAME'],"password"=>$user['HASH'],"realname"=>$user['NICKNAME'],"email"=>$user['EMAIL'],"regdate"=>$user['REGDATE'],"lastlogin"=>$user['LASTLOGIN']);

			return $account;

			}

		}		

	}

	public function getAccountTemp($username,$conn)

	{

	$account = array();

		if (filter_var($username, FILTER_VALIDATE_EMAIL)) 

		{

			$sql = "SELECT * FROM accounttemp WHERE EMAIL=? LIMIT 1";

			$stmt = $conn->prepare($sql);

			$stmt->bind_param('s', $username);

			$stmt->execute();

			$result = $stmt->get_result();

			$user = $result->fetch_assoc();

			$row = $result->num_rows;

			if($row==0)

			{

			return false;

			}

			else 

			{

			$account = array("username"=>$user['LOWERCASENICKNAME'],"password"=>$user['HASH'],"realname"=>$user['NICKNAME'],"email"=>$user['EMAIL'],"regdate"=>$user['REGDATE'],"exp_date"=>$user['exp_date']);

			return $account;

			}

		}

		else 

		{

			$sql = "SELECT * FROM accounttemp WHERE NICKNAME=? LIMIT 1";

			$stmt = $conn->prepare($sql);

			$stmt->bind_param('s', $username);

			$stmt->execute();

			$result = $stmt->get_result();

			$user = $result->fetch_assoc();

			$row = $result->num_rows;

			if($row==0)

			{

			return false;

			}

			else 

			{

			$account = array("username"=>$user['LOWERCASENICKNAME'],"password"=>$user['HASH'],"realname"=>$user['NICKNAME'],"email"=>$user['EMAIL'],"regdate"=>$user['REGDATE'],"exp_date"=>$user['exp_date']);

			return $account;

			}

		}

	}		

	public function getPower($username,$conn)

	{

	$powername="";

	$sql = "SELECT * FROM luckperms_players WHERE username=? LIMIT 1";

	$stmt = $conn->prepare($sql);

	$stmt->bind_param('s', $username);

	$stmt->execute();

	$result = $stmt->get_result();

	$power = $result->fetch_assoc();

	$numrows = mysqli_num_rows($result);

	if($numrows==0)

	{

		return $powername="Member";

	}

	else

	{

		$powername = $power['primary_group'];

		if($powername =="default")

			{

				return $powername="Member";

			}

		else if($power['primary_group']=="owner" || $power['primary_group']=="builder" || $power['primary_group']=="moderator")

			{

				$powerreal = ucfirst($powername);

				return $powerreal;

			}

		}

	}

	

	public function check_password_db($realname,$password,$conn) {

	  $a=mysqli_query($conn,"SELECT HASH FROM AUTHME where NICKNAME = '$realname'");

	  if(mysqli_num_rows($a) == 1 ) {

		$password_info=mysqli_fetch_array($a);

		$sha_info = explode("$",$password_info[0]);

	  } else {

		return false;

	  }	

	  if( $sha_info[1] === "SHA" ) 

	  {

		$salt = $sha_info[2];

		$sha256_password = hash('sha256', $password);

		$sha256_password .= $sha_info[2];;

		if( strcasecmp(trim($sha_info[3]),hash('sha256', $sha256_password) ) == 0 ) 

		  return true;

		else return false;

	  }

	  if( $sha_info[1] === "2a" || $sha_info[1] === "a") 

	  {

		  $sqlcheckpassword = "SELECT * FROM AUTHME WHERE NICKNAME =?";

		  $stmt = $conn->prepare($sqlcheckpassword);

		  $stmt->bind_param('s',$realname);

		  $stmt->execute();

		  $result = $stmt->get_result();

		  $row = $result->fetch_assoc();

		  return (crypt($password, $row['HASH']) === $row['HASH']);

	  }

	}

	public function convertPassword($realname,$password,$conn){

	$a=mysqli_query($conn,"SELECT HASH FROM AUTHME where NICKNAME = '$realname'");

	  if(mysqli_num_rows($a) == 1 ) {

		$password_info=mysqli_fetch_array($a);

		$sha_info = explode("$",$password_info[0]);

	  } else {

		return false;

	  }	

	  if( $sha_info[1] === "SHA" ) 

	  {

		$password_encrypted = $this->hashBcrypt($password, $cost = null);

		$sqlconvertpassword = "UPDATE AUTHME SET HASH = ? WHERE NICKNAME = ?";

		$stmt = $conn->prepare($sqlconvertpassword);

		$stmt -> bind_param('ss', $password_encrypted, $realname);

		$stmt->execute();

	  }

	}

	public function checkPlayerBan($classaccount,$uuid,$realname,$conn)

	{

		$banarray = array();

		$sql = "SELECT * FROM litebans_bans WHERE uuid=? LIMIT 1";

		$stmt = $conn->prepare($sql);

		$stmt->bind_param('s',$uuid);

		$stmt->execute();

		$result = $stmt->get_result();

		$row = $result->fetch_assoc();

		$numrow = mysqli_num_rows($result);

		if($numrow==1)

		{

			if($row['active']=='1' && $row['until'] == '0')

			{

			$account = array("username"=>$realname,"reason"=>$row['reason'],"time"=>$row['time'],"until"=>$row['until'],"server_origin"=>$row['server_origin'],"active"=>$row['active']);

			return $account;

			}

			else if($row['active']=='1' && $row['until'] != '0')

			{

			return false;

			}

		}

		else if ($numrow==0)

		{

			return false;

		}

	}

	public function checkTimeBan($classaccount, $uuid, $conn)

	{

		$banarray = array();

		$sql = "SELECT * FROM litebans_bans WHERE uuid=? LIMIT 1";

		$stmt = $conn->prepare($sql);

		$stmt->bind_param('s',$uuid);

		$stmt->execute();

		$result = $stmt->get_result();

		$row = $result->fetch_assoc();

		$numrow = mysqli_num_rows($result); 

		if($numrow==1)

		{

			if($row['active']=='1' && $row['until'] != '0')

			{

			$account = array("reason"=>$row['reason'],"time"=>$row['time'],"until"=>$row['until'],"server_origin"=>$row['server_origin'],"active"=>$row['active']);

			return $account;

			}

			else

			{

			return false;

			}

		}

		else if ($numrow==0)

		{

			return false;

		}

	}

	public function checkPinCode($realname,$conn)

	{

		$sql = "SELECT * FROM auth WHERE username=? LIMIT 1;";

		$stmt = $conn->prepare($sql);

		$stmt->bind_param('s',$realname);

		$stmt->execute();

		$result = $stmt->get_result();

		$row = $result->fetch_assoc();

		$numrows = mysqli_num_rows($result);

		if($numrows==0)

		{

			return false;

		}

		if($numrows!=0)

		{

			return true;

		}

	}

	public function checkPinCodeDecode($realname,$pincode,$conn) {

	  $a=mysqli_query($conn,"SELECT mycode FROM auth where username = '$realname'");

	  if(mysqli_num_rows($a) == 1 ) {

		$password_info=mysqli_fetch_array($a);

		$sha_info = explode("$",$password_info[0]);

	  } else 

		return false;

	  if( $sha_info[1] === "SHA" ) {

		$salt = $sha_info[2];

		$sha256_password = hash('sha256', $pincode);

		$sha256_password .= $sha_info[2];;

		if( strcasecmp(trim($sha_info[3]),hash('sha256', $sha256_password) ) == 0 ) 

		  return true;

		else return false;

	  }

	}

	public function hideEmail($email)

	{

		if(filter_var($email, FILTER_VALIDATE_EMAIL))

		{

			list($first, $last) = explode('@', $email);

			$first = str_replace(substr($first, '1'), str_repeat('*', strlen($first)-3), $first);

			$last = explode('.', $last);

			$last_domain = str_replace(substr($last['0'], '1'), str_repeat('*', strlen($last['0'])-1), $last['0']);

			$hideEmail = $first.'@'.$last_domain.'.'.$last['1'];

			return $hideEmail;

		}

	}

//	function converttime($date)

//	{

//		$datechange = $date/1000;

//		$timeEng = ['Sun','Mon','Tue','Wed', 'Thu', 'Fri', 'Sat', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

//		$timeVie = ['Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy','Một', 'Hai', 'Ba', 'Tư', 'Năm', 'Sáu', 'Bảy', 'Tám', 'Chín', 'Mười', 'Mười Một', 'Mười Hai'];

//		$unixtime_to_date = date('D, \N\g\à\y d \T\h\á\n\g M \N\ă\m Y ,H \G\i\ờ i \P\h\ú\t', $datechange);

//		$time = str_replace( $timeEng, $timeVie, $unixtime_to_date);

//		return $time;

//	}

	public function converttime($date)

	{

		$datechange = $date/1000;

		$timeEng = ['Sun','Mon','Tue','Wed', 'Thu', 'Fri', 'Sat', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

		$timeVie = ['Chủ Nhật', 'Thứ Hai', 'Thứ Ba', 'Thứ Tư', 'Thứ Năm', 'Thứ Sáu', 'Thứ Bảy','1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];

		$unixtime_to_date = date('d-M-Y H:i:s', $datechange);

		$time = str_replace( $timeEng, $timeVie, $unixtime_to_date);

		return $time;

	}

	

	public function getUserIP() {

    if( array_key_exists('HTTP_X_FORWARDED_FOR', $_SERVER) && !empty($_SERVER['HTTP_X_FORWARDED_FOR']) ) {

        if (strpos($_SERVER['HTTP_X_FORWARDED_FOR'], ',')>0) {

            $addr = explode(",",$_SERVER['HTTP_X_FORWARDED_FOR']);

            return trim($addr[0]);

        } else {

            return $_SERVER['HTTP_X_FORWARDED_FOR'];

        }

    }

    else {

        return $_SERVER['REMOTE_ADDR'];

		}

	}



	public function generateRandomSalt() {

		$seed = uniqid(mt_rand(), true);

		$salt = base64_encode($seed);

		$salt = str_replace('+', '.', $salt);

		return substr($salt, 0, 22);

	}

	public function hashBcrypt($string, $cost = null) {

		if (empty($cost)) {

			$cost = 10;

		}

		$salt = $this->generateRandomSalt();

		$hashString = $this->generateHashString((int)$cost, $salt); 

		return crypt($string, $hashString);

	}

	function generateHashString($cost, $salt) {

		return sprintf('$%s$%02d$%s$', '2a', $cost, $salt);

	}

}

?>