<?php
class points
{
	public function getUUID($realname)
	{
	$user ="OfflinePlayer:".$realname;
		$val = md5($user, true);
		$byte = array_values(unpack('C16', $val));
		$tLo = ($byte[0] << 24) | ($byte[1] << 16) | ($byte[2] << 8) | $byte[3];
		$tMi = ($byte[4] << 8) | $byte[5];
		$tHi = ($byte[6] << 8) | $byte[7];
		$csLo = $byte[9];
		$csHi = $byte[8] & 0x3f | (1 << 7);
		if (pack('L', 0x6162797A) == pack('N', 0x6162797A)) 
		{
		$tLo = (($tLo & 0x000000ff) << 24) | (($tLo & 0x0000ff00) << 8) | (($tLo & 0x00ff0000) >> 8) | (($tLo & 0xff000000) >> 24);
		$tMi = (($tMi & 0x00ff) << 8) | (($tMi & 0xff00) >> 8);
		$tHi = (($tHi & 0x00ff) << 8) | (($tHi & 0xff00) >> 8);
		}
		$tHi &= 0x0fff;
		$tHi |= (3 << 12);
		$uuid = sprintf('%08x-%04x-%04x-%02x%02x-%02x%02x%02x%02x%02x%02x',
		$tLo, $tMi, $tHi, $csHi, $csLo,
		$byte[10], $byte[11], $byte[12], $byte[13], $byte[14], $byte[15]
		);
		return $uuid;
	}
	public function getPlayerPoint($uuid,$conn)
	{
		$sql = "SELECT * FROM playerpoints_points WHERE uuid=? LIMIT 1";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('s', $uuid);
        $stmt->execute();
        $result = $stmt->get_result();
		if(mysqli_num_rows($result)==0)
		{
			$user = $uuid;
			$zero = 0;
			$sqlinsertpoints = "INSERT INTO playerpoints_points(uuid,points) VALUES(?,?);";
			$stmt = $conn->prepare($sqlinsertpoints);
			$stmt->bind_param('ss',$user,$zero);
			$stmt->execute();
			$user_points=0;
			return $user_points;
		}
		else
		{
		$user = $result->fetch_assoc();
		$user_points = $user['points'];
		return $user_points;
		}      		
	}
}

