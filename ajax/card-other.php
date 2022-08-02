<?php
require_once("../controller/authController.php");
//include(__DIR__ ."/../api/config.php");
if ($_POST['card_type']=='' || $_POST['card_amount']=='' || $_POST['username']=='')
{
	exit('<script type="text/javascript">toastr.error("Vui Lòng Nhập Đầy Đủ Thông Tin !");</script>');
}
else 
{
    $username = $_POST['username'];
    $usernamelowercase = strtolower($username);
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
	$secret=$captchaSecretKey; 
	$response=$_POST["captcha"];
	$verify=file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret={$secret}&response={$response}");
	$captcha_success=json_decode($verify);
	if ($captcha_success->success==true) 
	{
		$loaithe = $_POST['card_type']; // string
		$menhgia = $_POST['card_amount']; // string 
        $expFormat = mktime(date("H"), date("i"), date("s"), date("m") ,date("d")-3, date("Y"));
        $expDate = date("Y-m-d H:i:s",$expFormat);
        $sqlchecknumber = "SELECT * FROM trans_log_other WHERE name=? AND status = '0' AND type=? AND dateput > ?";
        $stmt = $conn->prepare($sqlchecknumber);
        $stmt->bind_param('sss',$username,$loaithe,$expDate);
        $stmt->execute();
        $result = $stmt->get_result();
        $numrow = mysqli_num_rows($result);
        if($numrow == 2)
        {
            echo '<script type="text/javascript">Swal.fire("Thất bại", "Bạn gửi ticket quá 2 lần!", "error");</script>';	
            echo '<script type="text/javascript">grecaptcha.reset();</script>';
        }
        else
        {
		$conn->query("Insert into trans_log_other (name,amount,type) values ('".$username."',".$menhgia.",'".$loaithe."')");
        $sqlchecknumber = "SELECT * FROM trans_log_other WHERE name = ? ORDER BY id DESC";
        $stmt = $conn->prepare($sqlchecknumber);
        $stmt->bind_param('s',$username);
        $stmt->execute();
        $result = $stmt->get_result();
        $rowchecknumber = $result->fetch_assoc();
        if($_POST['card_type']=="Momo")
        {
            echo "<script type='text/javascript'>Swal.fire({
	          title: 'Mã QR Momo',
	          html: 'Ticket đã được gửi đi<br>MÃ TICKET: <b>".strtoupper($loaithe)."-".$rowchecknumber['id']."</b><br>Hãy quét mã và chuyển tiền theo mệnh giá đã chọn theo cú pháp (Tên Ingame, <b>".strtoupper($loaithe)."-".$rowchecknumber['id']."</b>, Mệnh giá)',
	          imageUrl: 'img/icon/momoqr.jpg',
	          confirmButtonColor: '#5cb85c',
	          confirmButtonText: 'Xác nhận',
		        }).then((result) => {
		          if (result.isConfirmed) 
		          {
			        Swal.fire('Thành công','Bạn đã gửi phiếu thành công, hãy đợi xác nhận nhé!' , 'success');
                    grecaptcha.reset();
                    $('#card_amount').reset();	
		          }
		        })	
                </script>";	
            echo '<script type="text/javascript">grecaptcha.reset();</script>';
        }
        if($_POST['card_type']=="ATM")
        {
            echo "<script type='text/javascript'>Swal.fire({
	          title: 'ATM',
	          html: 'Ngân Hàng: SCB (Saigon Commercial Bank)<br>STK: 42414911302 <br> TÊN CHỦ TK: LUONG NGOC THIEN<br>CHI NHÁNH: PGD BINH THANH<hr>Ticket đã được gửi đi<br>MÃ TICKET: <b>".strtoupper($loaithe)."-".$rowchecknumber['id']."</b><br>Hãy chuyển khoản theo mệnh giá đã chọn theo cú pháp (Tên Ingame, <b>".$loaithe."-".$rowchecknumber['id']."</b>, Mệnh giá)',
	          confirmButtonColor: '#5cb85c',
	          confirmButtonText: 'Xác nhận',
		        }).then((result) => {
		          if (result.isConfirmed) 
		          {
			        Swal.fire('Thành công','Bạn đã gửi phiếu thành công, hãy đợi xác nhận nhé!' , 'success');
                    grecaptcha.reset();
                    $('#card_amount').reset();	
		          }
		        })	;</script>";	
            echo '<script type="text/javascript">grecaptcha.reset();</script>';
        }
        //Discord Send Message
        $webhookurl = "";
        $timestamp = date("c", strtotime("now"));
        $json_data = json_encode([
            // Message
            "content" => "Hệ thống nhận được 1 ticket ủng hộ server bằng ".$loaithe,
    
            "username" => "MineInUs",

            "tts" => false,

            "embeds" => [
                [
                    "title" => "Ticket Ủng hộ server bằng ".$loaithe,

                    "type" => "rich",

                    "description" => "",

                    "url" => "https://mineinus.com/",

                    "timestamp" => $timestamp,

                    "color" => hexdec( "3366ff" ),

                    "footer" => [
                        "text" => "MineInUs System",
                        //"icon_url" => ""
                    ],

//                    "image" => [
 //                       "url" => ""
 //                   ],

                    // Thumbnail
                    "thumbnail" => [
                        "url" => "https://secure.gravatar.com/avatar/173c156882b8a11516448aba002006f1"
                    ],

                    "author" => [
                        "name" => "MineInUs",
                        "url" => "https://mineinus.com/"
                    ],

                    "fields" => [
                        // Field 1
                        [
                            "name" => "Tên Player",
                            "value" => $username,
                            "inline" => false
                        ],
                        // Field 2
                        [
                            "name" => "Mã Ticket",
                            "value" => $rowchecknumber['id'],
                            "inline" => false
                        ],
                        // Field 3
                        [
                            "name" => "Số tiền",
                            "value" => number_format($menhgia)."đ",
                            "inline" => true
                        ]
                        // Etc..
                    ]
                ]
            ]

        ], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE );


        $ch = curl_init( $webhookurl );
        curl_setopt( $ch, CURLOPT_HTTPHEADER, array('Content-type: application/json'));
        curl_setopt( $ch, CURLOPT_POST, 1);
        curl_setopt( $ch, CURLOPT_POSTFIELDS, $json_data);
        curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt( $ch, CURLOPT_HEADER, 0);
        curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);

        $response = curl_exec( $ch );
        // If you need to debug, or find out why you can't send message uncomment line below, and execute script.
        // echo $response;
        curl_close( $ch );
        //Discord Send Message	
        }
	}
	else if ($captcha_success->success==false) 
	{
		echo '<script type="text/javascript">toastr.error("Nhập captcha không thành công!");</script>';
        echo '<script type="text/javascript">grecaptcha.reset();</script>';
	}
    }
} 
?>
