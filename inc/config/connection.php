
<?php
$servername = "192.168.212.50";
$username = "sa";
$password = "7188455"; 

try {
  $conn = new PDO("mysql:host=$servername;dbname=db_employee;charset=utf8", $username, $password);
  $conn->exec("set names utf8");

  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>