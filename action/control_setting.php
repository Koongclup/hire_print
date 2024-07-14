<?php
include "../inc/config/dbcon.php";
// function to fetch data
if ($_GET["action"] === "fetchPos") {
  $sql = "SELECT * from  tbl_position";
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

if ($_GET["action"] === "fetchLev") {
  $sql = "SELECT * from  tbl_level";
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

// insert data to database
if ($_GET["action"] === "insertPos") {
  if (!empty($_POST["position"])  ) {
    $position = mysqli_real_escape_string($conn, $_POST["position"]);
    $sql = "INSERT INTO `tbl_position`(`name`)  VALUES ('$position')";
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
      //"message" => "Please fill all the required fields 🙏"
    ]);
  }
}

if ($_GET["action"] === "insertLev") {
  if (!empty($_POST["level"])  ) {
    $level = mysqli_real_escape_string($conn, $_POST["level"]);
    $sql = "INSERT INTO `tbl_level`(`name`)  VALUES ('$level')";
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
if ($_GET["action"] === "fetchSinglePos") {
  $id = $_POST["id"];
  $sql = "SELECT * FROM tbl_position WHERE `id`=$id";
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

if ($_GET["action"] === "fetchSingleLevel") {
  $id = $_POST["id"];
  $sql = "SELECT * FROM tbl_level WHERE `id`=$id";
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
if ($_GET["action"] === "updatePos") {
  if ( !empty($_POST["position"]) ) {
    $id  = mysqli_real_escape_string($conn, $_POST["id"]);
    $position   = mysqli_real_escape_string($conn, $_POST["position"]);
  
    $sql = "UPDATE `tbl_position` SET `name`='$position' WHERE `id`=$id";
    if (mysqli_query($conn, $sql)) {
        echo json_encode([
        "statusCode" => 200,
        "message" => "บันทึการแก้ไขเรียบร้อยแล้ว"
        //"message" => "Data updated successfully 😀"
      ]);
    } else {
      echo json_encode([
        "statusCode" => 500,
        "message" => "Failed to update data "
        //"message" => "Failed to update data 😓"
      ]);
    }
    mysqli_close($conn);
  } else {
    echo json_encode([
      "statusCode" => 400,
      "message" => "Please fill all the required fields "
      //"message" => "Please fill all the required fields 🙏"
    ]);
  }
}

if ($_GET["action"] === "updateLev") {
  if ( !empty($_POST["level"]) ) {
    $id     = mysqli_real_escape_string($conn, $_POST["id"]);
    $level  = mysqli_real_escape_string($conn, $_POST["level"]);
   
    $sql = "UPDATE `tbl_level` SET `name`='$level'
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
if ($_GET["action"] === "deletePosition") {
  $id = $_POST["id"];
  $sql = "DELETE FROM tbl_position WHERE `id`=$id";
  if (mysqli_query($conn, $sql)) {
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

if ($_GET["action"] === "deleteLevel") {
  $id = $_POST["id"];
  $sql = "DELETE FROM tbl_level WHERE `id`=$id";
  if (mysqli_query($conn, $sql)) {
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