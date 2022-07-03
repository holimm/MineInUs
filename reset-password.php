<?php 

if(!isset($_GET['key'])||!isset($_GET['token']))

{

	header("location: login.php");

}

require_once 'controller/authController.php';

date_default_timezone_set('Asia/Ho_Chi_Minh');

?>

<!doctype html>

<html lang="en">

<head>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title><?php echo $title ?></title>

<link rel="icon" href="<?php echo $siteicon?>">

<link href="css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="css/toastr.css" />

<link rel="stylesheet" href="css/maincss.css">

<script src="css/bootstrap.bundle.min.js"></script>

<script src="css/jquery.min.js"></script>

<script src="css/toastr.js"></script>

<script src="css/sweetalert.js"></script>

</head>

<body>

	<div class="wrapper">	

		<?php

		if($_GET['key'] && $_GET['token'])

		{

			$email = $_GET['key'];

			$token = $_GET['token'];

			$query = "SELECT * FROM `AUTHME` WHERE `token`='".$token."' and `EMAIL`='".$email."';";

			$stmt = $connauthme->prepare($query);

			$stmt->execute();

			$result = $stmt->get_result();

			$rowcount = mysqli_num_rows($result);

			$row = $result->fetch_assoc();

			$curDate = date("Y-m-d H:i:s");

			if ($rowcount > 0) 

			{			

				if($row['exp_date'] >= $curDate)

				{

				?>

				<div class="view2 align-middle py-5">

					<div class="container d-none d-sm-block" style="width: 20%; margin-top: 5%">

							<a href="https://mineinus.com"><img class="img-fluid" src="img/icon/mineinusword.png"></a>

					</div>

					<div class="container d-none d-sm-block" style="background-color: rgba(255,255,255, 0.95); width: 40%">	  

						<div class="row" style="margin:auto">

						<div class="col-12 col-sm-12 text-center">

							<h2><br>Thay đổi mật khẩu</h2>

						</div>

						</div>

						<form class="form-horizontal" method="post" id="reset-password-final-form">

						<div id="status"></div>

							<input type="text" name="email" id="email" value="<?php echo $email;?>" hidden>

							<input type="text" name="reset_link_token" id="reset_link_token" value="<?php echo $token;?>" hidden>

							<div class="form-group">

								<div class="col-sm-12 my-4">

								<input type="password" class="form-control rounded-0" name='password' id='password' placeholder="Mật khẩu mới">

								</div>

								<div class="col-sm-12 my-4">

								<input type="password" class="form-control rounded-0" name='cpassword' id='cpassword' placeholder="Nhập lại mật khẩu">

								</div>

							</div>

							<hr class="hr-light">

							<button type="submit" class="btn btn-success" style="width:100%">Xác Nhận</button>

						</form>	

						<div class="col-sm-offset-2 col-sm-12"><br><br></div>

					</div>

				</div>

				<?php 

				} 

				else if ($row['exp_date'] < $curDate)

				{

				?>

				<div class="container-fluid" style="padding: 0">			

					<div class="view2 align-middle py-5"><br><br><br><br><br>

						<div class="mask rgba-black-light align-items-center">

						  <div class="container">

							<div class="row">

							  <div class="col-md-12 my-5 text-white text-center shadow" style="background-color: rgba(0,0,0, 0.8); margin-top: 10%">

								<h1 class="h1-reponsive my-5">LINK RESET MẬT KHẨU ĐÃ HẾT HIỆU LỰC</h1>

								<br>

								<a href="login.php"><h5 class="text-uppercase text-white mb-4">< Quay lại</h5></a>

							  </div>

							</div>

						  </div>

						</div>

					</div>	

				</div>	

				<?php

				}

			}		

			else if($rowcount == 0)

			{ 

				header("location: login.php");

			}

		}

		else

		{

			header("location: login.php");

		}

		?>

	</div>

<script type="text/javascript">

$('#reset-password-final-form').submit(function(e) {		

	e.preventDefault();

	var email = $('#email').val();

	var reset_link_token = $('#reset_link_token').val();

	var password = $('#password').val();

	var cpassword = $('#cpassword').val();

	$.ajax({

		url: "./ajax/crud/update-forget-password.php",

		type: "post",

		data: {email:email, reset_link_token:reset_link_token,password:password,cpassword:cpassword},

		success:function(data){

			$("#status").html(data);

			document.getElementById("reset-password-final-form").reset();

		}

	});

});

</script>

</body>

</html>