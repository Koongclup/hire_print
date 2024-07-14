<?php
  session_start();
require_once('../inc/config/dbcon.php');

class UserLogin {
    private $conn;

    function __construct($db) {
        $this->conn = $db;
    }

    function login($username, $password) {
        // Perform user authentication (you should hash and salt the password)
        $query = "SELECT * FROM tb_member WHERE username = ? AND password = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bind_param('ss', $username, $password);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $_SESSION['admin_user'] = $username;
            $_SESSION['login_time'] = time(); // Set the login time
            return "success"; // Login successful
        } else {
            return "fail"; // Login failed
        }

        $stmt->close();
    }
}

// Usage
$userLogin = new UserLogin($conn);
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    echo $userLogin->login($username, $password);
}

$conn->close();
?>
