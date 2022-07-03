<?php 

//"168.138.169.152", "miuweb", "3DyF7%qhXtE-tW>*", "mineinus", "56552"

class connection

{

	public function getConnect()

	{

		$conn = new mysqli("localhost", "root", "", "mineinus");

		mysqli_set_charset($conn, 'UTF8');

		if($conn->connect_error)

		{

			die('Database error: ' .$conn->connect_error);

			return false;

		}

		return $conn;

	}

	public function getConnectAuthme()

	{

		$conn = new mysqli("localhost", "root", "", "authme");

		mysqli_set_charset($conn, 'UTF8');

		if($conn->connect_error)

		{

			die('Database error: ' .$conn->connect_error);

			return false;

		}

		return $conn;

	}

	public function getConnectLuckPerms()

	{

		$conn = new mysqli("localhost", "root", "", "luckperms");

		mysqli_set_charset($conn, 'UTF8');

		if($conn->connect_error)

		{

			die('Database error: ' .$conn->connect_error);

			return false;

		}

		return $conn;

	}

}

    

?>