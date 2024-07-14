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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" />
  <link href="https://cdn.datatables.net/fixedheader/3.4.0/css/fixedHeader.dataTables.css" rel="stylesheet">
  <script src="https://cdn.datatables.net/fixedheader/3.4.0/js/dataTables.fixedHeader.js"></script>
</head>

<body>
  <?php include '../inc/layout/header_admin.php'; ?>
  <div class="vh-90 d-flex justify-content-center " style="min-height: calc(90vh - 50px);">
    <div class="container my-5 ">
      <?php include '../inc/layout/headbar.php'; ?>
      <div class="table-responsive">
      <table class="table table-sm table-hover table-striped " id="myTable" style="font-size:15px;">
        <thead class="bg-white">
          <tr>
            <th>#</th>
            <th width="20%">ชื่อ นามสกุล</th>
            <th width="25%">ตำแหน่ง</th>
            <th>วันที่เริ่มทำงาน</th>
            <th>รหัสประจำตัวประชาชน</th>
            <th>ฉ11</th>
            <th>สถานะ</th>
            <th width="10%"> <button class="btn btn-white btn-sm float-end" data-bs-toggle="offcanvas" data-bs-target="#offcanvasAddUser"><i class="fa fa-plus-circle mx-2"></i>เพิ่มผู้ใช้</button> </th>
          </tr>
        </thead>
      </table>
      </div>

      <!-- Create New User -->
      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasAddUser" style="width:600px;">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasExampleLabel">Add new user</h5>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <hr>
        <div class="offcanvas-body">
          <form method="POST" id="insertForm">
            <div class="row mb-3">
              <div class="col-2">
                <label class="form-label">คำนำ</label>
                <select name="pname" class="form-select">
                  <option value="นาย">นาย</option>
                  <option value="นาง">นาง</option>
                  <option value="นางสาว">นางสาว</option>
                </select>
              </div>
              <div class="col-5">
                <label class="form-label">ชื่อ </label>
                <input type="text" class="form-control" name="first_name" placeholder="" required />
              </div>
              <div class="col-5">
                <label class="form-label">นามสกุล</label>
                <input type="text" class="form-control" name="last_name" placeholder="" required />
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-7">
                <label class="form-label">รหัสประจำตัวประชาชน</label>
                <input type="text" class="form-control" name="cid" placeholder="" required />
              </div>
              <div class="col-5">
                <label class="form-label">ฉ11</label>
                <input type="number" class="form-control" name="paypost" placeholder="" required />
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-7">
                <label class="form-label">ตำแหน่ง</label>
                <select name="position" class="form-select select" id="position">
                  <option selected>เลือก</option>
                  <?php foreach ($pos as $r) {
                    echo "<option value='" . $r["name"] . "'>" . $r["name"] . "</option>";
                  }
                  ?>

                </select>
              </div>
              <div class="col-5">
                <label class="form-label">ตำแหน่ง</label>
                <select name="level" class="form-select select" id="level">
                  <option selected>เลือก</option>
                  <?php foreach ($level as $r) {
                    echo "<option value='" . $r["name"] . "'>" . $r["name"] . "</option>";
                  }
                  ?>
                </select>
              </div>
            </div>

            <div class="mb-3">
              <label class="form-label">วันที่เริ่มทำงาน</label>
              <input type="date" class="form-control" name="startdate" required>
            </div>

            <div>
              <button type="submit" class="btn btn-primary me-1" id="insertBtn">Submit</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="offcanvas">Cancel</button>
            </div>
          </form>
        </div>
      </div>

      <!-- Edit user offcanvas  -->
      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasEditUser" style="width:600px;">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasExampleLabel">Edit user data</h5>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <hr>
        <div class="offcanvas-body">
          <form method="POST" id="editForm">
            <input type="hidden" name="id" id="id">
            <div class="row mb-3">
              <div class="col-12">
                <label class="form-label">ชื่อ นามสกุล</label>
                <input type="text" class="form-control" name="fullname" id="fullname" readonly disabled />
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-7">
                <label class="form-label">รหัสประจำตัวประชาชน</label>
                <input type="text" class="form-control" name="cid" id="cid" placeholder="" required />
              </div>
              <div class="col-5">
                <label class="form-label">ฉ11</label>
                <input type="number" class="form-control" name="paypost" id="paypost" placeholder="" required />
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-7">
                <label class="form-label">ตำแหน่ง</label>
                <select name="position" class="form-select select" id="position">
                  <option selected>เลือก</option>
                  <?php foreach ($pos as $r) {
                    echo "<option value='" . $r["name"] . "'>" . $r["name"] . "</option>";
                  }
                  ?>
                </select>
              </div>

              <div class="col-5">
                <label class="form-label">ตำแหน่ง</label>
                <select name="level" class="form-select select" id="level">
                  <option selected>เลือก</option>
                  <?php foreach ($level as $r) {
                    echo "<option value='" . $r["name"] . "'>" . $r["name"] . "</option>";
                  }
                  ?>
                </select>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-7 mb-2">
                <label class="form-label">วันที่เริ่มทำงาน</label>
                <input type="date" class="form-control" name="startdate" id="startdate" required>
              </div>

              <div class="col-7">
                <label class="form-label">วันที่คำนวน</label>
                <input type="date" class="form-control" name="caldate" id="caldate" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
              </div>

              <div class="col-5">
                <label class="form-label">สถานะ</label>
                <select name="active" class="form-select" id="active">
                  <option disabled>เลือก</option>
                  <option value="Y">ใช้งาน</option>
                  <option value="N">ปิด</option>
                </select>
              </div>
            </div>
            <br>
            <div>
              <button type="submit" class="btn btn-primary me-1" id="editBtn">Update</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="offcanvas">Cancel</button>
            </div>
          </form>
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
<script type="text/javascript">
  $(document).ready(function() {
    $('.select').select2({
      theme: 'bootstrap-5'
    });
  });

  // Set today's date as the default value
  const today = new Date();
  const dd = String(today.getDate()).padStart(2, '0');
  const mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
  const yyyy = today.getFullYear();
  const todayString = dd + '/' + mm + '/' + yyyy;
  document.getElementById('caldate').value = todayString;
</script>

<script>
  $(document).ready(function() {
    // call fetchData function
    fetchData();
    //initialize datatables
    var table = $('#myTable').DataTable({
      "fnCreatedRow": function(nRow, aData, iDataIndex) {
        $(nRow).attr('id', aData[0]);
      },
      "oLanguage": {
        "sLengthMenu": "แสดง _MENU_ แถว",
        "sInfo": "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
        "sInfoEmpty": "แสดง 0 ถึง 0 จาก 0 แถว",
        "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
        "sSearch": "ค้นหา",
        "oPaginate": {
          "sNext": '<i class="fa fa-chevron-right fa-sm" ></i>',
          "sPrevious": '<i class="fa fa-chevron-left fa-sm" ></i>'
        }
      },
      order: [
        [0, 'desc']
      ],

      iDisplayLength: 5,
      lengthMenu: [
        [5, 10, 25, 50, -1],
        [5, 10, 25, 50, "ทั้งหมด"]
      ],
    });
    /*
    let table = new DataTable("#myTable");
     function to display image before upload
        $("input.image").change(function() {
          var file = this.files[0];
          var url = URL.createObjectURL(file);
          $(this).closest(".row").find(".preview_img").attr("src", url);
        });
     */
    // function to fetch data from database
    function fetchData() {
      $.ajax({
        url: "../action/control_users.php?action=fetchAll",
        type: "POST",
        dataType: "json",
        success: function(response) {
          var data = response.data;
          table.clear().draw();
          $.each(data, function(index, value) {
            let activeStatus = value.active === 'Y' ? '<b class="badge bg-dark"> ใช้งาน </b>' : '<b class="badge bg-danger"> ปิด </b>';
            let poslevel = '<a>' + value.position + '' + value.level + ' </a>';
            table.row.add([
              value.id,
              value.fullname,
              poslevel,
              value.start_date,
              value.cid,
              value.payposts,
              activeStatus,
              '<b class="d-flex justify-content-center"><Button type="button" class="btn btn-sm btn-light shadow-sm editBtn me-1" value="' + value.id + '"><i class="fa-solid fa-pen-to-square"></i></Button>' +
              '<Button type="button" class="btn btn-sm btn-light shadow-sm deleteBtn" value="' + value.id + '"><i class="fa-solid fa-trash"></i></Button></b>'
            ]).draw(false);
          })
        }
      })
    }

    // function to insert data to database
    $("#insertForm").on("submit", function(e) {
      $("#insertBtn").attr("disabled", "disabled");
      e.preventDefault();
      $.ajax({
        url: "../action/control_users.php?action=insertData",
        type: "POST",
        data: new FormData(this),
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          var response = JSON.parse(response);
          if (response.statusCode == 200) {
            $("#offcanvasAddUser").offcanvas("hide");
            $("#insertBtn").removeAttr("disabled");
            $("#insertForm")[0].reset();
            //$(".preview_img").attr("src", "images/default_profile.jpg");
            //$("#successToast").toast("show");
            //$("#successMsg").html(response.message);
            toastr.success('สำเร็จ.', 'บันทึกข้อมูลเรียร้อย', {
              timeOut: 3500
            })
            fetchData();
          } else if (response.statusCode == 500) {
            $("#offcanvasAddUser").offcanvas("hide");
            $("#insertBtn").removeAttr("disabled");
            $("#insertForm")[0].reset();
            //$(".preview_img").attr("src", "images/default_profile.jpg");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          } else if (response.statusCode == 400) {
            $("#insertBtn").removeAttr("disabled");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          }
        }
      });
    });

    // function to edit data
    $("#myTable").on("click", ".editBtn", function() {
      var id = $(this).val();
      $.ajax({
        url: "../action/control_users.php?action=fetchSingle",
        type: "POST",
        dataType: "json",
        data: {
          id: id
        },
        success: function(response) {
          var data = response.data;
          $("#editForm #id").val(data.id);
          $("#editForm input[name='fullname']").val(data.fullname);
          $("#editForm input[name='startdate']").val(data.start_date);
          $("#editForm input[name='caldate']").val(data.start_dated);
          $("#editForm input[name='cid']").val(data.cid);
          $("#editForm input[name='paypost']").val(data.paypost);
          $("#editForm select[name='position']").val(data.position);
          $("#editForm select[name='active']").val(data.active);
          $("#editForm select[name='level']").val(data.level);
          //$("#editForm .preview_img").attr("src", "uploads/" + data.image + "");
          /*
          $("#editForm #image_old").val(data.image);
          if (data.gender === "male") {
            $("#editForm input[name='gender'][value='male']").attr("checked", true);
          } else if(data.gender === "female") {
            $("#editForm input[name='gender'][value='female']").attr("checked", true);          
          } */
          // show the edit user offcanvas
          $("#offcanvasEditUser").offcanvas("show");
        }
      });
    });

    // function to update data in database
    $("#editForm").on("submit", function(e) {
      var id = $(this).val();
      //alert(id);
      $("#editBtn").attr("disabled", "disabled");
      e.preventDefault();
      $.ajax({
        url: "../action/control_users.php?action=updateData",
        type: "POST",
        data: new FormData(this),
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          var response = JSON.parse(response);
          if (response.statusCode == 200) {
            $("#offcanvasEditUser").offcanvas("hide");
            $("#editBtn").removeAttr("disabled");
            $("#editForm")[0].reset();
            //$(".preview_img").attr("src", "images/default_profile.jpg");
            //$("#successToast").toast("show");
            //$("#successMsg").html(response.message);
            toastr.success('สำเร็จ.', 'บันทึกข้อมูลเรียร้อย', {
              timeOut: 3500
            })
            fetchData();
          } else if (response.statusCode == 500) {
            $("#offcanvasEditUser").offcanvas("hide");
            $("#editBtn").removeAttr("disabled");
            $("#editForm")[0].reset();
            //$(".preview_img").attr("src", "images/default_profile.jpg");
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
    $("#myTable").on("click", ".deleteBtn", function() {
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
            url: "../action/control_users.php?action=deleteData",
            type: "POST",
            dataType: "json",
            data: {
              id,
              //delete_image
            },
            success: function(response) {
              if (response.statusCode == 200) {
                swalWithBootstrapButtons.fire('Deleted!', 'ลบเรียบร้อย', 'success');
                fetchData();
                $("#" + id).closest('tr').remove();
                //$("#successToast").toast("show");
                //$("#successMsg").html(response.message);
              } else if (response.statusCode == 500) {
                //$("#errorToast").toast("show");
                // $("#errorMsg").html(response.message);
              }
            }
          });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
          swalWithBootstrapButtons.fire('ยกเลิก', 'กลับไปที่หน้าเดิม')
        }
      })
    });
    /*
      if (confirm("Are you sure you want to delete this user?")) {
        var id = $(this).val();
        //var delete_image = $(this).closest("td").find(".delete_image").val();
        $.ajax({
          url: "server.php?action=deleteData",
          type: "POST",
          dataType: "json",
          data: {
            id,
            //delete_image
          },
          success: function(response) {
            if (response.statusCode == 200) {
              fetchData();
              $("#successToast").toast("show");
              $("#successMsg").html(response.message);
            } else if (response.statusCode == 500) {
              $("#errorToast").toast("show");
              $("#errorMsg").html(response.message);
            }
          }
        })
      }
    }) */

  });
</script>

</html>