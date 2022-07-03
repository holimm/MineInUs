<?php 
require_once ("../controller/authController.php");
?>
<table class="table table-borderless align-middle mb-0">
	<thead class="bg-light">
		<tr>
		  <th scope="col">STT</th>
		  <th scope="col">Tên Game</th>
		  <th scope="col">Mệnh Giá</th>
		  <th scope="col">Thẻ</th>
		  <th scope="col">Trạng Thái</th>
		  <th scope="col">Thời Gian </th>
		</tr>
	</thead>  
  <?php 

if(!empty($_SESSION['realname']))
{
	$realname = $_SESSION['realname'];				
}
else
{
	$realname = "";
}
$rownum = 0;
$query = $conn->query("SELECT * FROM `trans_log` WHERE name='$realname' ORDER BY `id` DESC LIMIT 10");
if($query->num_rows > 0){ 
    while($row = $query->fetch_array())
	{
		$rownum++;
	    if ($row['status'] == 1){
			$status = '<span class="badge bg-success" style="font-size:100%;color:white;">Thành Công</span>';
	    } else if ($row['status'] == 2){
			$status = '<span class="badge bg-danger" style="font-size:100%;color:white;">Thất Bại</span>';
		} else if ($row['status'] == 3){
			$status = '<span class="badge bg-info" style="font-size:100%;color:white;">Sai Mệnh Giá</span>';
		} else {
		    $status = '<span class="badge bg-info" style="font-size:100%;color:white;">Chờ Duyệt</span>';
		}
		echo "
		<tbody>
			<tr>
			  <td>
				<div class='d-flex align-items-center'>
					<p class='fw-bold mb-1'>".$rownum."</p>
				</div>
			  </td>
			  <td>
				<p class='fw-normal mb-1'>".$row['name']."</p>
			  </td>
			  <td>
				<p class='fw-normal mb-1'>".number_format($row['amount'])."đ</p>
			  </td>
			  <td>
				<p class='fw-normal mb-1'>".$row['type']."</p>
			  </td>
			  <td>
				<span class='badge badge-success rounded-pill'>".$status."</span>
			  </td>
			  <td>
				<p class='fw-normal mb-1'>".$row['date']."</p>
			  </td>
			</tr>
		  </tbody>
		";
	}
} else {
	echo '
	<tbody>
		<td colspan="6" align="center"><span style="font-size:100%;"> Lịch Sử Trống </span></td>
	</tbody>
	';
}
  ?>
  
		</table>
