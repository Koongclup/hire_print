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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../inc/assets/custom.css" type="text/css" media="all" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/autofill/2.6.0/css/autoFill.dataTables.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
  <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
</head>

<body>
  <?php include '../inc/layout/header_admin.php'; ?>
  <div class="vh-90 d-flex justify-content-center " style="min-height: calc(90vh - 50px);">
    <div class="container my-5">
      <?php include '../inc/layout/headbar.php'; ?>
      <div class="p-4 border shadow-sm ">
        <div class="row">
          <div class="col-md-6 mb-3">
            <h5>ตารางตำแหน่งงาน</h5>
            <table class="table table-sm table-hover table-striped " id="tablePos" style="font-size:15px;" width="100%">
              <thead class="bg-white">
                <tr>
                  <th>#</th>
                  <th width="80%">ตำแหน่ง</th>
                  <th width="20%"> <button class="btn btn-white btn-sm float-end" data-bs-toggle="modal" data-bs-target="#createPosition"><i class="fa fa-plus-circle mx-2"></i>เพิ่ม</button> </th>
                </tr>
              </thead>
              <tbody></tbody>
            </table>

          </div>
          <div class="col-md-6">
            <h5>ตารางระดับการปฏิบัติงาน</h5>
            <table class="table table-sm table-hover table-striped " id="tableLev" style="font-size:15px;">
              <thead class="bg-white">
                <tr>
                  <th>#</th>
                  <th width="80%">ระดับ</th>
                  <th width="20%"> <button class="btn btn-white btn-sm float-end" data-bs-toggle="modal" data-bs-target="#createLevel"><i class="fa fa-plus-circle mx-2"></i>เพิ่ม</button> </th>
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
              <h5 class="modal-title" id="exampleModalLabel">เพิ่มตำแหน่ง</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="POST" id="insertFormPos">
                <div class="row mb-3">
                  <div class="col-12">
                    <label class="form-label">ตำแหน่ง</label>
                    <input name="position" class="form-control" id="position" required />
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

      <div class="modal fade" id="createLevel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">เพิ่มระดับ</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="POST" id="insertFormLev">
                <div class="row mb-3">

                  <div class="col-12">
                    <label class="form-label">ระดับ</label>
                    <input name="level" class="form-control" id="level" required />
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary me-1" id="insertBtnLev">Submit</button>
                </div>
              </form>
            </div>

          </div>
        </div>
      </div>



      <!-- Edit Modal -->
      <div class="modal fade" id="editPosition" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">แก้ไขตำแหน่ง</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="POST" id="editFormPos">
                <input type="hidden" name="id" id="id">
                <div class="row mb-3">
                  <div class="col-12">
                    <label class="form-label">ตำแหน่ง</label>
                    <input name="position" class="form-control" id="position">
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

      <div class="modal fade" id="editLevel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">แก้ไขระดับ</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form method="POST" id="editFormLev">
                <input type="hidden" name="id" id="id">
                <div class="row mb-3">
                  <div class="col-12">
                    <label class="form-label">ระดับ</label>
                    <input name="level" class="form-control" id="level">

                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary me-1" id="editBtnLev">Submit</button>
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
<script type="text/javascript">
  $(document).ready(function() {
    $('.select').select2({
      theme: 'bootstrap-5'
    });
  });
</script>


<script>
  $(document).ready(function() {
    // call fetchData function
    fetchPosition();

    //initialize datatables
    var table = $('#tablePos').DataTable({
      'fnCreatedRow': function(nRow, aData, iDataIndex) {
        $(nRow).attr('id', 'my' + iDataIndex); // or whatever you choose to set as the id
      },
      "oLanguage": {
        "sLengthMenu": "แสดง _MENU_ แถว",
        "sInfo": "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
        "sInfoEmpty": "แสดง 0 ถึง 0 จาก 0 แถว",
        "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
        "sSearch": "ค้นหา",
        "oPaginate": {
          "sNext": '>',
          "sPrevious": '<'
        }
      },
      order: [
        [0, 'asc']
      ],
      paging: false,
      scrollCollapse: true,
      scrollY: '30vh',
      "iDisplayLength": 5,
      dom: '<"row" rt <"row"<"col-sm-6"p>>',
    });

    function fetchPosition() {
      $.ajax({
        url: "../action/control_setting.php?action=fetchPos",
        type: "POST",
        dataType: "json",
        success: function(response) {
          var data = response.data;
          table.clear().draw();
          $.each(data, function(index, value) {
            table.row.add([
              value.id,
              value.name,
              '<b class="d-flex justify-content-center"><Button type="button" class="btn btn-sm btn-light shadow-sm editBtn me-1" value="' + value.id + '"><i class="fa-solid fa-pen-to-square"></i></Button>' +
              '<Button type="button" class="btn btn-sm btn-light shadow-sm deleteBtn" value="' + value.id + '"><i class="fa-solid fa-trash"></i></Button></b>'
            ]).draw(false);
          })
        }
      })
    }

    // function to insert data to database
    $("#insertFormPos").on("submit", function(e) {
      $("#insertBtnPos").attr("disabled", "disabled");
      e.preventDefault();
      $.ajax({
        url: "../action/control_setting.php?action=insertPos",
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
            $("#insertFormPos")[0].reset();
            toastr.success('สำเร็จ.', 'บันทึกข้อมูลเรียร้อย', {
              timeOut: 3500
            }) //$("#successToast").toast("show");//$("#successMsg").html(response.message);
            fetchPosition();
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
    $("#tablePos").on("click", ".editBtn", function() {
      var id = $(this).val();
      $.ajax({
        url: "../action/control_setting.php?action=fetchSinglePos",
        type: "POST",
        dataType: "json",
        data: {id: id },
        success: function(response) {
          var data = response.data; //alert(data.id);
          $("#editFormPos #id").val(data.id);
          $("#editFormPos input[name='position']").val(data.name);
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
        url: "../action/control_setting.php?action=updatePos",
        type: "POST",
        data: new FormData(this),
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          var response = JSON.parse(response);
          if (response.statusCode == 200) {
            $("#editPosition").modal("hide");
            $("#editBtnPos").removeAttr("disabled");
            $("#editFormPos")[0].reset();
            toastr.success('สำเร็จ.', 'บันทึกข้อมูลเรียร้อย', {timeOut: 3500})
            fetchPosition();
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
    $("#tablePos").on("click", ".deleteBtn", function() {
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
            url: "../action/control_setting.php?action=deletePosition",
            type: "POST",
            dataType: "json",
            data: {
              id,//delete_image
            },
            success: function(response) {
              if (response.statusCode == 200) {
                swalWithBootstrapButtons.fire('Deleted!', 'ลบเรียบร้อย', 'success');
                fetchPosition();
                $("#" + id).closest('tr').remove();
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
<script>
  $(document).ready(function() {
    // call fetchData function
    fetchLevel();
    //initialize datatables
    var table = $('#tableLev').DataTable({
      'fnCreatedRow': function(nRow, aData, iDataIndex) {
        $(nRow).attr('id', 'my' + iDataIndex); // or whatever you choose to set as the id
      },
      "oLanguage": {
        "sLengthMenu": "แสดง _MENU_ แถว",
        "sInfo": "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
        "sInfoEmpty": "แสดง 0 ถึง 0 จาก 0 แถว",
        "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
        "sSearch": "ค้นหา",
        "oPaginate": {
          "sNext": '>',
          "sPrevious": '<'
        }
      },
      order: [
        [0, 'asc']
      ],
      paging: false,
      scrollCollapse: true,
      scrollY: '30vh',
      "iDisplayLength": 5,
      dom: '<"row" rt <"row"<"col-sm-6"p>>',
    });

    function fetchLevel() {
      $.ajax({
        url: "../action/control_setting.php?action=fetchLev",
        type: "POST",
        dataType: "json",
        success: function(response) {
          var data = response.data;
          table.clear().draw();
          $.each(data, function(index, value) {
            table.row.add([
              value.id,
              value.name,
              '<b class="d-flex justify-content-center"><Button type="button" class="btn btn-sm btn-light shadow-sm editBtn me-1" value="' + value.id + '"><i class="fa-solid fa-pen-to-square"></i></Button>' +
              '<Button type="button" class="btn btn-sm btn-light shadow-sm deleteBtn" value="' + value.id + '"><i class="fa-solid fa-trash"></i></Button></b>'
            ]).draw(false);
          })
        }
      })
    }

    // function to insert data to database
    $("#insertFormLev").on("submit", function(e) {
      $("#insertBtnLev").attr("disabled", "disabled");
      e.preventDefault();
      $.ajax({
        url: "../action/control_setting.php?action=insertLev",
        type: "POST",
        data: new FormData(this),
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          var response = JSON.parse(response);
          if (response.statusCode == 200) {
            $("#createLevel").modal("hide");
            $("#insertBtnLev").removeAttr("disabled");
            $("#insertFormLev")[0].reset();
            //$(".preview_img").attr("src", "images/default_profile.jpg");
            //$("#successToast").toast("show");
            //$("#successMsg").html(response.message);
            toastr.success('สำเร็จ.', 'บันทึกข้อมูลเรียร้อย', {
              timeOut: 3500
            })
            fetchLevel();
          } else if (response.statusCode == 500) {
            $("#createLevel").offcanvas("hide");
            $("#insertBtnLev").removeAttr("disabled");
            $("#insertFormLev")[0].reset();
            //$(".preview_img").attr("src", "images/default_profile.jpg");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          } else if (response.statusCode == 400) {
            $("#insertBtnLev").removeAttr("disabled");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          }
        }
      });
    });

    // function to edit data
    $("#tableLev").on("click", ".editBtn", function() {
      var id = $(this).val();
      $.ajax({
        url: "../action/control_setting.php?action=fetchSingleLevel",
        type: "POST",
        dataType: "json",
        data: {
          id: id
        },
        success: function(response) {
          var data = response.data;
          $("#editFormLev #id").val(data.id);
          $("#editFormLev input[name='level']").val(data.name);
          $("#editLevel").modal("show");
        }
      });
    });

    // function to update data in database
    $("#editFormLev").on("submit", function(e) {
      var id = $(this).val();
      //alert(id);
      $("#editBtnLev").attr("disabled", "disabled");
      e.preventDefault();
      $.ajax({
        url: "../action/control_setting.php?action=updateLev",
        type: "POST",
        data: new FormData(this),
        contentType: false,
        cache: false,
        processData: false,
        success: function(response) {
          var response = JSON.parse(response);
          if (response.statusCode == 200) {
            $("#editLevel").modal("hide");
            $("#editBtnLev").removeAttr("disabled");
            $("#editFormLev")[0].reset();
            //$(".preview_img").attr("src", "images/default_profile.jpg");
            //$("#successToast").toast("show");
            //$("#successMsg").html(response.message);
            toastr.success('สำเร็จ.', 'บันทึกข้อมูลเรียร้อย', {
              timeOut: 3500
            })
            fetchLevel();
          } else if (response.statusCode == 500) {
            $("#editLevel").modal("hide");
            $("#editBtnLev").removeAttr("disabled");
            $("#editFormLev")[0].reset();
            //$(".preview_img").attr("src", "images/default_profile.jpg");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          } else if (response.statusCode == 400) {
            $("#editBtnLev").removeAttr("disabled");
            $("#errorToast").toast("show");
            $("#errorMsg").html(response.message);
          }
        }
      });
    });
    // function to delete data
    $("#tableLev").on("click", ".deleteBtn", function() {
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
            url: "../action/control_setting.php?action=deleteLevel",
            type: "POST",
            dataType: "json",
            data: {
              id,
              //delete_image
            },
            success: function(response) {
              if (response.statusCode == 200) {
                swalWithBootstrapButtons.fire('Deleted!', 'ลบเรียบร้อย', 'success');
                fetchLevel();
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


  });
</script>

</html>