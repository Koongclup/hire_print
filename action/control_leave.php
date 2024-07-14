<?php
include "../inc/config/dbcon.php";
if ($_GET["action"] === "leave_data") {
  $sql = "SELECT * from leaves ";
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

if ($_GET["action"] === "leave_insert") {
  if (!empty($_POST['addevent']) && !empty($_POST['addname']) && !empty($_POST['start_date'])&& !empty($_POST['end_date'])) {
    $event_name = $_POST['addevent'];
    $login            = $_POST['addname'];
    $start_date = date("y-m-d", strtotime($_POST['start_date']));
    $end_date   = date("y-m-d", strtotime($_POST['end_date']));
    $result     =   mysqli_query($conn, "SELECT fullname,color FROM user_group WHERE fullname='$login'");
    while ($row =   mysqli_fetch_assoc($result)) {
      $color    =   $row['color'];
    }
    $sql = "insert into `leaves`(`event_name`,`event_start_date`,`event_end_date`,`user_name`,`color`) 
    values ('" . $event_name . "','" . $start_date . "','" . $end_date . "','" . $login . "','" . $color . "')";
    if (mysqli_query($conn, $sql)) {
      echo json_encode([
        "statusCode" => 200,
        "message" => "บันทึกข้อมูลสำเร็จ"
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
      "message" => "กรองข้อมูลไม่ครบ"
    ]);
  }
}

// fetch data of individual user for edit form
if ($_GET["action"] === "leave_one") {
  $id   =   $_POST["id"];
  $sql  =   "SELECT * from leaves WHERE `event_id`=$id";
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
if ($_GET["action"] === "leave_update") {
  if (!empty($_POST["event_start_date"])) {
    $id         = $_POST["event_id"];
    $event_name = $_POST['event_name'];
    $login      = $_POST['user_name'];
    $start_date = date("y-m-d", strtotime($_POST['event_start_date']));
    $end_date   = date("y-m-d", strtotime($_POST['event_end_date']));
    $result     =   mysqli_query($conn, "SELECT fullname,color from user_group where fullname='$login'");
    while ($row =   mysqli_fetch_assoc($result)) {
      $color    =   $row['color'];
    }
    $sql = "UPDATE `leaves` SET `event_name`='$event_name',`user_name`='$login',`event_start_date`='$start_date',`event_end_date`='$end_date',`color`='$color'
    WHERE `event_id`='$id'";
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
if ($_GET["action"] === "leave_delete") {
  $id = $_POST["id"];
  $sql = "DELETE FROM leaves   WHERE `event_id`=$id";
  if (mysqli_query($conn, $sql)) {
    // remove the image
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
