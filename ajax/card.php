<?php
require_once("../controller/authController.php");
require_once("../api/config.php");

if ($_POST['pin']=='' || $_POST['serial']=='' || $_POST['card_type']=='' || $_POST['card_amount']=='' || $_POST['username']=='')

{
	echo '<script type="text/javascript">toastr.error("Vui Lòng Nhập Đầy Đủ Thông Tin !");</script>';
	echo '<script type="text/javascript">grecaptcha.reset();</script>';
}

else {
	$username2 = $_POST['username'];
    $usernamelowercase = strtolower($username2);
    $sqlchecklogin = "SELECT * FROM luckperms_players WHERE username = ? LIMIT 1";
    $stmt = $connluckperms->prepare($sqlchecklogin);
    $stmt->bind_param('s',$usernamelowercase);
    $stmt->execute();
    $result = $stmt->get_result();    
    $numrowchecklogin = mysqli_num_rows($result);
    if($numrowchecklogin == 0)
    {
        echo '<script type="text/javascript">Swal.fire("Thất bại", "Bạn chưa đăng nhập lần đầu tại server!", "error");</script>';
    }
    else
    {
    $content = md5(time() . rand(0, 999999).microtime(true)); // có thể điền thông tin username và các thông tin khác sau đó sử dụng dấu "." để ngăn cách dữ liệu với nhau

	$seri = $conn->real_escape_string(strip_tags(addslashes($_POST['serial']))); // string

	$pin = $conn->real_escape_string(strip_tags(addslashes($_POST['pin']))); // string

	$loaithe = $conn->real_escape_string(strip_tags(addslashes($_POST['card_type']))); // string

	$menhgia = $conn->real_escape_string(strip_tags(addslashes($_POST['card_amount']))); // string

	$username = $conn->real_escape_string(strip_tags(addslashes($_POST['username']))); // string

		$url = "https://thesieutoc.net/chargingws/v2?APIkey=".$apikey."&mathe=".$pin."&seri=".$seri."&type=".$loaithe."&menhgia=".$menhgia."&content=".$content;

		$ch = curl_init();

		curl_setopt($ch, CURLOPT_URL, $url);

		curl_setopt($ch,CURLOPT_CAINFO, __DIR__ .'/../api/curl-ca-bundle.crt');

		curl_setopt($ch,CURLOPT_CAPATH, __DIR__ .'/../api/curl-ca-bundle.crt');

		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

		$out = json_decode(curl_exec($ch));
		############
		# mẫu gốc response:
		/*
		Json: {"status":"00","transaction_id":"3c51eb5dbf559927d6417d5b01c2c5ab","title":"Tha\u0300nh c\u00f4ng","msg":"Th\u1ebb \u0111\u00e3 \u0111\u01b0\u1ee3c g\u1eedi l\u00ean h\u1ec7 th\u1ed1ng vui l\u00f2ng ch\u1edd x\u1eed l\u00fd"}
		*/
		###########
		$http_code = 0;
		if (isset($out->status)){$http_code = 200;}
		curl_close($ch);
		// print_r($out);
	    if ($http_code == 200){                          
			if ($out->status == '00' || $out->status == 'thanhcong')
			{
				//Gửi thẻ thành công, đợi duyệt.
				$conn->query("Insert into trans_log (name,trans_id,amount,pin,seri,type) values ('".$username."','".$content."',".$menhgia.",'".$pin."','".$seri."','".$loaithe."')");
				echo '<script type="text/javascript">Swal.fire("Thành Công", "'.$out->msg.'", "success");</script>';		
				echo '<script type="text/javascript">grecaptcha.reset();</script>';						
            } 
			else if ($out->status != '00' && $out->status != 'thanhcong')
			{
				// thất bại ở đây
		       echo '<script type="text/javascript">toastr.error("'.$out->msg.'");</script>';
			   echo '<script type="text/javascript">grecaptcha.reset();</script>';
		    }
		} else {
			echo '<script type="text/javascript">toastr.error("Có lỗi máy chủ vui lòng thử lại sau!");</script>';
			echo '<script type="text/javascript">grecaptcha.reset();</script>';
		}
	}
}
?>