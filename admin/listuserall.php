<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../inc/assets/custom.css" type="text/css" media="all" />
    <!-- Data Table  -->
    <link href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.dataTables.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/autofill/2.6.0/css/autoFill.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.css" rel="stylesheet">

</head>

<body>
    <?php include '../inc/layout/header_admin.php'; ?>
    <div class="d-flex justify-content-center" style="min-height: calc(90vh - 50px);">
        <div class="container my-5 ">
            <?php include '../inc/layout/headbar_admin.php'; ?>
            <br>
            <table class="table table-sm table-hover table-striped" style="font-size: 14px" id="myUser">
                <thead class="bg-light">
                    <tr>
                        <th>#</th>
                        <th>ชื่อ นามสกุล</th>
                        <th>ตำแหน่ง</th>
                        <th>ระดับ</th>
                        <th>กลุ่มงาน</th>
                        <th>หน่วยงาน</th>
                        <th>#</th>
                    </tr>
                </thead>
                <tbody></tbody>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>ชื่อ นามสกุล</th>
                        <th>ตำแหน่ง</th>
                        <th>ระดับ</th>
                        <th>กลุ่มงาน</th>
                        <th>หน่วยงาน</th>
                        <th>#</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <?php include '../inc/layout/footer.php'; ?>
</body>

<script>
    var dataTable = $('#myUser').DataTable({
        "oLanguage": {
            "sLengthMenu": "แสดง _MENU_ แถว",
            "sZeroRecords": "ไม่พบข้อมูล",
            "sInfo": "แสดง _START_ ถึง _END_ จาก _TOTAL_ แถว",
            "sInfoEmpty": "แสดง 0 ถึง 0 จาก 0 แถว",
            "sInfoFiltered": "(กรองข้อมูล _MAX_ ทุกแถว)",
            "sSearch": "ค้นหา",
            "sSearchPlaceholder": "ค้นหา",
            "oPaginate": {
                "sFirst": "หน้าแรก",
                "sLast": "หน้าสุดท้าย",
                "sNext": '>',
                "sPrevious": '<'
            }
        },
        processing: true,
        "iDisplayLength": 5,

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
        "fnCreatedRow": function(nRow, aData, iDataIndex) {
            $(nRow).attr('id', aData[0]);
        },
        ajax: {
            "url": "../inc/api/all_users.php"
        },
        initComplete: function() {
            this.api()
                .columns()
                .every(function() {
                    let column = this;
                    let title = column.footer().textContent;
                    let input = document.createElement('input');
                    input.classList.add("form-control");
                    input.placeholder = title;
                    column.footer().replaceChildren(input);
                    input.addEventListener('keyup', () => {
                        if (column.search() !== this.value) {
                            column.search(input.value).draw();
                        }
                    });
                });
        },
        "columns": [{
            "data": "id"
        }, {
            "data": "fullname"
        }, {
            "data": "position"
        }, {
            "data": "levels"
        }, {
            "data": "group"
        }, {
            "data": "depart"
        }, {
            data: null,
            render: function(data, type, row) {
                return '<b class="btn btn-light btn-sm btn-circle mx-1" oncLick="view(' + data.id + ')"> <i class="bi bi-badge-hd-fill"></i> </b>';
            }
        }]
    });
    /*
       "ajax": {
           "url": "data.php",
           "dataSrc": ""
       }, */
</script>

</html>