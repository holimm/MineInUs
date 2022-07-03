<?php

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

<script type="text/javascript">

function sendBannedDialog(username,reason,time,server_origin)

{

	Swal.fire({

	  title: 'Đăng nhập thất bại',

	  html: "Người chơi " + username + " đã bị ban vĩnh viễn<br>Lý do: " + reason + "<br>Bị ban vào ngày: " + time + "<br>Tại server: " + server_origin,

	  icon: 'error',

	})

}

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
		<div class="container-fluid" style="background-color: rgba(255,255,255, 0.95); margin-top: 1%">

			<div class="row" style="margin:auto">

			<div class="col-12 col-sm-12 text-center">
				
				<h2><br>Đăng Nhập</h2>

			</div>

			</div>

			<form class="form-horizontal" name='login-form' id='login-form' method="post">

			<div id="status"></div>

			<div class="form-group" style="margin-top: 2%">

				<div class="col-sm-12 my-4">

				<input type="text" class="form-control rounded-0" id="username" name="username" placeholder="Hãy nhập tên ingame hoặc email">

				</div>

			</div>

			<div class="form-group">

				<div class="col-sm-12 my-4">          

				<input type="password" class="form-control rounded-0" id="password" name="password" placeholder="Hãy nhập mật khẩu">

				</div>

			</div>

			<div class="form-group">        

				<div class="col-sm-offset-2 col-sm-12"  style="margin-top: 5%;">

				<button type="submit" class="btn btn-success rounded-0" style="width: 100%" name="login-btn">Đăng Nhập</button>

				</div>

			</div>

			</form>

			<hr class="hr-light">

			<div class="col-sm-offset-2 col-sm-12">

				<a href="register.php" class="btn btn-primary rounded-0" style="width: 100%" name="login-btn">Đăng ký tài khoản</a>

			</div>

			<div class="row" style="margin:auto">

			<div class="col-sm-12 text-center py-4">

				<p><a href="quen-mat-khau.php">Quên mật khẩu?</a></p>

			</div>	

			</div>

		</div></div>
    </div>

</div>

<script>

$('#menumodal').appendTo("body");

$('#login-form').submit(function(e) {		

	e.preventDefault();

	var username = $('#username').val();

	var password = $('#password').val();
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

		url: "./ajax/login-validate.php",

		type: "post",

		data: {username:username, password:password},

		success:function(data){

			$("#status").html(data);			
			document.getElementById("login-form").reset();

		}

	});

});

</script>

</body>

</html>