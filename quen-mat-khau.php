<?php 

if(isset($_SESSION['realname']))

{

	header("location: index.php");

}

require_once 'controller/authController.php';

?>



<!doctype html>

<html>

<head>

<meta charset="utf-8">

<title><?php echo $title ?></title>

<link rel="icon" href="<?php echo $siteicon?>">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/toastr.css" />

<link rel="stylesheet" href="css/maincss.css">

<script src="css/bootstrap.bundle.min.js"></script>

<script src="css/jquery.min.js"></script>

<script src="css/toastr.js"></script>

<script src="css/sweetalert.js"></script>

<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<script type="text/javascript">

function sendEmail() {

	var email = $('#email').val();

	var realname = $('#realname').val();

	$.ajax({

		url: "./controller/password-reset-token.php",

		type: "post",

		data: {email:email, realname:realname},

		success:function(data){

			$("#status").html(data);			

		}

	});

};

</script>

</head>

<body>



<div class="wrapper">

	<div class="view2 align-middle py-5">
		<div class="col-sm-12 col-md-5" style="margin:auto">

			<div class="container" style="width: 50%">

					<a href="https://mineinus.com"><img class="img-fluid" src="img/icon/mineinusword.png"></a>

			</div>
		</div>
		<div class="col-sm-12 col-md-5" style="margin:auto">
		<div class="container-fluid" style="background-color: rgba(255,255,255, 0.95)">  

			<div class="row" style="margin:auto">

			<div class="col-12 col-sm-12 text-center">

				<h2><br>Quên Mật Khẩu</h2>

			</div>

			</div>

            <form class="form-horizontal" method="post" id="password-reset-form">

			<div id='status'></div>

            <div class="form-group">

				  <div class="col-sm-12 my-4">

					  <input type="email" name="email" class="form-control rounded-0" id="email" placeholder="Hãy nhập email của bạn"> 

				  </div>

				  <div class="col-sm-12 my-4">

					  <input type="text" name="realname" class="form-control rounded-0" id="realname" placeholder="Hãy nhập đúng tên Ingame của bạn">

					  <small id="emailHelp" class="form-text text-muted">Chúng tôi sẽ không chia sẻ thông tin của bạn cho bất kì ai</small>

				  </div>

				  <div class="col-sm-12 my-4">

					<div class="g-recaptcha" data-sitekey="<?php echo $captchaSiteKey ?>"></div>

				  </div>

            </div>

			<div class="col-sm-offset-2 col-sm-12">

				<button type="submit" class="btn btn-success rounded-0 w-100" id="password-reset-btn">Xác nhận</button>

			</div>

            </form>

			<hr class="hr-light">

			<div class="col-sm-offset-2 col-sm-12 d-flex justify-content-between">

				<a href="register.php" class="btn btn-white rounded-0 px-5" >Quay lại đăng ký</a>

				<a href="login.php" class="btn btn-white rounded-0 px-5">Quay lại đăng nhập</a>

			</div>

			<div class="col-sm-offset-2 col-sm-12"><br></div>

        </div></div>

		<!-- Responsive Mobile -->



		<!-- Responsive Mobile -->

	</div> 

</div>

<script type="text/javascript">

$('#password-reset-form').submit(function(e) {		

	e.preventDefault();

	var email = $('#email').val();

	var realname = $('#realname').val();
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

		url: "./ajax/crud/password-email-reset.php",

		type: "post",

		data: {email:email, realname:realname,captcha: grecaptcha.getResponse()},

		success:function(data){

			$("#status").html(data);			

		}

	});

});

</script>

</body>

</html>