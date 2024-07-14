
<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$host = "192.168.212.50";
$username = "sa";
$password = "7188455";
$database = "db_employee";

// Create a connection
$conn = new mysqli($host, $username, $password, $database);
$conn->set_charset("utf8");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = $conn->query("SELECT b.*,concat(b.level_type,' ',b.level) as levels from tb_users b");

$records = array();
$records["data"] = array();
$i = 1;

while ($data = $sql->fetch_assoc()) {
    extract($data);
    $record_item = array(
        "id"            => $i++,
        "gid"           => $id,
        "fullname"      => $fullname,
        "position"      => $position,
        "levels"        => $levels,
        "level_type"    => $level_type,
        "group"         => $group_depart,
        "depart"        => $department,
       
    );
    //$result[] = $data; 
    array_push($records["data"], $record_item);
}
echo json_encode($records);

?>