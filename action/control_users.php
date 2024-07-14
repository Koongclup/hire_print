<?php
include "../inc/config/dbcon.php";

// function to fetch data
if ($_GET["action"] === "fetchData") {
  $sql = "SELECT b.*,FORMAT(b.paypost,'N') as payposts FROM user_group b  where b.active ='Y' order by b.id desc";
  $result = mysqli_query($conn, $sql);
  $data = [];
  while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
  }
  mysqli_close($conn);
  header('Content-Type: application/json');
  echo json_encode([
    "data" => $data
  ]);
}

if ($_GET["action"] === "fetchAll") {
  $sql = "SELECT b.*,FORMAT(b.paypost,'N') as payposts 
  FROM user_group b   order by b.id desc";
  $result = mysqli_query($conn, $sql);
  $data = [];
  while ($row = mysqli_fetch_assoc($result)) {
    $data[] = $row;
  }
  mysqli_close($conn);
  header('Content-Type: application/json');
  echo json_encode([
    "data" => $data
  ]);
}

if ($_GET["action"] === "carduser") {
  $limit = 4; // Number of items per page
  // Get page number from the request
  $page = isset($_GET['page']) ? $_GET['page'] : 1;
  $start = ($page - 1) * $limit;

  $sql = "SELECT b.*,FORMAT(b.paypost,'N') as payposts FROM user_group b  where b.active ='Y'   LIMIT $start, $limit";
  $result = mysqli_query($conn, $sql);
  $data = array();
  while ($row = $result->fetch_assoc()) {
    $data[] = $row;
  }
  echo json_encode($data);
  $conn->close();
}

if ($_GET["action"] === "total") {
  $result = $conn->query("SELECT COUNT(*) as total_rows FROM user_group  where active ='Y'");
  $row = $result->fetch_assoc();
  echo $row['total_rows'];
  $conn->close();
}




// insert data to database
if ($_GET["action"] === "insertData") {
  if (!empty($_POST["first_name"]) && !empty($_POST["last_name"])
    && !empty($_POST["pname"])  && !empty($_POST["startdate"])
    && !empty($_POST["paypost"])
  ) {
    $first_name = mysqli_real_escape_string($conn, $_POST["first_name"]);
    $last_name  = mysqli_real_escape_string($conn, $_POST["last_name"]);
    $pname      = mysqli_real_escape_string($conn, $_POST["pname"]);
    $startdate  = mysqli_real_escape_string($conn, $_POST["startdate"]);
    $cid        = mysqli_real_escape_string($conn, $_POST["cid"]);
    $paypost    = mysqli_real_escape_string($conn, $_POST["paypost"]);
    $position   = mysqli_real_escape_string($conn, $_POST["position"]);
    $level      = mysqli_real_escape_string($conn, $_POST["level"]);
    $fullname   = $pname . '' . $first_name . '  ' . $last_name;
    // rename the image before saving to database
    /*
        $original_name = $_FILES["image"]["name"];
        $new_name = uniqid() . time() . "." . pathinfo($original_name, PATHINFO_EXTENSION);
        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/" . $new_name); 
    */

    $sql = "INSERT INTO `user_group`(`fullname`, `start_date`, `paypost`, `position`, `cid`, `active`, `level`) 
    VALUES ('$fullname','$startdate','$paypost','$position','$cid','N','$level')";

    if (mysqli_query($conn, $sql)) {
      echo json_encode([
        "statusCode" => 200,
        "message" => "บันทึกข้อมูลสำเร็จ   "
      ]);
    } else {
      echo json_encode([
        "statusCode" => 500,
        "message" => "Failed to insert data 😓"
      ]);
    }
  } else {
    echo json_encode([
      "statusCode" => 400,
      "message" => "Please fill all the required fields 🙏"
    ]);
  }
}



// fetch data of individual user for edit form
if ($_GET["action"] === "fetchSingle") {
  $id = $_POST["id"];
  $sql = "SELECT * FROM user_group WHERE `id`=$id";
  $result = mysqli_query($conn, $sql);
  if (mysqli_num_rows($result) > 0) {
    $data = mysqli_fetch_assoc($result);
    header("Content-Type: application/json");
    echo json_encode([
      "statusCode" => 200,
      "data" => $data
    ]);
  } else {
    echo json_encode([
      "statusCode" => 404,
      "message" => "No user found with this id 😓"
    ]);
  }
  mysqli_close($conn);
}



// function to update data
if ($_GET["action"] === "updateData") {
  if (!empty($_POST["startdate"]) && !empty($_POST["paypost"])) {

    $id         = mysqli_real_escape_string($conn, $_POST["id"]);
    $startdate  = mysqli_real_escape_string($conn, $_POST["startdate"]);
    $caldate    = mysqli_real_escape_string($conn, $_POST["caldate"]);
    $cid        = mysqli_real_escape_string($conn, $_POST["cid"]);
    $paypost    = mysqli_real_escape_string($conn, $_POST["paypost"]);
    $position   = mysqli_real_escape_string($conn, $_POST["position"]);
    $active     = mysqli_real_escape_string($conn, $_POST["active"]);
    $level      = mysqli_real_escape_string($conn, $_POST["level"]);


    /*
    if ($_FILES["image"]["size"] != 0) {
      // rename the image before saving to database
      $original_name = $_FILES["image"]["name"];
      $new_name = uniqid() . time() . "." . pathinfo($original_name, PATHINFO_EXTENSION);
      move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/" . $new_name);
      // remove the old image from uploads directory
      unlink("uploads/" . $_POST["image_old"]);
    } else {
      $new_name = mysqli_real_escape_string($conn, $_POST["image_old"]);
    }*/
    $sql = "UPDATE `user_group` SET `start_date`='$startdate',`cid`='$cid',`paypost`='$paypost'
    ,`position`='$position' ,`active`='$active' ,`level`='$level', `start_dated`='$caldate'
    WHERE `id`=$id";
    if (mysqli_query($conn, $sql)) {
      echo json_encode([
        "statusCode" => 200,
        "message" => "บันทึการแก้ไขเรียบร้อยแล้ว"
        //"message" => "Data updated successfully 😀"
      ]);
    } else {
      echo json_encode([
        "statusCode" => 500,
        "message" => "Failed to update data 😓"
      ]);
    }
    mysqli_close($conn);
  } else {
    echo json_encode([
      "statusCode" => 400,
      "message" => "Please fill all the required fields 🙏"
    ]);
  }
}



// function to delete data
if ($_GET["action"] === "deleteData") {
  $id = $_POST["id"];
  //$delete_image = $_POST["delete_image"];
  $sql = "DELETE FROM user_group WHERE `id`=$id";
  //$sql = "UPDATE user_group set  `active`='N'  WHERE `id`=$id";

  if (mysqli_query($conn, $sql)) {
    //unlink("uploads/" . $delete_image);
    echo json_encode([
      "statusCode" => 200,
      "message" => "บันทึการแก้ไขเรียบร้อยแล้ว"
      //"message" => "Data deleted successfully 😀"
    ]);
  } else {
    echo json_encode([
      "statusCode" => 500,
      "message" => "Failed to delete data 😓"
    ]);
  }
}
