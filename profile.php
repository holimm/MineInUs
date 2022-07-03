<?php 

require_once 'controller/authController.php';

require_once 'controller/class/points.php';

date_default_timezone_set('Asia/Ho_Chi_Minh');

if(!isset($_SESSION['realname']))

{

    header("location: login");

    exit();

}

if(!empty($_SESSION['realname']))

{

		$classpoints = new points();

		$uuid = $classpoints->getUUID($_SESSION['realname']);

		$user_points = $classpoints->getPlayerPoint($uuid,$conn);

        getDataRefresh($connauthme,$connluckperms,$classaccount,$_SESSION['realname']);

}
$regdate = $_SESSION['regdate'];

$lastlogin = $_SESSION['lastlogin'];

$classacount = new account();

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

</head>

<script>

	$(document).ready(function(){

		activaTab('detailtab');

	});

	function sendEmail() {

	var iduser = $('#iduser').val();

	var email = $('#email').val();

	var emailold = $('#emailold').val();

	$.ajax({

		url: "./controller/email-change-token.php",

		type: "post",

		data: {iduser:iduser, email:email, emailold:emailold},

		success:function(data){

			$("#status").html(data);	

			}

		});

	};

	function sendBannedDialog(username,reason,time,server_origin)

	{

		Swal.fire({

		  title: 'Chi tiết thông tin ban',

		  html: "Người chơi " + username + " đã bị ban<br>Lý do: " + reason + "<br>Bị ban vào ngày: " + time + "<br>Tại server: " + server_origin,

		  icon: 'error',

		})

	}

	function activaTab(tab){

		$('.nav-tabs a[href="#' + tab + '"]').tab('activate');

	};

	function changeValue(type){

		if(type == "Momo" || type == "ATM")

		{

		document.getElementById('card_type').value = type;

		document.getElementById('type-text').innerHTML = 'Ủng hộ ' + type;	   

		$( '#donate-tab' ).find( 'a.active' ).removeClass( 'active' );

		$( '#donate-tab-' + type ).addClass( 'active' );

		document.getElementById("pin_tab").style.display = "none";

		document.getElementById("serial_tab").style.display = "none";

		document.getElementById("submit").style.display = "none";

		document.getElementById("submit-other").style.display = "block";

		$('#points_value_1').html("10<b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo 10*($donate_percent_bonus);}?></b>");

		$('#points_value_2').html("20<b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo 20*($donate_percent_bonus);}?></b>");

		$('#points_value_3').html("50<b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo 50*($donate_percent_bonus);}?></b>");

		$('#points_value_4').html("100<b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo 100*($donate_percent_bonus);}?></b>");

		$('#points_value_5').html("200<b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo 200*($donate_percent_bonus);}?></b>");

		$('#points_value_6').html("300<b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo 300*($donate_percent_bonus);}?></b>");

		$('#points_value_7').html("500<b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo 500*($donate_percent_bonus);}?></b>");

		$('#points_value_8').html("1000<b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo 1000*($donate_percent_bonus);}?></b>");

		if(type=="Momo") {

			$('#desc_donate_1').html("Bấm nút xác nhận, sau đó chuyển khoản theo đúng mệnh giá qua mã QR hiển thị trên màn hình, kèm theo nội dung chuyển khoản. Mỗi người chỉ được tối đa 2 ticket");

		}

		if(type=="ATM") {

			$('#desc_donate_1').html("Bấm nút xác nhận, sau đó chuyển khoản theo đúng mệnh giá qua thông tin ngân hàng hiển thị trên màn hình, kèm theo nội dung chuyển khoản. Mỗi người chỉ được tối đa 2 ticket");

		}

		$('#desc_donate_2').html("Points sẽ được chuyển vào tài khoản khi được duyệt");

		grecaptcha.reset();

		}

		else

		{

		document.getElementById('card_type').value = type;

		document.getElementById('type-text').innerHTML = 'Ủng hộ thẻ ' + type;	   

		$( '#donate-tab' ).find( 'a.active' ).removeClass( 'active' );

		$( '#donate-tab-' + type ).addClass( 'active' );

		document.getElementById("pin_tab").style.display = "block";

		document.getElementById("serial_tab").style.display = "block";

		document.getElementById("submit").style.display = "block";

		document.getElementById("submit-other").style.display = "none";		

		$('#points_value_1').html("<?php echo 10-(10*$donate_commission);?><b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo (10-(10*$donate_commission))*($donate_percent_bonus);}?></b>");

		$('#points_value_2').html("<?php echo 20-(20*$donate_commission);?><b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo (20-(20*$donate_commission))*($donate_percent_bonus);}?></b>");

		$('#points_value_3').html("<?php echo 50-(50*$donate_commission);?><b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo (50-(50*$donate_commission))*($donate_percent_bonus);}?></b>");

		$('#points_value_4').html("<?php echo 100-(100*$donate_commission);?><b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo (100-(100*$donate_commission))*($donate_percent_bonus);}?></b>");

		$('#points_value_5').html("<?php echo 200-(200*$donate_commission);?><b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo (200-(200*$donate_commission))*($donate_percent_bonus);}?></b>");

		$('#points_value_6').html("<?php echo 300-(300*$donate_commission);?><b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo (300-(300*$donate_commission))*($donate_percent_bonus);}?></b>");

		$('#points_value_7').html("<?php echo 500-(500*$donate_commission);?><b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo (500-(500*$donate_commission))*($donate_percent_bonus);}?></b>");

		$('#points_value_8').html("<?php echo 1000-(1000*$donate_commission);?><b class='text-success'><?php if($donate_percent_bonus!=0){ echo '+'; echo (1000-(1000*$donate_commission))*($donate_percent_bonus);}?></b>");

		$('#desc_donate_1').html("Hãy nhập thông tin Số Seri, Mã Nạp. Sau khi đã nhập, kiểm tra lại thật kỹ thông tin trước khi nhấn Nạp Ngay. Vì sai hệ thống sẽ không nhận và mất thẻ");

		$('#desc_donate_2').html("Points sẽ được chuyển vào tài khoản sau một vài phút");

		grecaptcha.reset();

		}   

	};  

</script>

<body>

<div class="container-fluid bg-white" style="padding:0">

<!-- HEADER TOP -->

<div class="header-top shadow">

	<div class="container-fluid" style="height: 100%;padding: 0">

		<div class="row" style="width: 100%">

			<div class="col col-sm-1"></div>

			<div class="col col-sm-6 d-none d-sm-block">

				<a href="https://mineinus.com"><img src="img/icon/mineinusword.png" width="20%"></a>

			</div>

			<div class="col col-sm-6 d-block d-sm-none">

				<a href="https://mineinus.com"><img src="img/icon/mineinusword.png" width="150%"></a>

			</div>

			<div class="col-4 col-sm-2 text-right"></div>

			<div class="col col-sm-3">

			<div class="box-log-in">

				<ul class="nav navbar-nav" style="width: 100%; height: 100%">

				<i class="bx bx-user-circle"></i>

				<span>

				<li class="nav-item dropdown">

				<img src="https://minotar.net/helm/<?php echo $_SESSION['realname']; ?>/190.png" alt="avatar" class="img-fluid" style="width: 20px;"> 

				<a class="dropdown-toggle text-dark" href="#" id="navbardrop" data-bs-toggle="dropdown" style="color: white">

				<?php echo $_SESSION['realname']; ?></a>

				<div class="dropdown-menu popout"  aria-haspopup="true" aria-expanded="false">

				<a class="dropdown-item" href="profile.php?logout=1">Đăng Xuất</a>

				</div>

				</li>

				</span>

				</ul>

			</div>

			</div>

		</div>

	</div>

</div>

<!-- ///HEADER TOP -->

<!-- PROFILE PAGE -->

<section class="h-100 gradient-custom-2">

  <div class="container h-100">

    <div class="row d-flex justify-content-center align-items-center h-100">

      <div class="col">

        <div class="card shadow-sm">

          <div class="rounded-top text-white d-flex flex-row cover" style="height:200px;">

            <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">

              <img src="https://minotar.net/helm/<?php echo $_SESSION['realname']; ?>/190.png" alt="Image Placeholder" class="img-fluid img-thumbnail mt-4 mb-2" style="width: 150px; z-index: 1">

              <button type="button" class="btn btn-outline-dark" data-bs-toggle="collapse" data-bs-target="#editprofile" aria-expanded="false" aria-controls="editprofile" style="z-index: 1;">

                Quản lý thông tin

              </button>

            </div>			

            <div class="ms-3" style="margin-top: 130px;">

              <h5><?php echo $_SESSION['realname']; ?></h5>

              <p><?php if($_SESSION['power']=="")

				    {

				    echo "Member";

				    }

				    else

				    {

				    echo $_SESSION['power']; }?></p>

            </div>

          </div>

          <div class="p-4 text-black">

            <div class="d-flex justify-content-end text-center py-1">

              <div>

                <p class="mb-1 h5"><?php echo $user_points ?></p>

                <p class="small text-muted mb-0">Số points</p>

              </div>

            </div>

			 <div class="collapse" id="editprofile">

			  <div class="container-fluid" style="padding: 0">

					<button type="button" class="btn border" data-bs-toggle="modal" data-bs-target="#email-modal"><?php

							if($_SESSION['email']=="")

							{

								?>Thêm Email

							<?php }else{

							?>Thay đổi Email</button><?php } ?>			

					<button type="button" class="btn border" data-bs-toggle="modal" data-bs-target="#password-modal">Thay đổi mật khẩu</button>

			  </div>

          </div>

        </div>					

      </div>

    </div>

  </div>

</section>

<!-- ///PROFILE PAGE -->

<!-- NAVIGATION BAR MENU -->

<div class="container py-2">

	<ul class="nav" role="tablist">

		<li class="nav-item" role="presentation">

		<a class="nav-link nav-underline active text-dark" id="ex1-tab-1" data-bs-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="true">Trang chủ</a>

		</li>

		<li class="nav-item" role="presentation">

		<a class="nav-link nav-underline text-dark" id="ex1-tab-2" data-bs-toggle="tab" href="#donate" role="tab" aria-controls="donate" aria-selected="false">Ủng hộ server</a>

		</li>

		<li class="nav-item" role="presentation">

		<a class="nav-link nav-underline text-dark" id="ex1-tab-3" data-bs-toggle="tab" href="#faq" role="tab" aria-controls="faq" aria-selected="false">FAQ</a>

		</li>

	</ul>

</div>

<!-- //NAVIGATION BAR MENU -->

<div class="container-fluid card bg-white">    

  <div class="container">		

        <div class="tab-content my-3" id="tabs">

		<!-- Tab Pane 1: TRANG CHỦ-->

           <div class="tab-pane active" id="profile">

              <div class="row">

				<div class="col-lg-5">

				<!-- LEFT PANEL: SHOW INFO-->

				<?php 

				$uuid = $classpoints->getUUID($_SESSION['realname']);

				if($classaccount->checkTimeBan($classaccount,$uuid,$conn)) { 

					$banarray = $classaccount->checkTimeBan($classaccount,$uuid,$conn);

					$currentDateUNIX = time()*1000;

					if($banarray['until']>$currentDateUNIX)

					{

						$time_converted = $classaccount->converttime($banarray['time']);

					?>

				<div class="card cardhover mb-4">

					<div class="card-body shadow-sm d-flex justify-content-center">					  

						  <p class="text-danger" style="cursor: pointer" onclick="<?php echo "sendBannedDialog('".$_SESSION['realname']."','".$banarray['reason']."','".$time_converted."','".$banarray['server_origin']."')";?>">

							 <b>Đang bị ban tới ngày <?php echo $classaccount->converttime($banarray['until']); ?></b>

						  </p>		  

					</div>

				</div>

				<?php } } ?>

                <div class="card cardhover mb-4">

                  <div class="card-body shadow-sm">

                    <div class="row">

                      <div class="col-sm-5">

                        <p class="mb-0">Tên Ingame</p>

                      </div>

                      <div class="col-sm-7">

                        <p class="text-muted mb-0"><?php echo $_SESSION['realname']; ?></p>

                      </div>

                    </div>

                    <hr>

					<div class="row">

                      <div class="col-sm-5">

                        <p class="mb-0">Email</p>

                      </div>

                      <div class="col-sm-7">

                        <p class="text-muted mb-0"><?php echo $classaccount->hideEmail($_SESSION['email']); ?></p>

                      </div>

                    </div>

                    <hr>

			        <div class="row">

                      <div class="col-sm-5">

                        <p class="mb-0">Ngày Đăng Ký</p>

                      </div>

                      <div class="col-sm-7">

                        <p class="text-muted mb-0"><?php echo $classaccount->converttime($regdate)?></p>

                      </div>

                    </div>

                    <hr>

                  </div>

                </div>				

				</div>

				<!-- //LEFT PANEL: SHOW INFO-->

				<!-- RIGHT PANEL: SHOW HISTORY-->

				<div class="col-lg-7">

                <div class="card cardhover">

				<div class="card-body shadow-sm">

				<div class="container">

					<div class="row">

						<div class="col-12">

						<p class="mb-2 mt-3">Lịch Sử Ủng Hộ</p>

						<small class="mb-0 mt-5">Dưới đây hiển thị lịch sử 10 lần ủng hộ gần đây nhất của bạn.</small>

						</div>

					</div>

					<div class="container py-2">

						<ul class="nav" role="tablist">

							<li class="nav-item" role="presentation">

							<a class="nav-link nav-underline active text-dark" id="ex1-tab-1" data-bs-toggle="tab" href="#history_card" role="tab" aria-controls="profile" aria-selected="true">Thẻ Cào</a>

							</li>

							<li class="nav-item" role="presentation">

							<a class="nav-link nav-underline text-dark" id="ex1-tab-2" data-bs-toggle="tab" href="#history_other" role="tab" aria-controls="donate" aria-selected="false">Momo & ATM</a>

							</li>

						</ul>

					</div>

					<div class="tab-content my-3" id="tabs">

						<div class="tab-pane active" id="history_card">

							<div id="load_hs" class=" my-3 table-responsive">

							   <center><img src='./img/icon/loading.gif' width='20%' /></center>

							</div>

							  <script>

								$("#load_hs").load("ajax/history.php");

								setInterval(function(){

								$("#load_hs").load("ajax/history.php");

								},10000);

								</script>

						</div>

						<div class="tab-pane" id="history_other">

							<div id="load_hs_other" class=" my-3 table-responsive">

							   <center><img src='./img/icon/loading.gif' width='20%' /></center>

							</div>

							  <script>

								$("#load_hs_other").load("ajax/history-other.php");

								setInterval(function(){

								$("#load_hs_other").load("ajax/history-other.php");

								},10000);

								</script>

						</div>

					</div>

		         </div>

				 </div> 

				 </div>

				 </div>

				<!-- //RIGHT PANEL: SHOW HISTORY-->

              </div>   			

           </div>

		<!-- ///Tab Pane 1: TRANG CHỦ -->

		<!-- Tab Pane 2: DONATE -->

            <div class="tab-pane" id="donate">

			<?php if($donate_desc != ''){ ?>
				<div class="card cardhover mb-3">
					<div class="container shadow-sm py-2 text-white" style="background-color: rgba(212, 146, 32, 0.8)">
					<ul>
					<li><?php echo 'Thông báo khuyến mãi: '.$donate_desc; ?></li>
					</ul>
					</div>
				</div>
			<?php } ?>
			
			<div class="card cardhover">

			<div class="container bg-white shadow-sm">	

			<!-- NAVIGATION BAR -->

			<ul class="nav navbar-pills justify-content-center" role="tablist" id="donate-tab">		

				<li class="nav-item">

					<a class="nav-link border nav-underline-donate active" id="donate-tab-Momo" onclick="changeValue('Momo')"><img src="img/icon/donate/Momologo.png" width="70px"></a>

				</li>

				<li class="nav-item">

					<a class="nav-link border nav-underline-donate" id="donate-tab-ATM" onclick="changeValue('ATM')"><img src="img/icon/donate/atm.png" width="70px"></a>

				</li>

				<?php  

				$cdurl = curl_init("https://thesieutoc.net/card_info.php"); 

				curl_setopt($cdurl, CURLOPT_FAILONERROR, true); 

				curl_setopt($cdurl, CURLOPT_FOLLOWLOCATION, true); 

				curl_setopt($cdurl, CURLOPT_RETURNTRANSFER, true); 

				curl_setopt($cdurl,CURLOPT_CAINFO, __DIR__ .'/api/curl-ca-bundle.crt');

				curl_setopt($cdurl,CURLOPT_CAPATH, __DIR__ .'/api/curl-ca-bundle.crt');

				$obj = json_decode(curl_exec($cdurl), true); 

				curl_close($cdurl);

				$length = count($obj);

				for ($i = 0; $i < $length; $i++) {

					if ($obj[$i]['status'] == 1 && $obj[$i]['name']=="Viettel" || $obj[$i]['name']=="Vinaphone" || $obj[$i]['name']=="Mobifone")

					{

					?>

						<li class="nav-item" role="presentation">

							<a class="nav-link border nav-underline-donate" id="donate-tab-<?php echo $obj[$i]['name'];?>" role="tab" onclick="changeValue('<?php echo $obj[$i]['name'];?>')" aria-selected="false"><img src="img/icon/donate/<?php echo $obj[$i]['name']?>logo.png" width="70px"></a>

						</li>					

					<?php

					}

				}

				?>							

				</ul>

			<!-- //NAVIGATION BAR -->

			<hr>

			<div class="tab-content" id="tabs">

			<!-- DONATE CONTENT -->

				<div class="tab-pane active " id="Vietteltab">				

					<form method="POST" id="myform">

					<div id="status"></div>

					<div class="container bg-white">

						<div class="row my-3">

							<h5 class="text-center" id="type-text">Ủng hộ Momo</h5>

							<li class="mx-4" id='desc_donate_1'>Bấm nút xác nhận, sau đó chuyển khoản theo đúng mệnh giá qua mã QR hiển thị trên màn hình, kèm theo nội dung chuyển khoản. Mỗi người chỉ được tối đa 2 ticket</li>

							<li class="mx-4" id='desc_donate_2'>Points sẽ được chuyển vào tài khoản khi được duyệt</li>

						</div>

						<div class="row">

							<div class="col col-1"></div>

							<div class="col col-12 col-sm-12 col-md-4">

								<div class="row">

									<div class="col col-6">

									<p class="text">Số tiền donate</p>

									</div>

									<div class="col col-6">

									<p class="text-center">Points nhận được</p>

									</div>

								</div>

								<div class="row">

									<div class="col col-6">

									<p class="text"><input type="radio" value="10000" name="card_amount" required checked> 10.000</p></div>

									<div class="col col-6">

									<p class="text-center" id='points_value_1'>10<b class="text-success"><?php if($donate_percent_bonus!=0){ echo '+'; echo 10*($donate_percent_bonus);}?></b></p></div>

									<hr>

									<div class="col col-6">

									<p class="text"><input type="radio" value="20000" name="card_amount" required> 20.000</p></div>

									<div class="col col-6">

									<p class="text-center" id='points_value_2'>20<b class="text-success"><?php if($donate_percent_bonus!=0){ echo '+'; echo 20*($donate_percent_bonus);}?></b></p></div>

									<hr>

									<div class="col col-6">

									<p class="text"><input type="radio" value="50000" name="card_amount" required> 50.000</p></div>

									<div class="col col-6">

									<p class="text-center" id='points_value_3'>50<b class="text-success"><?php if($donate_percent_bonus!=0){ echo '+'; echo 50*($donate_percent_bonus);}?></b></p></div>

									<hr>

									<div class="col col-6">

									<p class="text"><input type="radio" value="100000" name="card_amount" required> 100.000</p></div>

									<div class="col col-6">

									<p class="text-center" id='points_value_4'>100<b class="text-success"><?php if($donate_percent_bonus!=0){ echo '+'; echo 100*($donate_percent_bonus);}?></b></p></div>

									<hr>

									<div class="col col-6">

									<p class="text"><input type="radio" value="200000" name="card_amount" required> 200.000</p></div>

									<div class="col col-6">

									<p class="text-center" id='points_value_5'>200<b class="text-success"><?php if($donate_percent_bonus!=0){ echo '+'; echo 200*($donate_percent_bonus);}?></b></p></div>

									<hr>

									<div class="col col-6">

									<p class="text"><input type="radio" value="300000" name="card_amount" required> 300.000</p></div>

									<div class="col col-6">

									<p class="text-center" id='points_value_6'>300<b class="text-success"><?php if($donate_percent_bonus!=0){ echo '+'; echo 300*($donate_percent_bonus);}?></b></p></div>

									<hr>

									<div class="col col-6">

									<p class="text"><input type="radio" value="500000" name="card_amount" required> 500.000</p></div>

									<div class="col col-6">

									<p class="text-center" id='points_value_7'>500<b class="text-success"><?php if($donate_percent_bonus!=0){ echo '+'; echo 500*($donate_percent_bonus);}?></b></p></div>

									<hr>

									<div class="col col-6">

									<p class="text"><input type="radio" value="1000000" name="card_amount" required> 1.000.000</p></div>

									<div class="col col-6">

									<p class="text-center" id='points_value_8'>1000<b class="text-success"><?php if($donate_percent_bonus!=0){ echo '+'; echo 1000*($donate_percent_bonus);}?></b></p></div>

									<hr>

								</div>

							</div>

							<div class="col col-5 mx-5">

							<input type="text" class="form-control" name="username" id="username" value="<?php echo $_SESSION['realname'];?>" readonly hidden>

							<div class="mb-3" id="card_type_tab">

								<label for="serial" class="form-label">Hình thức ủng hộ </label>

								<input type="text" class="form-control" name="card_type" id="card_type" value="Momo" readonly>								

							</div>

							<div class="mb-3" id="serial_tab" style="display: none" >

								<label for="serial" class="form-label">Serial </label>

								<input type="text" class="form-control" name="serial" id="serial">								

							</div>

							<div class="mb-3" id="pin_tab" style="display: none" >

								<label for="pin" class="form-label">Mã thẻ </label>

								<input type="text" class="form-control" name="pin" id="pin">

							</div>

							<div class="mb-3">

								<label for="captcha" class="form-label my-2">Captcha</label>

								<div class="g-recaptcha" data-sitekey="<?php echo $captchaSiteKey ?>"></div>

							</div>

							<button type="submit" class="btn btn-success btn-block w-100 mt-3 mb-5" style="display: none" name="submit" id="submit">NẠP NGAY</button>

							<button type="button" class="btn btn-success btn-block w-100 mt-3 mb-5" name="submit-other" id="submit-other">XÁC NHẬN</button>

							</div>

						</div>

					</div>

					</form>

					<br>

			<!-- //DONATE CONTENT -->

				</div>

			</div>

			</div>

			</div>

            </div>

		<!-- ///Tab Pane 2: DONATE -->

		<!-- Tab Pane 3: FREQUENTLY ASKED QUESTION -->

            <div class="tab-pane" id="faq">

				<div class="card cardhover">

					<div class="card-body shadow-sm">

					<h4 class="mt-3">Làm sao để bảo mật tài khoản?</h4>

					<p>Các việc nên làm để tránh sự cố mất, bị đánh cắp tài khoản:

					<ol>

					<li>Đặt mật mã khó nhớ, dài và sử dụng ký tự đặc biệt</li>

					<li>Không chia sẻ tài khoản với ai khác</li>

					<li>Liên kết tài khoản với Discord để tăng bảo mật</li>

					<li>Sử dụng 2FA (Xác thực hai yếu tố)</li>
					<li>Liên hệ với staff ngay lập tức nếu mất tài khoản</li>
					</ol>

					MineInUs luôn mã hoá toàn bộ mật mã của người chơi bằng thuật toán mã hoá cao cấp nhất.</p>
					<p>Lưu ý: Staff của MineInUS sẽ không bao giờ hỏi, xin bạn thông tin cá nhân. Nếu có người vi phạm luật này, vui lòng tố cáo lên cho staff để giải quyết.</p>


					<hr>

					<h4>MineInUS có thu nhập dữ liệu gì không?</h4>

					<p>MineInUS không thu nhập dữ liệu gì ngoài tên game, mật khẩu đã mã hóa và email của bạn.</p>

					<p>MineInUS sẽ không bao giờ chia sẻ tài khoản của bạn, hay thông tin địa chỉ email cho các third-party ngoài.</p>

					<hr>

					<h4>Mình ủng hộ rồi nhưng chưa nhận được points?</h4>

					<p>Nếu bạn ủng hộ qua Momo/ATM, vui lòng đợi lên đến 24h kể từ khi bạn gửi yêu cầu vì các yêu cầu này được duyệt thủ công. Sau khi
					được duyệt hệ thống sẽ tự động chuyển points vào tài khoản và hiển thị thành công trong lịch sử ủng hộ.</p>
					<p>Nếu bạn ủng hộ qua thẻ cào, hệ thống sẽ duyệt tự động và bạn sẽ có points trong vòng 1-5 phút. Nếu hơn 1-2 giờ bạn vẫn chưa
					có points, hãy liên lạc với staff qua Discord của MineInUS.</p>

					<hr>

					<h4>Mình muốn đổi tên tài khoản được không?</h4>

					<p>Hiện tại với cách hoạt động của Minecraft Crack, thì việc này là không thể.</p>
					<p>Tuy nhiên, sau này server sẽ áp dụng hệ thống cho phép các bạn với tài khoản Premium đăng nhập không sử dụng mật khẩu và còn có thể đổi được tên mà không mất dữ liệu!</p>
					<p>*Đây chỉ là dự kiến! Có thể sẽ không áp dụng.*</p>
					<hr>

					</div>

				</div>

            </div>

		<!-- ///Tab Pane 3: FREQUENTLY ASKED QUESTION -->

        </div>		

  </div>	

  </div>

	<div class="container-fluid text-center bg-white">

		<p>Bản quyền thuộc &copy;MineInUS 2022</p>

	</div>

  </div>

</div>

<!-- MODAL 1: CHANGE EMAIL MODAL -->

<div class="modal fade" id="email-modal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">

	  <div class="modal-dialog modal-dialog-centered" role="document">

		<br>

		<div class="modal-content">

		  <div class="modal-header">

				<h5 class="modal-title">Thông Tin Tài Khoản</h5>				

				<button type="button" class="btn" data-bs-dismiss="modal"><span>&#10005;</span></button>			

		  </div>

		  <div class="modal-body">

		  <div id="status"></div>

			<form method="post" class="form-horizontal" id="email-form">

			  <input type="text" value="<?php echo $_SESSION['realname'] ?>" class="form-control" id="iduser" name="iduser" hidden>

			  <div class="mb-3">

				<label for="email" class="form-label">Email mới</label>

				<input type="text" class="form-control text-muted mb-0" id="email" name="email">				

				<?php if($_SESSION['email'] == "")

				{

				?>

					<input type="text" class="form-control text-muted mb-0" value="dc937b59892604f5a86ac96936cd7ff09e25f18ae6b758e8014a24c7fa039e91" id="emailold" name="emailold" hidden>

				<?php

				}

				else

				{

				?>

					<label for="emailold" class="form-label my-2">Email cũ</label>

					<input type="text" class="form-control text-muted mb-0" Placeholder="<?php

				        $email2 = $_SESSION['email'];	

				        echo $classacount->hideEmail($email2);

				        ?>" id="emailold" name="emailold">

				<?php

				}

				?>				

				<label for="captcha" class="form-label my-2">Captcha</label>

				<div class="g-recaptcha" data-sitekey="<?php echo $captchaSiteKey ?>"></div>				

			  </div>

			<div class="modal-footer d-flex justify-content-between py-2 my-2" style="padding: 0">

			  <button type="submit" class="btn btn-primary px-5" id="email-btn" name="email-btn">Lưu</button>

			  <button type="button" class="btn btn-secondary px-5" data-bs-dismiss="modal">Trở lại</button>			  

			</div>

			</form>

		  </div>

		</div>

	  </div>

</div>

<!-- ///MODAL 1: CHANGE EMAIL MODAL -->

<!-- MODAL 2: CHANGE PASSWORD MODAL -->

<div class="modal fade" id="password-modal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="false">

	  <div class="modal-dialog modal-dialog-centered" role="document">

		<br>

		<div class="modal-content">

		  <div class="modal-header">

			<h5 class="modal-title">Thay Đổi Mật Khẩu</h5>

			<button type="button" class="btn" data-bs-dismiss="modal"><span>&#10005;</span></button>

		  </div>

		  <div class="modal-body">

		  <div id="status2"></div>

			<form class="form-horizontal" method="post" id="password-change-form">

				<div class="mb-3">

					<input type="hidden" name="realname" id="realname" value="<?php echo $_SESSION['realname'];?>">

					<label for="passwordold" class="form-label">Mật Khẩu Cũ</label>

					<input type="password" name='passwordold' id='passwordold' class="form-control">

					<label for="password" class="form-label">Mật Khẩu Mới</label>

					<input type="password" name='password' id='password' class="form-control">

					<label for="confirm-password" class="form-label my-2">Nhập Lại Mật Khẩu</label>

					<input type="password" name='confirm-password' id='confirm-password' class="form-control">

					<label for="captcha" class="form-label my-2">Captcha</label>

					<div class="g-recaptcha" data-sitekey="<?php echo $captchaSiteKey ?>"></div>

				</div>

			<div class="modal-footer d-flex justify-content-between py-2 my-2" style="padding: 0">

			  <button type="submit" class="btn btn-primary px-5" id="change-password-btn" name="change-password-btn">Lưu</button>

			  <button type="button" class="btn btn-secondary px-5" data-bs-dismiss="modal">Trở lại</button>		  

			</div>

			</form>

		  </div>

		</div>

	  </div>

</div>

<!-- ///MODAL 2: CHANGE PASSWORD MODAL -->

<script type="text/javascript">

$( '#donate .navbar-pills a' ).on( 'click', function () {

	$( '#donate .navbar-pills .li' ).find( 'a.active' ).removeClass( 'active' );

	$( this ).parent( 'a' ).addClass( 'active' );

});

$("#myform").submit(function(e) {

	e.preventDefault();

	if(window.localStorage.getItem("DontShow")=="true")

	{

		$.ajax({

			url: "./ajax/card.php",

			type: 'post',

			data: $("#myform").serialize(),

			success: function(data) {

				$("#status").html(data);

				$('#serial').val('');

				$('#pin').val('');

				$("#load_hs").load("./ajax/history.php");

			}

		});

	}

	else

	{

	Swal.fire({

	title: 'Ấy khoan! Bạn có chắc ủng hộ bằng thẻ cào?',

	html: "<p class='text-start'>Do tính chất của thẻ cào phải thông qua nhiều ngõ (nhà mạng, và đại lý thẻ), chiết khấu của thẻ có thể giao động lên đến 30%. Và khi bạn sử dụng thẻ, bạn sẽ mất lên đến 20% giá trị trên MineInUS, và cả MineInUS có thể mất lên đến 30% số tiền mà bạn đã ủng hộ!</p><p class='text-start'>Thay vì đó, bạn có thể ủng hộ thông qua Momo hoặc CK Ngân Hàng để cả bạn, và server nhận đủ giá trị đồng tiền! Nếu bạn vẫn muốn ủng hộ qua thẻ cào tự động, bạn có thể đóng thông báo này và tiếp tục.</p><hr><input type='checkbox' id='forgetMe'><label for='forgetMe'>Ẩn thông báo</label>",

	showCancelButton: true,

	confirmButtonColor: '#3085d6',

	cancelButtonColor: '#d33',

	confirmButtonText: 'Xác nhận',

	cancelButtonText: 'Quay lại',

	}).then((result) => {

		if (result.isConfirmed) 

		{

			$.ajax({

				url: "./ajax/card.php",

				type: 'post',

				data: $("#myform").serialize(),

				success: function(data) {

					$("#status").html(data);

					$('#serial').val('');

					$('#pin').val('');

					$("#load_hs").load("./ajax/history.php");

				}

			});

		}

	})

	}

});

$("#submit-other").click(function(){

	var username = $('#username').val();

	var ele = document.getElementsByName("card_amount");

	for(i = 0; i < ele.length; i++) {

		if(ele[i].checked)

		card_amount = ele[i].value;

	}

	var card_type = $('#card_type').val();

	Swal.fire({

	title: 'Xác nhận',

	text: "Bạn đã kiểm tra hết tất cả thông tin chưa?",

	showCancelButton: true,

	confirmButtonColor: '#3085d6',

	cancelButtonColor: '#d33',

	confirmButtonText: 'Có, gửi ticket',

	cancelButtonText: 'Quay lại',

	}).then((result) => {

		if (result.isConfirmed) 

		{

		$.ajax({

		url: "./ajax/card-other.php",

		type: 'post',

		data: {username:username, card_amount: card_amount, card_type: card_type, captcha: grecaptcha.getResponse(0)},

		success: function(data) {			

			$("#status").html(data);		

		}

		});

		}

	})	

});

$('#email-form').submit(function(e) {		

	e.preventDefault();

	var iduser = $('#iduser').val();

	var newemail = $('#email').val();

	var oldemail = $('#emailold').val();
	
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

		url: "./ajax/crud/email-update.php",

		type: "post",

		data: {iduser:iduser, newemail:newemail, oldemail:oldemail,captcha: grecaptcha.getResponse(1)},

		success:function(data){

			$("#status").html(data);

		}

	});

});

$('#password-change-form').submit(function(e) {		

	e.preventDefault();

	var realname = $('#realname').val();

	var oldpassword = $('#passwordold').val();

	var newpassword = $('#password').val();

	var confirmpassword = $('#confirm-password').val();
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

		url: "./ajax/crud/password-update.php",

		type: "post",

		data: {

			realname:realname, 

			oldpassword:oldpassword, 

			newpassword:newpassword,

			confirmpassword:confirmpassword,

			captcha: grecaptcha.getResponse(2)},

		success:function(data){

			$("#status2").html(data);

			document.getElementById("password-change-form").reset();

			grecaptcha.reset(2);

		}

	});

});



$(document).on("click", "#forgetMe", function(){

	localStorage.setItem("DontShow", "true");

});



</script>

</body>

<script>

$('#menumodal').appendTo("body");

$('ul.nav li.dropdown').hover(

function() 

{

  $(this).find('.dropdown-menu').stop(true, true).delay(0).fadeIn(50);

}, 

function() 

{

  $(this).find('.dropdown-menu').stop(true, true).delay(0).fadeOut(50);

});</script>

</html>