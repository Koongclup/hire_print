<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" >
  <link rel="stylesheet" href="https://cdn.datatables.net/autofill/2.6.0/css/autoFill.dataTables.min.css" >
  <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.css" >
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <link rel="stylesheet" href="inc/assets/custom.css" type="text/css" media="all" />
</head>

<body>
  <?php include 'inc/layout/header.php'; ?>
  <div class="d-flex justify-content-center " style="min-height: calc(90vh - 10px);">
    <div class="container my-5">
      <?php include 'inc/layout/headbar.php'; ?>
      <br>
      <table class="table table-sm table-hover table-striped mt-5" id="myTable" style="font-size:15px;">
        <thead class="bg-white">
          <tr>
            <th>#</th>
            <th width="20%">ชื่อ นามสกุล</th>
            <th width="25%">ตำแหน่ง</th>
            <th>วันที่เริ่มทำงาน</th>
            <th>รหัสประจำตัวประชาชน</th>
            <th>ฉ11</th>
            <th width="10%">รายการ </th>
            <!-- <button class="btn btn-primary btn-sm float-end" data-bs-toggle="offcanvas" data-bs-target="#offcanvasAddUser"><i class="fa fa-plus-circle mx-2"></i>เพิ่มผู้ใช้</button> -->
          </tr>
        </thead>
        <tbody>
         
        </tbody>
      </table>

      

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
              <div class="col-12>
                                <label class=" form-label">ชื่อ นามสกุล</label>
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

            <div class="mb-3">
              <label class="form-label">ตำแหน่ง</label>
              <select name="position" class="form-select" name="position" id="position">
                <option disabled name="position">เลือก</option>
                <option value="นักวิชาการคอมพิวเตอร์">นักวิชาการคอมพิวเตอร์</option>
                <option value="เจ้าพนักงานเครื่องคอมพิวเตอร์">เจ้าพนักงานเครื่องคอมพิวเตอร์</option>
                <option value="เจ้าพนักงานเวชสถิติปฏิบัติงาน">เจ้าพนักงานเวชสถิติปฏิบัติงาน</option>
                <option value="นักวิชาการสาธารณสุข(เวชสถิติ)">นักวิชาการสาธารณสุข(เวชสถิติ)</option>
                <option value="เจ้าพนักงานเวชระเบียน">เจ้าพนักงานเวชระเบียน</option>
                <option value="เจ้าพนักงานเวชสถิติปฏิบัติงาน">เจ้าพนักงานเวชสถิติปฏิบัติงาน</option>
                <option value="นักวิชาการสาธารณสุข">นักวิชาการสาธารณสุข</option>

              </select>
            </div>
            <div class="mb-3">
              <label class="form-label">วันที่เริ่มทำงาน</label>
              <input type="date" class="form-control" name="startdate" id="startdate" required>
            </div>
            <br>
            <div>
              <!--<button type="submit" class="btn btn-primary me-1" id="editBtn">Update</button>-->
              <button type="button" class="btn btn-secondary" data-bs-dismiss="offcanvas">Cancel</button>
            </div>
          </form>
        </div>
      </div>



      <!-- Toast container  -->
      <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <!-- Success toast  -->
        <div class="toast align-items-center text-bg-success" role="alert" aria-live="assertive" aria-atomic="true" id="successToast">
          <div class="d-flex">
            <div class="toast-body">
              <strong>Success!</strong>
              <span id="successMsg"></span>
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
  <?php include 'inc/layout/footer.php'; ?>

</body>

<script>
  $(document).ready(function() {
    // call fetchData function
    fetchData();
    //initialize datatables
    var table = $('#myTable').DataTable({
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
        [0, 'asc']
      ],

      iDisplayLength: 10,
      lengthMenu: [
        [5, 10, 25, 50, -1],
        [5, 10, 25, 50, "ทั้งหมด"]
      ],
    });
    //let table = new DataTable("#myTable");

    // function to display image before upload
    $("input.image").change(function() {
      var file = this.files[0];
      var url = URL.createObjectURL(file);
      $(this).closest(".row").find(".preview_img").attr("src", url);
    });

    // function to fetch data from database
    function fetchData() {
      $.ajax({
        url: "action/control_users.php?action=fetchData",
        type: "POST",
        dataType: "json",
        success: function(response) {
          var data = response.data;
          table.clear().draw();
          $.each(data, function(index, value) {
            table.row.add([
              value.id,
              value.fullname,
              value.position,
              value.start_date,
              value.cid,
              value.paypost,
              '<a class="btn btn-sm btn-light shadow-sm editBtn me-1" value="' + value.id + '"><i class="bi bi-chat-quote"></i> ดูข้อมูล</a>'
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
        url: "action/control_users.php?action=insertData",
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
            $("#successToast").toast("show");
            $("#successMsg").html(response.message);
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
        url: "action/control_users.php?action=fetchSingle",
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
          $("#editForm input[name='cid']").val(data.cid);
          $("#editForm input[name='paypost']").val(data.paypost);
          $("#editForm select[name='position']").val(data.position);
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
        url: "action/control_users.php?action=updateData",
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
            $("#successToast").toast("show");
            $("#successMsg").html(response.message);
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
            url: "action/control_users.php?action=deleteData",
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