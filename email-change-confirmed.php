<?php 

date_default_timezone_set('Asia/Ho_Chi_Minh');

require_once 'controller/authController.php';

if(!isset($_GET['key'])||!isset($_GET['token']))

{

	header("location: profile");

}

require_once 'controller/authController.php';

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

			$newemail = $_GET['newemail'];

			$token = $_GET['token'];

			if(isset($_GET['realname']))

			{

				if($email == 'dc937b59892604f5a86ac96936cd7ff09e25f18ae6b758e8014a24c7fa039e91')

				{

				$realname = $_GET['realname'];

				$query = "SELECT * FROM `AUTHME` WHERE `token`='".$token."' and `NICKNAME`='".$realname."' LIMIT 1;";

				}

			}

			else

			{

			$query = "SELECT * FROM `AUTHME` WHERE `token`='".$token."' and `EMAIL`='".$email."' LIMIT 1;";

			}

			

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

					$email=$_GET['key'];

					$token=$_GET['token'];

					if($email == 'dc937b59892604f5a86ac96936cd7ff09e25f18ae6b758e8014a24c7fa039e91')

					{

						$sqlgetinfo = "SELECT * FROM AUTHME WHERE NICKNAME=? AND token=? LIMIT 1;";

						$stmt = $connauthme->prepare($sqlgetinfo);

						$stmt->bind_param("ss",$realname,$token);

						$stmt->execute();

						$result = $stmt->get_result();	

						$rownum = mysqli_num_rows($result);

						if($rownum!=0)

						{

							$sqlemailupdate = "UPDATE AUTHME SET EMAIL=? WHERE NICKNAME=?;";

							$stmt = $connauthme->prepare($sqlemailupdate);

							$stmt->bind_param('ss',$newemail,$realname);

							$stmt->execute();

							$sqlremovetoken = "UPDATE AUTHME SET token='',exp_date='' WHERE EMAIL=?";

							$stmt = $connauthme->prepare($sqlremovetoken);

							$stmt->bind_param('s',$newemail);

							$stmt->execute();

						}

					}

					else

					{

						$sqlgetinfo = "SELECT * FROM AUTHME WHERE EMAIL=? AND token=? LIMIT 1;";

						$stmt = $connauthme->prepare($sqlgetinfo);

						$stmt->bind_param("ss",$email,$token);

						$stmt->execute();

						$result = $stmt->get_result();	

						$rownum = mysqli_num_rows($result);

						if($rownum!=0)

						{

							$sqlemailupdate = "UPDATE AUTHME SET EMAIL=? WHERE EMAIL=?;";

							$stmt = $connauthme->prepare($sqlemailupdate);

							$stmt->bind_param('ss',$newemail,$email);

							$stmt->execute();

							$sqlremovetoken = "UPDATE AUTHME SET token='',exp_date='' WHERE EMAIL=?";

							$stmt = $connauthme->prepare($sqlremovetoken);

							$stmt->bind_param('s',$newemail);

							$stmt->execute();

						}

					}					

				?>

				<div class="view2 align-middle py-5">

					<div class="container d-none d-sm-block" style="width: 20%; margin-top: 5%">

							<a href="https://mineinus.com"><img class="img-fluid" src="img/icon/mineinusword.png"></a>

					</div>

					<div class="container d-none d-sm-block " style="background-color: rgba(255,255,255, 0.95); width: 40%">	

						<div class="col-12 col-sm-12 text-center"><br><br>

							<img src="img/icon/success.svg" width="15%" class="img-fluid mx-auto d-block">

							<h2><br>Đã thay đổi email thành công</h2><br>

							<a href="login.php"><p>< Quay lại</p></a>

						</div>

						<div class="col-sm-offset-2 col-sm-12"><br></div>

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

								<h1 class="h1-reponsive my-5">LINK XÁC NHẬN EMAIL ĐÃ HẾT HIỆU LỰC</h1>

								<br>

								<a href="profile.php"><h5 class="text-uppercase text-white mb-4">< Quay lại</h5></a>

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

				header('location: profile');

			}

		}

		?>

	</div>

</body>

</html>