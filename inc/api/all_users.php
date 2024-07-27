
<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include '../config/dbcon.php'
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
