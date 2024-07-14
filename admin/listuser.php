<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../inc/assets/custom.css" type="text/css" media="all" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/autofill/2.6.0/css/autoFill.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<body>
    <?php include '../inc/layout/header_admin.php'; ?>
    <div class=" d-flex justify-content-center " style="min-height: calc(90vh - 50px);">
        <div class="container my-5 ">
            <?php include '../inc/layout/headbar_admin.php'; ?>
            <br>
            <table class="table table-sm table-hover table-striped myTable" style="font-size: 15px">
                <thead class="bg-light">
                    <tr>
                        <th>#</th>
                        <th>ชื่อ นามสกุล</th>
                        <th>ตำแหน่ง</th>
                        <th>ระดับ</th>
                        <th>กลุ่มงาน</th>
                        <th width="26%">หน่วยงาน</th>
                        <th>#</th>
                    </tr>
                </thead>
                <tbody>

                    <!--
                        <?php
                        require_once '../connection.php';
                        $stmt = $conn->prepare("SELECT * FROM tb_users");
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
                                <td><?= $r['group_depart'] ?></td>
                                <td><?= $r['department'] ?></td>
                                <td>
                                    <a href="personid.php?no=<?= $r['id'] ?>" class="btn btn-sm btn-primary">เปิด</a>
                         
                            </td>
                            </tr>
                        <?php $i++;
                        } ?> -->
                </tbody>
            </table>
        </div>
    </div>
    <?php include '../inc/layout/footer.php'; ?>
</body>

<script>
    $(document).ready(function() {
        $('.myTable').DataTable({
            "oLanguage": {
                "sLengthMenu": " _MENU_ ",
                "sZeroRecords": "ไม่พบข้อมูล",
                "sInfo": "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
                "sInfoEmpty": "แสดง 0 ถึง 0 จาก 0 แถว",
                "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
                "sInfoPostFix": "",
                "sSearch": "ค้นหา: ",
            },
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

            processing: true,
            paging: false,
            scrollCollapse: true,
            scrollY: '54vh',
            "iDisplayLength": 5,
            dom: '<"row" <"col-sm-6 col-12"B><"col-sm-6 col-12"f>> rt <"row"<"col-sm-6"i><"col-sm-6"p>>',
            ajax: {
                "url": "../inc/api/all_users.php"
            },
            /*
            "ajax": {
                "url": "data.php",
                "dataSrc": ""
            }, */
            "columns": [{
                    "data": "id"
                },
                {
                    "data": "fullname"
                },
                {
                    "data": "position"
                },
                {
                    "data": "levels"
                },
                {
                    "data": "group"
                },
                {
                    "data": "depart"
                },
                {
                    data: null,
                    render: function(data, type, row) {
                        return '<b class="btn btn-light btn-sm btn-circle mx-1" oncLick="view(' + data.id + ')"> <i class="bi bi-check-circle-fill"></i> </b>';
                    }

                }

            ]
        });
    });
</script>

</html>