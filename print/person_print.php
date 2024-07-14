<?php
session_start();
//@ini_set('display_errors', '0');
include "../inc/config/dbcon.php";
$no = $_GET['no'];
$isdate = $_GET['b'];

//กำหนด charset ให้เป็น utf8 เพื่อรองรับภาษาไทย
date_default_timezone_set('Asia/Bangkok');
function ThDate()
{
    //วันภาษาไทย
    $ThDay = array("อาทิตย์", "จันทร์", "อังคาร", "พุธ", "พฤหัส", "ศุกร์", "เสาร์");
    //เดือนภาษาไทย
    $ThMonth = array("มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม");

    //วันที่ ที่ต้องการเอามาเปลี่ยนฟอแมต
    $myDATE = date("d-m-Y"); //อาจมาจากฐานข้อมูล
    //กำหนดคุณสมบัติ
    $week = date("w", strtotime($myDATE)); // ค่าวันในสัปดาห์ (0-6)
    $months = date("m", strtotime($myDATE)) - 1; // ค่าเดือน (1-12)
    $day = date("d", strtotime($myDATE)); // ค่าวันที่(1-31)
    $years = date("Y", strtotime($myDATE)) + 543; // ค่า ค.ศ.บวก 543 ทำให้เป็น ค.ศ.

    /*return "วัน$ThDay[$week] 
		ที่ $day  
		เดือน $ThMonth[$months] 
		พ.ศ. $years"; */

    return " 
		$ThMonth[$months]   $years";
}
// แสดงวันที่ 
function fullDate()
{
    //วันภาษาไทย
    $ThDay = array("อาทิตย์", "จันทร์", "อังคาร", "พุธ", "พฤหัส", "ศุกร์", "เสาร์");
    //เดือนภาษาไทย
    $ThMonth = array("มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม");

    //วันที่ ที่ต้องการเอามาเปลี่ยนฟอแมต

    $myDATE = date("d-m-Y"); //อาจมาจากฐานข้อมูล
    //กำหนดคุณสมบัติ
    $week = date("w", strtotime($myDATE)); // ค่าวันในสัปดาห์ (0-6)
    $months = date("m", strtotime($myDATE)) - 1; // ค่าเดือน (1-12)
    $day = date("d", strtotime($myDATE)); // ค่าวันที่(1-31)
    $years = date("Y", strtotime($myDATE)) + 543; // ค่า ค.ศ.บวก 543 ทำให้เป็น ค.ศ.

    return "$day  $ThMonth[$months]  $years";
}

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
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
        font: 15px "TH Sarabun PSK";
        font-family: 'Sarabun', sans-serif;
        border: 1px solid black;

    }

    tr,
    td {
        padding: 5px 3px;
        border: 1px solid black;
        font-size: 15px;
        color: #000;
    }

    .main-page {
        width: 230mm;
        min-height: 307mm;
        margin: 5mm auto;
        background: white;
        box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
    }

    .sub-page {
        padding: 2.0cm 1.5cm 1.5cm 2.5cm;
        height: 297mm;
    }

    @page {
        size: A4;
        margin: 0;
    }

    @media print {
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
        padding: 2px 6px;
    }

    .grid-item {
        padding: 4px 17px;
        text-align: center;
    }

    .grid-item2 {
        width: 100%;
        padding: 4px 1px;
    }

    p {
        margin-top: 0;
        margin-bottom: 0.6rem;
    }

    .gid {
        display: flex;
        margin-top: 1em;
    }

    .column {
        flex: 50%;
    }

    .column7 {
        flex: 55%;
    }

    .column5 {
        flex: 45%;
    }

    .f16 {
        font-size: 16px;
    }
</style>


<body Onloadก="window.print();">
    <?php
    $query = mysqli_query($conn, "SELECT g.*,
    CASE WHEN  id in ('111','117') and  DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' ) ) + 1 = 12   THEN  DATE_FORMAT('$isdate' , '%Y' ) - DATE_FORMAT( start_dated, '%Y' ) - ( DATE_FORMAT('$isdate', '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' ) ) 
		
		WHEN id not in ('111','117') and DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' ) ) + 1 = 12   THEN  DATE_FORMAT('$isdate' , '%Y' ) - DATE_FORMAT( start_dated, '%Y' ) - ( DATE_FORMAT('$isdate', '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' ) ) + 1 
		
        WHEN id not in ('111','117') and DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT( '$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' ) ) = '-2' THEN DATE_FORMAT('$isdate' , '%Y' ) - DATE_FORMAT( start_dated, '%Y' ) - ( DATE_FORMAT( '$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' ) )+1 ELSE  DATE_FORMAT('$isdate' , '%Y' ) - DATE_FORMAT( start_dated, '%Y' ) - ( DATE_FORMAT( '$isdate', '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' ) ) END as strYear,
        
    CASE  WHEN id in ('111','117') AND DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - (DATE_FORMAT('$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT(start_dated, '00-%m-%d')) = 12  THEN  0
				
				
				WHEN id in ('111','117') AND DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - (DATE_FORMAT('$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT(start_dated, '00-%m-%d')) > 0  THEN  DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT(start_dated, '00-%m-%d'))
				
				WHEN id in ('111','117') AND DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' )) < 0  THEN  12 + (DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' )))+1
				
				WHEN DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) = '-1' THEN 0
				WHEN DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) = '-2' THEN 11
				WHEN DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-%m-%d' ) < DATE_FORMAT( start_dated, '00-%m-%d' ) ) + 1 = 12 THEN '0'
				WHEN DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-%m-%d' ) 
        < DATE_FORMAT( start_dated, '00-%m-%d' ) )  < 0 THEN 12+( DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-00-%d' ) 
        < DATE_FORMAT( start_dated, '00-00-%d' ) ) + 1 )
            
        ELSE DATE_FORMAT('$isdate' , '%m' ) - DATE_FORMAT( start_dated, '%m' ) - ( DATE_FORMAT('$isdate' , '00-00-%d' ) < DATE_FORMAT( start_dated, '00-00-%d' ) ) + 1  END as strMonth 

FROM user_group g where id ='$no'");
    foreach ($query as $r) {
    ?>

<div class="main-page">
            <div class="sub-page">
                <p align="center" style="font-size:18px" class="fw-bold">ใบสำคัญรับเงิน</p>
                <p></p>
                <div class="gid">
                    <div class="column"></div>
                    <div class="column">
                        <p class="f16" style="margin-left:30px;">ที่ <span style="margin-left:36px;"> โรงพยาบาลขุขันธ์</span> </p>
                        <p class="f16" style="margin-left:30px;">วันที่</p>
                    </div>
                </div>
                <br>

                <div class="gid">
                    <div class="column">
                        <p class="f16" style="margin-left:30px;">ข้าพเจ้า <b style="margin-left:6px;"> <?= $r['fullname'] ?></b></p>
                    </div>
                    <div class="column">
                        <p class="f16" style="margin-left:30px;">เลขบัตรประจำตัวประชาชน <b style="margin-left:6px;"> <?= $r['cid'] ?></b> </p>
                    </div>
                </div>

                <p class="f16" style="margin-left:30px;">ที่อยู่บ้านเลขที่ <b class="mx-2">109</b> หมู่ที่ <b class="mx-2">6</b> ตำบล <b class="mx-2">หนองฉลอง</b> อำเภอ <b class="mx-2">ขุขันธ์</b> จังหวัด <b class="mx-2">ศรีสะเกษ</b> </p>
                <p class="f16" style="margin-left:30px;">ได้รับเงินจาก <b class="mx-2">โรงพยาบาลขุขันธ์</b> จังหวัด <b class="mx-2"> ศรีสะเกษ </b>ดังรายการต่อไปนี้ </p>

                <br>
                <table class="b">
                    <tr>
                        <td width="5%">ที่</td>
                        <td align="center">รายการ</td>
                        <td colspan="2" width="15%">จำนวนเงิน</td>
                        <td width="14%">หมายเหตุ</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <p class="f16" style="margin-left:10px;margin-top:0.3em;"> ได้รับเงินค่าตอบแทนเบี้ยเลี้ยงเหมาจ่ายสำหรับเจ้าหน้าที่ที่ปฏิบัติงาน </p>
                            <p class="f16" style="margin-left:10px;">ในหน่วยบริการสังกัดกระทรวงสาธารณสุข พ.ศ. 2566 &ensp;&ensp;(ฉ.11)</p>
                            <p class="f16" style="margin-left:10px;">ประจำเดือน <b style="margin-left:10px;">
                                    <b>
                                        <?php
                                        $ThMonth = array("มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม");
                                        $months = date("m", strtotime($isdate)) - 1; // ค่าเดือน (1-12)
                                        $day = date("d", strtotime($isdate)); // ค่าวันที่(1-31)
                                        $years = date("Y", strtotime($isdate)) + 543;
                                        echo $ThMonth[$months] . ' ' . $years ?> </b>
                                </b>    <c style="margin-left:168px;">เป็นเงิน<c></p>
                            </br>
                            </br>
                            </br>
                            </br>
                            </br>
                            </br>
                            </br>
                            </br>
                            </br>
                            </br>
                        </td>
                        <td>
                            <p class="f16" align="center" style="margin-top:-4.9em;"><?= number_format($r['paypost'], 0) ?> </p>
                        </td>
                        <td>
                            <p class="f16" align="center" style="margin-top:-4.9em;"> .- </p>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td class="f16" colspan="2" align='center' style="border: 0px solid #000; ">รวม</td>
                        <td class="f16" align="center"><?= number_format($r['paypost'], 0) ?></td>
                        <td class="f16" witdh="4%" align="center"> .- </td>
                        <td></td>
                    </tr>
                </table>
                <br>
                <p class="f16" style="margin-left:60px;">จำนวนเงิน <b style="margin-left:6em;">( <?php $bath = $r['paypost'];echo Convert($bath); ?> )</b> </p>
                <br><br>
                <div class="gid">
                    <div class="column7"></div>
                    <div class="column5">
                        <p class="f16"> (ลงชื่อ)...........................................ผู้รับเงิน</p>
                        <p class="f16" style="margin-left:50px;"> (<?= $r['fullname'] ?>) </p>

                    </div>
                </div>

                <div class="gid">
                    <div class="column7 f16" align="center"> <b>จ่ายแล้ว</b> </div>
                    <div class="column5 f16">
                    </div>
                </div>

                <div class="gid" style="margin-top: 1.1em;">
                    <div class="column7">
                        <p style="margin-left:20px;"><br> </p>
                        <p class="f16" style="margin-left:2px; margin-top:0.56em;" align="center"> (นางภัทราพร อนุสรณ์) </p>
                        <p class="f16" align="center">เจ้าพนักงานการเงินและบัญชีชำนาญงาน</p>
                    </div>
                    <div class="column5">
                        <p class="f16"> (ลงชื่อ)...........................................ผู้รับเงิน</p>
                        <p class="f16" style="margin-left:54px;"> (นางภัทราพร อนุสรณ์) </p>
                        <p class="f16" style="margin-left:6px;">เจ้าพนักงานการเงินและบัญชีชำนาญงาน</p>

                    </div>
                </div>
            </div>
        </div>


        <div class="main-page">
            <div class="sub-page">
                <p align="center" style="font-size:18px;font-weight:bold">ใบขอรับเงินค่าตอบแทนเบี้ยเลี้ยงเหมาจ่ายสำหรับเจ้าหน้าที่</p>
                <p align="center" style="font-size:18px;font-weight:bold">ที่ปฏิบัติงานในหน่วยบริการหรือหน่วยบริการในเครือข่าย</p>

                <div class="gid">
                    <div class="column7"></div>
                    <div class="column5">
                        <p class="f16">ประจำเดือน <b style="margin-left:4px;">
                        <?php
                        $months = date("m", strtotime($isdate)) - 1; // ค่าเดือน (1-12)
                        $day = date("d", strtotime($isdate)); // ค่าวันที่(1-31)
                        $years = date("Y", strtotime($isdate)) + 543;
                        echo $ThMonth[$months] . ' ' . $years ?> </b> </p>
                    </div>
                </div>

                <div class="gid">
                    <div class="column7 f16">ข้าพเจ้าชื่อ   <b style="margin-top:20px;margin-left:4px;"><?= $r['fullname'] ?> </b></div>
                    <div class="column5 f16">ตำแหน่ง  <b style="margin-top:20px; margin-left:4px;"><?= $r['position']?><?php $l=$r['level']; if($l=='ไม่มี'){ echo ' ';} else{ echo $l;}  ?></b> </p>
                    </div>
                </div>

                <p class="f16">ปัจจุบันปฏิบัติงานที่ <b class="mx-2 ">โรงพยาบาลขุขันธ์ </b> จังหวัด <b class="mx-2">ศรีสะเกษ </b> ระดับ/กลุ่ม <b class="mx-2">2.2 </b></p>
                <p class="f16">ได้ปฏิบัติงานในหน่วยบริการหรือหน่วยบริการในเครือข่าย <b class="mx-2"><?= $r['strYear'] ?> </b> ปี <b class="mx-2"><?= $r['strMonth'] ?></b> เดือน  &ensp;&ensp;&ensp; วัน    &ensp;(นับถึงสิ้นเดือนที่เบิกจ่าย) </p>
                <p class="f16">โดยมีรายละเอียดการปฏิบัติงาน ดังนี้ (เฉพาะสายแพทย์ ตอบข้อ 1 ด้วย)</p>
                <p class="f16">1. ฝึกเพิ่มพูนทักษะ (ปีที่ 1) รวมระยะเวลาการปฏิบัติงาน.........................................ปี.............................เดือน&ensp;&ensp;ดังนี้</p>
                <p class="f16" style="margin-left:20px;">  รพศ./รพท............................................จังหวัด................................ตั้งแต่...............................ถึง...................................</p>
                <p style="margin-left:20px;">  รพช.......................................................จังหวัด................................ตั้งแต่...............................ถึง..................................</p>
                <p class="f16">2. ปฏิบัติงานที่...........โรงพยาบาลขุขันธ์..................จังหวัด..........ศรีสะเกษ.............จัดระดับ............2.2...............</p>
                <p class="f16" style="margin-left:20px;"> ตั้งแต่วันที่......
                <b>
                    <?php
                    $months = date("m", strtotime($r['start_date'])) - 1; // ค่าเดือน (1-12)
                    $day = date("d", strtotime($r['start_date'])); // ค่าวันที่(1-31)
                    $years = date("Y", strtotime($r['start_date'])) + 543;
                    echo $day . ' ' . $ThMonth[$months] . ' ' . $years ?> 
                    </b>......ถึง......<b>
                        <?php
                        $months = date("m", strtotime($isdate)) - 1; // ค่าเดือน (1-12)
                        $day = date("d", strtotime($isdate)); // ค่าวันที่(1-31)
                        $years = date("Y", strtotime($isdate)) + 543;
                        echo $day . ' ' . $ThMonth[$months] . ' ' . $years ?> </b>
                    .....รวม.....<b class=""><?= $r['strYear']?></b>......ปี.....<b class=""><?= $r['strMonth']; ?></b>.....เดือน..........วัน
                </p>
                <p class="f16" >3. ปฏิบัติงานที่.......................................................จังหวัด............................................จัดระดับ..............................................</p>
                <p class="f16" style="margin-left:20px;"> ตั้งแต่วันที่......................................................ถึง................................................รวม...............ปี...............เดือน.............วัน</p>
                <p class="f16">4. ปฏิบัติงานที่........................................................จังหวัด............................................จัดระดับ...............................................</p>
                <p class="f16" style="margin-left:20px;"> ตั้งแต่วันที่......................................................ถึง................................................รวม...............ปี...............เดือน.............วัน</p>
                <p class="f16">5. ปฏิบัติงานที่........................................................จังหวัด............................................จัดระดับ...............................................</p>
                <p class="f16" style="margin-left:20px;"> ตั้งแต่วันที่......................................................ถึง................................................รวม...............ปี...............เดือน.............วัน</p>
                <p class="f16">6. ปฏิบัติงานที่........................................................จังหวัด............................................จัดระดับ...............................................</p>
                <p class="f16" style="margin-left:20px;"> ตั้งแต่วันที่......................................................ถึง................................................รวม...............ปี...............เดือน.............วัน</p>
                <p class="f16">7. ปฏิบัติงานที่........................................................จังหวัด............................................จัดระดับ...............................................</p>
                <p class="f16" style="margin-left:20px;"> ตั้งแต่วันที่......................................................ถึง................................................รวม...............ปี...............เดือน.............วัน</p>
                <p class="f16" style="margin-left:20px;"> รวมทั้งสิ้น..........<b class=""><?= $r['strYear'] ?> </b>...........ปี...........<b class=""><?= $r['strMonth']; ?> </b>.............เดือน.........................วัน</p>

                <div class="grid-container2">
                    <div class="grid-item2">
                    </div>
                    <div class="grid-item2">
                        <p class="f16" align="center"> ข้าพเจ้าขอรับรองว่าข้อมูลดังกล่าว เป็นความจริงทุกประการ</p>
                        <p class="f16" style="margin-left:120px;margin-top:1.5em;" align="center">...............................................ผู้เบิก </p>
                        <p class="f16" style="margin-left:95px;" align="center"> (<?= $r['fullname'] ?>) </p>
                    </div>
                </div>

                <div class="grid-container2">
                    <div class="grid-item2">
                    </div>
                    <div class="grid-item2">
                        <p class="f16" style="margin-left:236px;"> ลงชื่อ..............................................ผู้เห็นชอบ(หัวหน้าฝ่าย)</p>
                        <p class="f16" style="margin-left:80px;" align="center"> (นายสนั่น เทียนทอง)</p>
                    </div>
                </div>

                <div class="grid-container2">
                    <div class="grid-item2">
                    </div>
                    <div class="grid-item2">
                        <p class="f16" style="margin-left:240px;"> อนุมัติให้เบิกได้</p>
                        <p class="f16" style="margin-left:170px;margin-top:1.5em;" > ลงชื่อ..............................................</p>
                        <p class="f16" style="margin-left:216px;"> (นายประวิทย์ เสรีขจรจารุ)</p>
                        <p class="f16" style="margin-left:100px;" align="center"> ตำแหน่ง ผู้อำนวยการโรงพยาบาลขุขันธ์</p>
                    </div>
                </div>
            </div>
        </div>

    <?php } ?>

</body>


</html>