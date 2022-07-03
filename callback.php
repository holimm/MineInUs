<?php

include(__DIR__ ."/api/config.php");

require_once('controller/authController.php');
require_once ("controller/class/points.php");

	$validate = ValidateCallback($_POST);

	if($validate != false) { //Nếu xác thực callback đúng thì chạy vào đây.

		$status = $validate['status']; //Trạng thái thẻ nạp, thẻ thành công = thanhcong , Thẻ sai, thẻ sai mệnh giá = thatbai

		$serial = $validate['serial']; //Số serial của thẻ.

		$pin = $validate['pin']; //Mã pin của thẻ.

		$card_type = $validate['card_type']; //Loại thẻ. vd: Viettel, Mobifone, Vinaphone.

		$amount = $validate['amount']; //Mệnh giá của thẻ. nếu bạn sài thêm hàm sai mệnh giá vui lòng sử dụng thêm hàm này tự cập nhật mệnh giá thật kèm theo desc là mệnh giá củ

		$real_amount = $validate['real_amount']; // thực nhận đã trừ chiết khấu

		$content = $validate['content']; // id transaction 

		$result = $conn->query("SELECT * FROM `trans_log` WHERE status = 0 AND trans_id = '{$content}' AND pin = '{$pin}' AND seri = '{$serial}' AND type = '{$card_type}'");



if ($result->num_rows > 0){

    $result = $result->fetch_array(MYSQLI_ASSOC);

	print_r($result);

	if($status == 'thanhcong') {

			//Xử lý nạp thẻ thành công tại đây.

			$name = $result['name'];

			$xuwobonus = $amount/1000;

			$xuexact = $xuwobonus - ($xuwobonus*$donate_commission);

			$xu = $xuexact + ($xuexact * $donate_percent_bonus);

			$classpoints = new points();

			$uuid = $classpoints->getUUID($name);

			$conn->query("UPDATE playerpoints_points SET points = points + $xu WHERE uuid ='".$uuid."';");

			$conn->query("UPDATE `trans_log` SET `status` = 1 WHERE `id` = {$result['id']}"); // chuyển cho kết quả thành công      

			$webhookurl = "https://discord.com/api/webhooks/970860049499058196/k_NQDLpcF4xghE7SxG8mE8aePkNRYiyO1nudIZzzDd4831FgrBhg1yc3lCMm99BGPzyb";
	        $timestamp = date("c", strtotime("now"));
	        $json_data = json_encode([
	            // Message
	            "tts" => false,

	            "embeds" => [
	                [
	                    "title" => "Cảm ơn  ".$name."!",

	                    "type" => "rich",

	                    "description" => "Cảm ơn bạn đã ủng hộ <3",

	                    "thumbnail" => [
                        "url" => "https://cravatar.eu/avatar/".$name."/64.png"
                    	],

	                    "fields" => [
	                        // Field 1
	                        [
	                            "name" => "Loại thẻ:",
	                            "value" => $card_type,
	                            "inline" => true
	                        ],
	                        [
	                        	"name" => "Tên:",
	                        	"value" => $name,
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

		else if($status == 'saimenhgia') 

		{

			//Xử lý nạp thẻ sai mệnh giá tại đây.

           $conn->query("UPDATE `trans_log` SET status = 3, `amount` = {$amount} WHERE `id` = {$result['id']}"); // thất bại   

		} 

		else 

		{

			//Xử lý nạp thẻ thất bại tại đây.

           $conn->query("UPDATE `trans_log` SET status = 2 WHERE `id` = {$result['id']}"); // thất bại   

		}

		

		# Lưu log Nạp Thẻ 

		$file = "card.log";

        $fh = fopen($file,'a') or die("cant open file");

	    fwrite($fh,"Tai khoan: ".$result['name'].", data: ".json_encode($_POST));

	    fwrite($fh,"\r\n");

        fclose($fh);

	}

}



function ValidateCallback($out) { //Hàm kiểm tra callback từ sever

	if(isset(

		$out['status'],

		$out['serial'],

		$out['pin'],

		$out['card_type'],

		$out['amount'],

		$out['content'],

		$out['real_amount']

		)) {

		return $out; //xác thực thành công, return mảng dữ liệu từ sever trả về.

		

	} else {

		return false; //Xác thực callback thất bại.

	}

}