<?php
session_start();
@ini_set('display_errors', '0');
$con = mysqli_connect("192.168.212.101", "sa", "7188455", "nhso_library");
$con->set_charset("utf8");

//กำหนด charset ให้เป็น utf8 เพื่อรองรับภาษาไทย
date_default_timezone_set('Asia/Bangkok');
function DateThai($day)
{
    $Year = date("Y", strtotime($day)) + 543;
    $Month = date("n", strtotime($day));
    $Day = date("j", strtotime($day));
    $MonthCut = array("", "ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค.");
    $MonthThai = $MonthCut[$Month];
    return "$Day $MonthThai $Year";
}
$date = date("d-m-Y");
$time = date("H:i:s");
$datetime = date("Y-m-d H:i:s");

function Convert($amount_number)
{
    $amount_number = number_format($amount_number, 2, ".", "");
    $pt = strpos($amount_number, ".");
    $number = $fraction = "";
    if ($pt === false)
        $number = $amount_number;
    else {
        $number = substr($amount_number, 0, $pt);
        $fraction = substr($amount_number, $pt + 1);
    }

    $ret = "";
    $baht = ReadNumber($number);
    if ($baht != "")
        $ret .= $baht . "บาท";

    $satang = ReadNumber($fraction);
    if ($satang != "")
        $ret .=  $satang . "สตางค์";
    else
        $ret .= "ถ้วน";
    return $ret;
}

function ReadNumber($number)
{
    $position_call = array("แสน", "หมื่น", "พัน", "ร้อย", "สิบ", "");
    $number_call = array("", "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า");
    $number = $number + 0;
    $ret = "";
    if ($number == 0) return $ret;
    if ($number > 1000000) {
        $ret .= ReadNumber(intval($number / 1000000)) . "ล้าน";
        $number = intval(fmod($number, 1000000));
    }

    $divider = 100000;
    $pos = 0;
    while ($number > 0) {
        $d = intval($number / $divider);
        $ret .= (($divider == 10) && ($d == 2)) ? "ยี่" : ((($divider == 10) && ($d == 1)) ? "" : ((($divider == 1) && ($d == 1) && ($ret != "")) ? "เอ็ด" : $number_call[$d]));
        $ret .= ($d ? $position_call[$pos] : "");
        $number = $number % $divider;
        $divider = $divider / 10;
        $pos++;
    }
    return $ret;
}
?>


<html>

<head>
    <title> </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Sarabun:wght@200&display=swap');

    body {
        width: 230mm;
        height: 100%;
        margin: 0 auto;
        background: rgb(204, 204, 204);
        font: 16px "TH Sarabun PSK";
        font-family: 'Sarabun', sans-serif;
    }

    * {
        box-sizing: border-box;
        -moz-box-sizing: border-box;
    }

    table.c {
        table-layout: auto;
        width: 100%;
        color: #000;
    }

    table.b {
        table-layout: auto;
        width: 100%;
        font: 16px "TH Sarabun PSK";
        font-family: 'Sarabun', sans-serif;
        border: 1px solid black;

    }

    tr,
    td {
        padding: 5px 3px;
        border: 1px solid black;
        font-size: 16px;
        color: #000;
    }



    .main-page {
        width: 210mm;
        min-height: 297mm;
        margin: 10mm auto;
        background: white;
        box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
    }

    .sub-page {
        padding: 2cm 1.5cm 1.5cm 2.5cm;
        height: 297mm;
    }

    @page {
        size: A4;
        margin: 0;
    }

    @media print {

        html,
        body {
            width: 210mm;
            height: 297mm;
        }

        .main-page {
            margin: 0;
            border: initial;
            border-radius: initial;
            width: initial;
            min-height: initial;
            box-shadow: initial;
            background: initial;
            page-break-after: always;
        }
    }

    .grid-container {
        width: 100%;
        display: grid;
        grid-template-columns: auto auto auto;
        padding: 2px;
        text-align: center;
    }

    .grid-container2 {
        width: 100%;
        display: grid;
        grid-template-columns: auto auto auto;
        padding: 2px 10px;
    }

    .grid-item {
        padding: 4px 17px;
        text-align: center;
    }

    .grid-item2 {
        width: 100%;
        padding: 4px 8px;
    }
</style>

<body Onloadก="window.print();">
    <div class="main-page">
        <div class="sub-page">
            <p align="center" style="font-size:18px" class="fw-bold">ใบสำคัญรับเงิน</p>
            <p></p>
            <div class="grid-container2">
                <div class="grid-item2"></div>
                <div class="grid-item2">
                    <p style="margin-left:260px;">ที่ <span style="margin-left:36px;"> โรงพยาบาลขุขันธ์</span> </p>
                    <p style="margin-left:260px;">วันที่</p>
                </div>
            </div>
            <p></p>
            <p style="margin-left:30px;">ข้าพเจ้า </p>
            <p style="margin-left:30px;">ที่อยู่บ้านเลขที่ 109 หมู่ที่ 6 ตำบล <b class="mx-2">หนองฉลอง</b> อำเภอ <b class="mx-2">ขุขันธ์</b> จังหวัด <b class="mx-2">ศรีสะเกษ</b> </p>
            <p style="margin-left:30px;">ได้รับเงินจาก ...โรงพยาบาลขุขันธ์... จังหวัด ...ศรีสะเกษ... ดังรายการต่อไปนี้ </p>

            <br>
            <table class="b">
                <tr>
                    <td width="5%">ที่</td>
                    <td>รายการ</td>
                    <td colspan="2">จำนวนเงิน</td>
                    <td>หมายเหตุ</td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <p style="margin-left:10px;"> ได้รับเงินค่าตอบแทนเบี้ยเลี้ยงเหมาจ่ายสำหรับเจ้าหน้าที่ที่ปฏิบัติงาน </p>
                        <p style="margin-left:10px;">ในหน่วยบริการสังกัดกระทรวงสาธารณสุข พ.ศ. 2566 </p>
                        <p style="margin-left:10px;">ประจำเดือน </p>
                        </br>
                        </br>
                        </br>
                        </br>
                        </br>
                        </br>

                    </td>
                    <td>
                        <p align="center" style="margin-top:-3em;">2300 </p>
                    </td>
                    <td>
                        <p align="center" style="margin-top:-3em;"> - </p>
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td colspan="2" align='center' style="border: 0px solid #000; ">รวม</td>
                    <td>2300</td>
                    <td> -</td>
                    <td></td>
                </tr>



            </table>
            <br>
            <p style="margin-left:140px;">จำนวนเงิน  <b class="mx-3"><?php $bath='2300'; echo Convert($bath);?></b> </p>
            <div class="grid-container2">
                <div class="grid-item2">
                </div>
                <div class="grid-item2">
                    <p></p>

                </div>
            </div>
            <div class="grid-container2">
                <div class="grid-item2">
                </div>
                <div class="grid-item2">
                    <p style="margin-left:296px;"> (ลงชื่อ)...........................................ผู้รับเงิน</p>
                    <p style="margin-left:260px;" align="center"> ฐากูร กมู่มาก </p>
                </div>
            </div>

            <p style="margin-left:120px;" class="fw-bold"> จ่ายแล้ว</p>
           

            <div class="grid-container2">
                <div class="grid-item2">
                    <p style="margin-left:20px;"><br> </p>
                    <p style="margin-left:2px; margin-top:1em;" align="center"> (นางภัทราพร อนุสรณ์) </p>
                    <p style="margin-left:12px;">เจ้าพนักงานการเงินและบัญชีชำนาญงาน</p>
                </div>
                <div class="grid-item2">
                    <p style="margin-left:28px;"> (ลงชื่อ)...........................................ผู้รับเงิน</p>
                    <p style="margin-left:2px;" align="center"> (นางภัทราพร อนุสรณ์) </p>
                    <p style="margin-left:28px;">เจ้าพนักงานการเงินและบัญชีชำนาญงาน</p>
                </div>
            </div>

        </div>
    </div>
    <script src="../plugins/jquery/jquery.min.js"></script>
    <script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
    <script src="../dist/js/adminlte.js"></script>
</body>
<script>
    var max_pages = 100;
    var page_count = 0;

    function snipMe() {
        page_count++;
        if (page_count > max_pages) {
            return;
        }
        var long = $(this)[0].scrollHeight - Math.ceil($(this).innerHeight());
        var children = $(this).children().toArray();
        var removed = [];
        while (long > 0 && children.length > 0) {
            var child = children.pop();
            $(child).detach();
            removed.unshift(child);
            long = $(this)[0].scrollHeight - Math.ceil($(this).innerHeight());
        }
        if (removed.length > 0) {
            var a4 = $('<div class="page"></div>');
            a4.append(removed);
            $(this).after(a4);
            snipMe.call(a4[0]);
        }
    }

    $(document).ready(function() {
        $('.page').each(function() {
            snipMe.call(this);
        });
    });
</script>

</html>