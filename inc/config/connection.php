
<?php
$servername = "";
$username = "";
$password = ""; 

try {
  $conn = new PDO("mysql:host=$servername;dbname=db_employee;charset=utf8", $username, $password);
  $conn->exec("set names utf8");

  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>
