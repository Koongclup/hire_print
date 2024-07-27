<?php
session_start();
@ini_SET('display_errors', '0');
date_default_timezone_SET("Asia/Bangkok");
$conn = mysqli_connect("", "", "", "db_employee");
$conn->SET_charSET("utf8");

$sql = "update user_group set " . $_POST["column"] . "='" . $_POST["value"] . "' where id=" . $_POST["id"];
if (mysqli_query($conn, $sql))
    echo "true";
else
    echo "false";
?>
