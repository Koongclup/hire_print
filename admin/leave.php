<?php
session_start();
// Check if the admin user is logged in
if (!isset($_SESSION['admin_user']) || empty($_SESSION['admin_user'])) {
  header("Location: ../index.php"); // Redirect to the login page if not logged in
  exit();
}
// Check the session timeout (3 hours)
if (isset($_SESSION['login_time']) && (time() - $_SESSION['login_time']) > 10800) {
  session_unset(); // Clear the session data
  session_destroy(); // Destroy the session
  header("Location: ../index.php"); // Redirect to the login page
  exit();
}
include '../inc/config/dbcon.php';
$query_pos = "SELECT * FROM tbl_position";
$pos = $conn->query($query_pos);
$query_lev = "SELECT * FROM tbl_level";
$level = $conn->query($query_lev);
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>admin</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../inc/assets/custom.css" type="text/css" media="all" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/autofill/2.6.0/css/autoFill.dataTables.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>

<body>
  <?php include '../inc/layout/header_admin.php'; ?>
  <div class="vh-90 d-flex justify-content-center " style="min-height: calc(90vh - 50px);">
    <div class="container my-5">
      <?php include '../inc/layout/headbar.php'; ?>
      <div class="mt-4">
        <div class="row">
          <div class="col-md-12 mb-3">
            <!--<h5>ตารางตำแหน่งงาน</h5>-->
            <table class="table table-sm table-hover table-striped " id="leave_table" style="font-size:15px;">
              <thead class="bg-white">
                <tr>
                  <th>#</th>
                  <th>รายการ</th>
                  <th>ชื่อ</th>
                  <th>เริ่มวันที่</th>
                  <th>จบวันที่</th>
                  <th>สถานะ</th>
                  <th>สี</th>
                  <th><button class="btn btn-white btn-sm float-end" data-bs-toggle="modal" data-bs-target="#createPosition"><i class="fa fa-plus-circle mx-2"></i>เพิ่ม</button></th>
                </tr>
              </thead>
              <tbody></tbody>
            </table>
          </div>
        </div>
      </div>
      <!-- Modal Position Create -->
      <div class="modal fade" id="createPosition" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">เพิ่มการลา</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="POST" id="insertFormPos">
                <div class="row mb-3">
                  <div class="col-12 mb-3">
                    <label class="form-label">การลา</label>

                    <select name="addevent" id="addname" class="form-select" required>
                      <option required>เลือก</option>
                      <?php $conn = mysqli_connect("192.168.212.50", "sa", "7188455", "db_employee");
                      $conn->set_charset("utf8");
                      $q = mysqli_query($conn, "SELECT * FROM leave_status");
                      foreach ($q as $r) {
                        echo "<option value='" . $r["leave_name"] . "'>" . $r["leave_name"] . "</option>";
                      }
                      mysqli_close($conn);
                      ?>
                    </select>
                  </div>
                  <div class="col-12 mb-3">
                    <label class="form-label">ชื่อ</label>
                    <select id="addname" name="addname" class="form-control" required>
                      <option required> เลือก</option>
                      <?php $conn = mysqli_connect("192.168.212.50", "sa", "7188455", "db_employee");
                      $conn->set_charset("utf8");
                      $bug = "SELECT * FROM user_group ";
                      $q = mysqli_query($conn, $bug);
                      foreach ($q as $r) {
                        echo "<option value='" . $r["fullname"] . "' style='border: 1px solid #fffff; width: 100px;
                                                            height: 100px;background-color:" . $r["color"] . " '>" . $r["fullname"] . "</option>";
                      }
                      mysqli_close($conn);
                      ?>
                    </select>
                  </div>
                  <div class="col-6 mb-3">
                    <label class="form-label">เริ่ม</label>
                    <input type="date" name="start_date" class="form-control" id="start_date">
                  </div>
                  <div class="col-6 mb-3">
                    <label class="form-label">ปิด</label>
                    <input type="date" name="end_date" class="form-control" id="end_date">
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary me-1" id="insertBtnPos">Submit</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Edit Modal -->
      <div class="modal fade" id="editPosition" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">แก้ไขการลา</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="POST" id="editFormPos">
                <input type="hidden" name="id" id="id">
                <input type="hidden" name="event_id" id="event_id">
                <div class="row mb-3">
                  <div class="col-12 mb-3">
                    <label class="form-label">ประเภทการลา</label>
                    <select name="event_name" id="event_name" class="form-select" required>
                      <?php $conn = mysqli_connect("192.168.212.50", "sa", "7188455", "db_employee");
                      $conn->set_charset("utf8");
                      $q = mysqli_query($conn, "SELECT * FROM leave_status");
                      foreach ($q as $r) {
                        echo "<option value='" . $r["leave_name"] . "'>" . $r["leave_name"] . "</option>";
                      }
                      mysqli_close($conn);
                      ?>
                    </select>
                  </div>
                  <div class="col-12 mb-3">
                    <label class="form-label">ชื่อ</label>
                    <select id="user_name" name="user_name" class="form-select" required>
                      
                      <?php $conn = mysqli_connect("192.168.212.50", "sa", "7188455", "db_employee");
                      $conn->set_charset("utf8");
                      $bug = "SELECT * FROM user_group ";
                      $q = mysqli_query($conn, $bug);
                      foreach ($q as $r) {
                        echo "<option value='" . $r["fullname"] . "' 
                        style='border: 1px solid #fffff; width: 100px;
                        height: 100px;background-color:" . $r["color"] . " '>" . $r["fullname"] . "</option>";
                      }
                      mysqli_close($conn);
                      ?>
                    </select>
                  </div>
                  <div class="col-6 mb-3">
                    <label class="form-label">เริ่ม</label>
                    <input type="date" name="event_start_date" class="form-control" id="event_start_date">
                  </div>
                  <div class="col-6 mb-3">
                    <label class="form-label">ปิด</label>
                    <input type="date" name="event_end_date" class="form-control" id="event_end_date">
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary me-1" id="editBtnPos">Submit</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- Toast container  -->
      <div class="position-fixed bottom-0 start-50 translate-middle-x p-3" style="z-index: 30">
        <div id="successToast" class="toast bg-white " role="alert" aria-live="assertive" aria-atomic="true">
          <div class="toast-header ">
            <strong class="me-auto">Success </strong>
            <small class="text-muted">11 mins ago</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
          </div>
          <div class="toast-body">
            <span id="successMsg"></span>
          </div>
        </div>
        <div class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
          <div class="toast-header">
            <strong>Success!</strong>
            <small>Now</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
          </div>
          <div class="toast-body">
          </div>
        </div>
      </div>

      <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <!-- Success toast  -->
        <div class="toast align-items-center text-bg-success" role="alert" aria-live="assertive" aria-atomic="true" id="successToast2">
          <div class="d-flex">
            <div class="toast-body">
            </div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
          </div>
        </div>
        <!-- Error toast  -->
        <div class="toast align-items-center text-bg-danger" role="alert" aria-live="assertive" aria-atomic="true" id="errorToast">
          <div class="d-flex">
            <div class="toast-body">
              <strong>Error!</strong>
              <span id="errorMsg"></span>
            </div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php include '../inc/layout/footer.php'; ?>
</body>

<script>
  $(document).ready(function() { //leave_data();
   
    var table = $('#leave_table').DataTable({
      "fnCreatedRow": function(nRow, aData, iDataIndex) {
        $(nRow).attr('id', aData[0]);
      },
      "oLanguage": {
        "sLengthMenu": "แสดง _MENU_ แถว",
        "sInfo": "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
        "sInfoEmpty": "แสดง 0 ถึง 0 จาก 0 แถว",
        "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
        "sSearch": "ค้นหา ",
        "oPaginate": {"sPrevious": '<',"sNext": '>',}
      },
      "ajax": {
        "url": "../action/control_leave.php?action=leave_data", //"dataSrc": ""
      },
      order: [
        [0, 'desc']
      ],
      "columns": [{
          "data": "event_id"
        }, {
          "data": "event_name"
        }, {
          "data": "user_name"
        }, {
          "data": "event_start_date"
        }, {
          "data": "event_end_date"
        }, {
          "data": "null",
          render: function(data, type, row) {
            if (row.event_approve = 'null') {
              return '<b style="font-size:14px;" class="ml-2 badge badge-pill bg-secondary">ยังไม่อนุมัติ</b>';
            }
            if (row.event_approve != 'null') {
              return '<b style="font-size:14px;" class="ml-2 badge badge-pill bg-primary">อนุมัติ </b>';
            }
          }
        },
        {
          "data": "color"
        },
        {
          data: null,
          render: function(data, type, row) {
            return '<b class="d-flex justify-content-center"><Button type="button" class="btn btn-sm btn-light shadow-sm editBtn me-1" value="' + row.event_id + '"><i class="fa-solid fa-pen-to-square"></i></Button' +
              '<b class="d-flex justify-content-center"><Button type="button" class="btn btn-sm btn-light shadow-sm delBtn me-1" value="' + row.event_id + '"><i class="fa fa-trash"></i></Button>';
          }
        }
      ],
      processing: true,
      "iDisplayLength": 10,
      "lengthMenu": [
        [5, 10, 25, 50, 100, -1],
        [5, 10, 25, 50, 100, "All"]
      ],
      dom: '<"row"<"col-sm-3 col-6"l><"col-sm-3 col-6"B> <"col-sm-6 col-12"f>> rt <"row"<"col-sm-6"i><"col-sm-6"p>>',
      buttons: [{
        extend: 'excelHtml5',
        text: 'Excel ',
        titleAttr: 'Export a Excel',
        className: 'btn btn-default btn-sm'
      }, {
        extend: 'print',
        text: 'Print',
        titleAttr: 'Print',
        className: 'btn btn-default btn-sm'
      }, ],
    });

    // function to insert data to database
    $("#insertFormPos").on("submit", function(e) {
      $("#insertBtnPos").attr("disabled", "disabled");
      e.preventDefault();
      $.ajax({
        url: "../action/control_leave.php?action=leave_insert",
        type: "POST",
        data: new FormData(this),
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          var response = JSON.parse(response);
          if (response.statusCode == 200) {
            $("#createPosition").modal("hide");
            $("#insertBtnPos").removeAttr("disabled");
            table.ajax.reload();
            $("#insertFormPos")[0].reset();
            toastr.success('สำเร็จ.', 'บันทึกข้อมูลเรียร้อย', {
              timeOut: 3500
            }) //$("#successToast").toast("show");//$("#successMsg").html(response.message);
            //fetchPosition();
          } else if (response.statusCode == 500) {
            $("#createPosition").modal("hide");
            $("#insertBtnPos").removeAttr("disabled");
            $("#insertFormPos")[0].reset(); //$(".preview_img").attr("src", "images/default_profile.jpg");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          } else if (response.statusCode == 400) {
            $("#insertBtnPos").removeAttr("disabled");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          }
        }
      });
    });

    // function to edit data
    $("#leave_table").on("click", ".editBtn", function() {
      var id = $(this).val();
      $.ajax({
        url: "../action/control_leave.php?action=leave_one",
        type: "POST",
        dataType: "json",
        data: {
          id: id
        },
        success: function(response) {
          var data = response.data; //alert(data.id);
          $("#editFormPos #id").val(data.id);
          $("#editFormPos select[name='event_name']").val(data.event_name);
          $("#editFormPos select[name='user_name']").val(data.user_name);
          $("#editFormPos input[name='event_start_date']").val(data.event_start_date);
          $("#editFormPos input[name='event_end_date']").val(data.event_end_date);
          $("#editFormPos input[name='event_id']").val(data.event_id);
          $("#editPosition").modal("show");
        }
      });
    });

    // function to update data in database
    $("#editFormPos").on("submit", function(e) {
      var id = $(this).val(); //alert(id);
      $("#editBtnPos").attr("disabled", "disabled");
      e.preventDefault();
      $.ajax({
        url: "../action/control_leave.php?action=leave_update",
        type: "POST",
        data: new FormData(this),
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          var response = JSON.parse(response);
          if (response.statusCode == 200) {
           
            $("#editBtnPos").removeAttr("disabled");
            $("#editFormPos")[0].reset();
            toastr.success('สำเร็จ.', 'บันทึกข้อมูลเรียร้อย', {
              timeOut: 3500
            })
            table.ajax.reload();
            $("#editPosition").modal("hide");
          } else if (response.statusCode == 500) {
            $("#editPosition").modal("hide");
            $("#editBtnPos").removeAttr("disabled");
            $("#editFormPos")[0].reset();
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          } else if (response.statusCode == 400) {
            $("#editBtn").removeAttr("disabled");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          }
        }
      });
    });

    // function to delete data
    $("#leave_table").on("click", ".delBtn", function() {
      event.preventDefault();
      
      var id = $(this).val();
      const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: 'btn btn-primary mx-3',
          cancelButton: 'btn btn-outline-danger',
          text: 'text-primary font-weight-bold'
        },
        buttonsStyling: false
      })
      swalWithBootstrapButtons.fire({
        title: 'คุณต้องการลบ -ข้อมูล ที่  ' + id + ' ?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'ยืนยัน',
        cancelButtonText: 'ยกเลิก!',
        reverseButtons: true
      }).then((result) => {
        if (result.isConfirmed) {
          $.ajax({
            url: "../action/control_leave.php?action=leave_delete",
            type: "POST",
            dataType: "json",
            data: {
              id, //delete_image
            },
            success: function(response) {
              if (response.statusCode == 200) {
                swalWithBootstrapButtons.fire('Deleted!', 'ลบเรียบร้อย', 'success');
                $("#" + id).closest('tr').remove();
                table.ajax.reload();

                //$("#successToast").toast("show");//$("#successMsg").html(response.message);
              } else if (response.statusCode == 500) {
                //$("#errorToast").toast("show"); // $("#errorMsg").html(response.message);
              }
            }
          });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
          swalWithBootstrapButtons.fire('ยกเลิก', 'กลับไปที่หน้าเดิม')
        }
      })
    });
  });
</script>


</html>