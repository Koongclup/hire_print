
<?php
$servername = "";
$username = "";
$password = ""; //ถ้าไม่ได้ตั้งรหัสผ่านให้ลบ yourpassword ออก
 
try {
  $conn = new PDO("mysql:host=$servername;dbname=db_employee;charset=utf8", $username, $password);
  $conn->exec("set names utf8");
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  //echo "Connected successfully";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>
