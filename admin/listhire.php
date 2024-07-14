<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" >
    <link rel="stylesheet" href="../inc/assets/custom.css" type="text/css" media="all" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<body>
    <?php include '../inc/layout/header_admin.php'; ?>
    <div class="vh-50 d-flex justify-content-center" style="min-height: calc(90vh - 50px);">
        <div class="container my-5 mx-1">
            <?php include '../inc/layout/headbar_admin.php'; ?>
            <br>
            <table class="table table-sm table-hover table-striped ">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>ชื่อ นามสกุล</th>
                        <th>ตำแหน่ง</th>
                        <th>วันที่เริ่มทำงาน</th>
                        <th>รหัสประจำตัวประชาชน</th>
                        <th>ค่าจ้าง</th>
                        <th>รวมคาบ</th>
                        <th width="6%">####</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    require_once '../connection.php';
                    $stmt = $conn->prepare("SELECT * FROM user_group where hire_group='3'");
                    $stmt->execute();
                    $result = $stmt->fetchAll();
                    $i = 1;
                    foreach ($result as $r) { ?>
                        <tr>
                            <td><?= $i ?></td>
                            <td><?= $r['fullname'] ?></td>
                            <td><?= $r['position'] ?></td>
                            <td><?= $r['start_date'] ?></td>
                            <td><?= $r['cid'] ?></td>
                            <td contenteditable="true" onfocus="changeBackground(this);" onblur="saveData(this, '<?php echo $r["id"]; ?>', 'hire_rate');"><?= $r['hire_rate'] ?></td>
                            <td contenteditable="true" onfocus="changeBackground(this);" onblur="saveData(this, '<?php echo $r["id"]; ?>', 'workday');"><?php echo $r['workday']; ?></td>
                            <td align="center">
                                <a href="../print/hireid.php?no=<?= $r['id'] ?>" class="btn btn-sm btn-outline-primary border shadow-sm"> เปิด</a>
                            </td>
                        </tr>
                    <?php $i++; } ?>
                </tbody>
            </table>
        </div>
    </div>
    <?php include '../inc/layout/footer.php'; ?>
    <script>
        function changeBackground(obj) {
            $(obj).removeClass("bg-white");
            $(obj).addClass("bg-light");
        }
        function saveData(obj, id, column) {
            var customer = {
                id: id,
                column: column,
                value: obj.innerHTML
            }
            $.ajax({
                type: "POST",
                url: "../action/savechang.php",
                data: customer,
                dataType: 'json',
                success: function(data) {
                    if (data) {
                        $(obj).removeClass("bg-light");
                        $(obj).addClass("text-primary fw-bold");
                        toastr.success('Success!', 'บันทึกข้อมูลเรียบร้อย ');
                    }
                }
            });
        }
    </script>
</body>

</html>