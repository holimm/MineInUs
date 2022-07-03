<?php

require_once 'controller/authController.php';

if($_GET['name']!="Shiru" && $_GET['name']!="SayWut")

{

	header("location: profile");

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

</head>

<body>

<div class="wrapper">

    <div class="view2 align-middle py-5">
		<div class="col-sm-12 col-md-5" style="margin:auto">
			<div class="container my-5" style="width: 50%">

				<a href="https://mineinus.com"><img class="img-fluid" src="img/icon/mineinusword.png"></a>

			</div>
		</div>
		<div class="col-sm-12 col-md-3" style="margin:auto">
		<div class="container" style="background-color: rgba(255,255,255, 0.95); margin-top: 1%">

			<div class="row" style="margin:auto">

			<div class="col-12 col-sm-12 text-center">

				<h2><br>Pin Code</h2>

			</div>

			</div>

			<form class="form-horizontal" name='pin-code-form' id='pin-code-form' method="post">

			<div id="status"></div>

			<div class="form-group" style="margin-top: 2%">

				<input type="text" id="realname" name="realname" value="<?php echo $_GET['name']?>" hidden>

				<div class="col-sm-12 my-4">

				<input type="password" class="form-control rounded-0" id="pincode" name="pincode" placeholder="Hãy nhập mã pin (6 số)">

				</div>

				<div class="g-recaptcha" data-sitekey="<?php echo $captchaSiteKey ?>"></div>	

			</div>						

			<hr class="hr-light">

			<div class="col-sm-offset-2 col-sm-12">

				<button type="submit" class="btn btn-primary rounded-0" style="width: 100%" name="pin-code-btn">Xác nhận</button>

			</div>

			</form>

			<div class="row" style="margin:auto">

			<div class="col-sm-12 text-center py-4"></div>	

			</div>

		</div></div>	

    </div>

</div>

<script>

$('#menumodal').appendTo("body");

$('#pin-code-form').submit(function(e) {		

	e.preventDefault();

	var realname = $('#realname').val();

	var pincode = $('#pincode').val();

	$.ajax({

		url: "./ajax/pin-code-validate.php",

		type: "post",

		data: {realname:realname, pincode:pincode},

		success:function(data){

			$("#status").html(data);

			document.getElementById("pin-code-form").reset();

		}

	});

});

</script>

</body>

</html>