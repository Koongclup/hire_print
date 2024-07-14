<?php 
session_start();
session_unset(); // Clear the session data
session_destroy(); // Destroy the session
header("Location: index.php?page=รายการหลัก");
?>