<?php
session_start();
@ini_set('display_errors', '0'); ?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../inc/assets/custom.css" type="text/css" media="all" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="inc/assets/custom.css" type="text/css" media="all" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/autofill/2.6.0/css/autoFill.dataTables.min.css" rel="stylesheet">
  <link href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.css" rel="stylesheet">
</head>

<body>
  <?php include 'inc/layout/header.php'; ?>
  <div class=" d-flex justify-content-center" style="min-height: calc(90vh - 50px);">
    <div class="container my-5 ">
      <?php include 'inc/layout/headbar.php'; ?>
      <div class="py-2">
        <form class="row" action="">
          <div class="col-md-4 mt-2">
            <div class="input-group ">
              <span class="input-group-text fw-bold shadow-sm" id="inputGroupPrepend2"><i class="bi bi-calendar-check-fill"></i></span>
              <input type="hidden" name="page" value="<?= $_GET['page'] ?>">
              <input name="b" class="form-control shadow-sm" type="text" id="b" onfocus="(this.type='date')" onblur="(this.type='text')" placeholder="วัน-เดือน-ปีคศ" onfocus="(this.type='date')" value="" required />
              <button class="btn btn-dark shadow-sm" type="submit" id="button-addon2"> <i class="bi bi-search"></i> ค้นหา</button>
            </div>
          </div>
          <div class="col-md-8">
            <?php $b = $_GET['b'];
            if ($b != '') {
              echo '<a class="btn btn-outline-primary border shadow-sm float-end my-2" href="print/select_date.php?b=' . $_GET['b'] . '"  ><i class="bi bi-printer-fill"></i>  ไปหน้าพิมพ์ทั้งหมด</a>';
            }
            ?>
          </div>
        </form>
        <br>
        <table class="table table-sm table-hover table-striped view ">
          <thead class="bg-white">
            <tr>
              <th>#</th>
              <th>ชื่อ นามสกุล</th>
              <th>ตำแหน่ง</th>
              <th>ระดับ</th>
              <th>เริ่มทำงาน</th>
              <th>รวม</th>
              <th>รหัสประจำตัวประชาชน</th>
              <th>ฉ11</th>
              <th width="14%">#</th>
            </tr>
          </thead>
          <tbody>
            <?php
            require_once 'connection.php';
            $stmt = $conn->prepare("SELECT g.*,
            CASE WHEN  id in ('111','117') and  DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' ) ) + 1 = 12   THEN  DATE_FORMAT('$b' , '%Y' ) - DATE_FORMAT( start_dated, '%Y' ) - ( DATE_FORMAT('$b', '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' ) ) 
            
            WHEN id not in ('111','117') and DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' ) ) + 1 = 12   THEN  DATE_FORMAT('$b' , '%Y' ) - DATE_FORMAT( start_dated, '%Y' ) - ( DATE_FORMAT('$b', '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' ) ) + 1 
            
                WHEN id not in ('111','117') and DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT( '$b' , '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' ) ) = '-2' THEN DATE_FORMAT('$b' , '%Y' ) - DATE_FORMAT( start_dated, '%Y' ) - ( DATE_FORMAT( '$b' , '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' ) )+1 ELSE  DATE_FORMAT('$b' , '%Y' ) - DATE_FORMAT( start_dated, '%Y' ) - ( DATE_FORMAT( '$b', '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' ) ) END as strYear,
                
            CASE  WHEN id in ('111','117') AND DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - (DATE_FORMAT('$b' , '00-%m-%d' ) 
                < DATE_FORMAT(start_dated, '00-%m-%d')) = 12  THEN  0
                
                
                WHEN id in ('111','117') AND DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - (DATE_FORMAT('$b' , '00-%m-%d' ) 
                < DATE_FORMAT(start_dated, '00-%m-%d')) > 0  THEN  DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-%m-%d' ) 
                < DATE_FORMAT(start_dated, '00-%m-%d'))
                
                WHEN id in ('111','117') AND DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' )) < 0  THEN  12 + (DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' )))+1
                
                WHEN DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) = '-1' THEN 0
                WHEN DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) = '-2' THEN 11
                WHEN DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-%m-%d' ) < DATE_FORMAT( start_dated, '00-%m-%d' ) ) + 1 = 12 THEN '0'
                WHEN DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-%m-%d' ) 
                < DATE_FORMAT( start_dated, '00-%m-%d' ) )  < 0 THEN 12+( DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-00-%d' ) 
                < DATE_FORMAT( start_dated, '00-00-%d' ) ) + 1 )
                    
                ELSE DATE_FORMAT('$b' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$b' , '00-00-%d' ) < DATE_FORMAT( start_dated, '00-00-%d' ) ) + 1  END as strMonth 
        
        FROM user_group g where active ='Y'");
            $stmt->execute();
            $result = $stmt->fetchAll();
            $i = 1;
            foreach ($result as $r) {
            ?>
              <tr>
                <td><?= $i ?></td>
                <td><?= $r['fullname'] ?></td>
                <td><?= $r['position'] ?></td>
                <td><?= $r['level'] ?></td>
                <td><?= $r['start_date'] ?></td>
                <td><?= $r['strYear'] ?> ปี <?= $r['strMonth'] ?> เดือน </td>
                <td><?= $r['cid'] ?></td>
                <td><?= $r['paypost'] ?></td>
                <td>
                  <?php
                  $b = $_GET['b'];
                  if ($b != '') {
                    echo '
                    <a href="print/person_workpay.php?no=' . $r['id'] . '&b=' . $_GET['b'] . '" class="btn btn-sm btn-light text-secondary shadow-sm">บ 1</a>
                    <a href="print/person_workyear.php?no=' . $r['id'] . '&b=' . $_GET['b'] . '" class="btn btn-sm btn-light text-danger shadow-sm">บ 2</a>
                    <a href="print/person_print.php?no=' . $r['id'] . '&b=' . $_GET['b'] . '" class="btn btn-sm btn-light text-primary shadow-sm">ทั้งหมด</a>';
                  } else {
                    echo ' <a class="btn btn-sm btn-light text-primary shadow-sm">ยังไม่เลือกวัน</a>';
                  } ?>
                </td>
              </tr>
            <?php $i++;
            } ?>
          </tbody>

        </table>
      </div>
    </div>
  </div>
  <?php include 'inc/layout/footer.php'; ?>
</body>

<script>
  $(document).ready(function() {
    var table = $('.view').DataTable({
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
      scrollY: '60vh',
      "iDisplayLength": 5,
      dom: '<"row" rt <"row"<"col-sm-6"i><"col-sm-6"p>>',
    });
  });
</script>

</html>