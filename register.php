<?php

date_default_timezone_set('Asia/Ho_Chi_Minh');

require_once 'controller/authController.php';

if(!empty($_SESSION['realname']))

{

	header("location: profile.php");

}

?>



<!doctype html>

<html>

<head>

<meta charset="utf-8">

<title><?php echo $title ?></title>

<link rel="icon" href="<?php echo $siteicon?>">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/maincss.css">

<link href="css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/toastr.css" />

<link rel="stylesheet" href="css/maincss.css">

<script src="css/bootstrap.bundle.min.js"></script>

<script src="css/jquery.min.js"></script>

<script src="css/toastr.js"></script>

<script src="css/sweetalert.js"></script>

<script src="https://www.google.com/recaptcha/api.js?hl=vi"></script>

<script type="text/javascript">

function sendEmail() {

	var email = $('#email').val();

	var realname = $('#realname').val();

	$.ajax({

		url: "./controller/email-confirmation-token.php",

		type: "post",

		data: {email:email, realname:realname},

		success:function(data){

			$("#status").html(data);			

		}

	});

};

function confirmResend()

{

	Swal.fire({

	  title: 'Email xác nhận đã hết hiệu lực?',

	  text: "Bạn có muốn gửi lại email không?",

	  icon: 'warning',

	  showCancelButton: true,

	  confirmButtonColor: '#3085d6',

	  cancelButtonColor: '#d33',

	  confirmButtonText: 'Có, gửi lại email',

	  cancelButtonText: 'Không',

	}).then((result) => {

	  if (result.isConfirmed) 

	  {

		sendEmail()

	  }

	})

}

</script>

</head>

<body>

<div class="wrapper">

    <div class="view2 align-middle py-2">
		<div class="col-sm-12 col-md-5" style="margin:auto">

			<div class="container" style="width: 50%">

				<a href="https://mineinus.com"><img class="img-fluid" src="img/icon/mineinusword.png"></a>

			</div>
		</div>
		<div class="col-sm-12 col-md-5" style="margin:auto">
		<div class="container-fluid" style="background-color: rgba(255,255,255, 0.95)">

			<div class="row" style="margin:auto">

			<div class="col-12 col-sm-12 text-center">

				<h2><br>Đăng Ký</h2>

			</div>

			</div>

			<form class="form-horizontal" method="post" id="register-form">

			<div id="status"></div>

			<input type="text" class="form-control rounded-0" value="<?php echo $classaccount->getUserIP();?>" id="clientip" name="clientip" hidden>

			<div class="form-group" style="margin-top: 2%">

				<div class="col-sm-12 my-4">

				<input type="text" class="form-control rounded-0" id="realname" name="realname" placeholder="Hãy nhập tên ingame">

				</div>

			</div>

			<div class="form-group" style="margin-top: 2%">

				<div class="col-sm-12 my-4">

				<input type="text" class="form-control rounded-0" id="email" name="email" placeholder="Hãy nhập email xác nhận tài khoản">

				</div>

			</div>

			<div class="form-group">

				<div class="col-sm-12 my-4">          

				<input type="password" class="form-control rounded-0" id="password" name="password" placeholder="Hãy nhập mật khẩu ( Từ 8 ký tự trở lên )">

				</div>

			</div>

			<div class="form-group">

				<div class="col-sm-12 my-4">          

				<input type="password" class="form-control rounded-0" id="cpassword" name="cpassword" placeholder="Hãy nhập lại mật khẩu">

				</div>

			</div>

			<div class="form-group">

				<div class="col-sm-12 py-2">

					<div class="g-recaptcha" data-sitekey="<?php echo $captchaSiteKey ?>"></div>

				</div>

			</div>					

			<div class="form-group">        

				<div class="col-sm-offset-2 col-sm-12"  style="margin-top: 5%;">

				<button type="submit" class="btn btn-success rounded-0" style="width: 100%" name="register-btn">Đăng Ký</button>

				</div>

			</div>

			</form>

			<hr class="hr-light">

			<div class="col-sm-offset-2 col-sm-12">

				<a href="login.php" class="btn btn-white rounded-0" style="width: 100%">< Trở lại đăng nhập</a>

			</div>

			<div class="col-sm-offset-2 col-sm-12"><br></div>

		</div></div>	

    </div>

</div>

<script>

$('#menumodal').appendTo("body");

$('#register-form').submit(function(e) {		

	e.preventDefault();

	var realname = $('#realname').val();

	var email = $('#email').val();

	var clientip = $('#clientip').val();

	var password = $('#password').val();

	var cpassword = $('#cpassword').val();
	
	Swal.fire({
        	title: "Loading...",
		text: 'Hệ thống đang xử lý, chờ tí nhé!!',    
		imageUrl: 'img/icon/loading_modal.gif',
		imageHeight: 300,
		showConfirmButton: false,
		showCancelButton: false,    	
		allowOutsideClick: false,
      	});

	$.ajax({

		url: "./ajax/crud/register-insert.php",

		type: "post",

		data: {realname:realname, email:email, password:password,cpassword:cpassword,clientip:clientip,captcha: grecaptcha.getResponse(0)},

		success:function(data){

			$("#status").html(data);			

		}

	});

});

</script>

</body>

</html>