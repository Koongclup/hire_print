<nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.php?page=หน้าหลักรายการ"> กลุ่มงานประกันสุขภาพ</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-md-auto gap-2">
                    <li class="nav-item rounded">
                        <a class="nav-link active" aria-current="page" href="index.php?page=หน้าหลักรายการ"><i class="bi bi-house-fill me-2"></i>หน้าหลัก</a>
                    </li>
                    <li class="nav-item dropdown rounded">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-list-ul me-2"></i> รายการ</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="listuserall.php?page=รายการเจ้าหน้าที่">รายการเจ้าหน้าที่</a></li>
                            <li><a class="dropdown-item" href="listhire.php?page=ลูกจ้างรายคาบ">ลูกจ้างรายคาบ</a></li>
                            <li><a class="dropdown-item" href="search.php?page=เลือกวันที่การพิมพิ์">เลือกวันที่การพิมพิ์</a></li>                          
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="leave.php?page=งานลา">งานลา</a></li>  
                            <li><hr class="dropdown-divider"></li>  
                            <li><a class="dropdown-item" href="payposition.php?page=ใบสำคัญรับเงิน">ใบสำคัญรับเงิน</a></li>
                            <li><a class="dropdown-item" href="personall.php?page=ใบขอรับเงินค่าตอบแทน&b=<?=date("Y-m-d")?>">ใบขอรับเงินค่าตอบแทน</a></li>
                            <li><a class="dropdown-item" href="alluser.php">รวมทั้งหมด</a></li>
                        </ul>
                    </li>

                    <li class="nav-item rounded">
                        <a class="nav-link" href="#"><i class="bi bi-chat-square-dots me-2"></i>คู่มือ</a>
                    </li>
                    <li class="nav-item dropdown rounded">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-person-fill me-2"></i>Profile</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="listuser.php?page=รายการเจ้าหน้าที่ทั้งหมด">รายการเจ้าหน้าที่ทั้งหมด</a></li>

                            <li><a class="dropdown-item" href="listuserall.php?page=Account">Account</a></li>
                            <li><a class="dropdown-item" href="setting.php?page=แก้ไขระบบ">Setting</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="../logout.php" onclick="return confirm('Are you sure to logout?');">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

   