<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

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
                        <li><a class="dropdown-item" href="listname.php?page=รายการเจ้าหน้าที่">รายการเจ้าหน้าที่</a></li>
                        <li><a class="dropdown-item" href="listhire.php?page=ลูกจ้างรายคาบ">ลูกจ้างรายคาบ</a></li>
                        <li><a class="dropdown-item" href="search.php?page=เลือกวันที่การพิมพิ์">เลือกวันที่การพิมพิ์</a></li>
                        <!--<li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="payposition.php?page=ใบสำคัญรับเงิน">ใบสำคัญรับเงิน</a></li>
                        <li><a class="dropdown-item" href="personall.php?page=ใบขอรับเงินค่าตอบแทน&b=<?= date("Y-m-d") ?>">ใบขอรับเงินค่าตอบแทน</a></li>
                        <li><a class="dropdown-item" href="alluser.php">รวมทั้งหมด</a></li> -->
                    </ul>
                </li>

                <li class="nav-item rounded">
                    <a class="nav-link" href="#"><i class="bi bi-chat-square-dots me-2"></i>คู่มือ</a>
                </li>
                <li class="nav-item rounded">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><i class="bi bi-person-lock me-2"></i> เข้าสู่ระบบ</a>
                </li><!--
                    <li class="nav-item dropdown rounded">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-person-fill me-2"></i>Profile</a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="listuser.php?page=รายการเจ้าหน้าที่ทั้งหมด">รายการเจ้าหน้าที่ทั้งหมด</a></li>

                            <li><a class="dropdown-item" href="listuserall.php?page=Account">Account</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Logout</a></li>
                        </ul>
                    </li> -->
            </ul>
        </div>
    </div>
</nav>

<div class="modal fade " id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-md shadow p">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5 justify-content-center" id="staticBackdropLabel" align="center">User Login</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body py-3">
                <!-- <form id="loginForm" method="post">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                        <label for="floatingInput">Username</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                        <label for="floatingPassword">Password</label>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button  class="btn btn-primary btn-process" type="submit">เข้าสู่ระบบ</button>
                    </div>
                </form> -->
                <style>
                    #showPass {
                        display: inline-block;
                        margin-left: -20px;
                    }

                    .span2 {
                        position: absolute;
                        right: 15px;
                        font-size: 16px;
                        top: 10px;
                        opacity: 0.5;
                        cursor: pointer;
                        color: black;
                    }
                </style>

                <div class="row">
                    <div class="col-md-4">
                        <h2 align="mx-2" style="margin-top:-0.35em"><i class="bi bi-door-closed fa-4x"></i></h2>
                    </div>
                    <div class="col-md-8">
                        <form id="loginForm" class="my-3">
                            <div class="input-group mb-3">
                                <div class="input-group-text">
                                    <i class="bi bi-person-fill-check"></i>
                                </div>
                                <input type="text" class="form-control" name="username" id="username" placeholder="Username">
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-text">
                                    <i class="bi bi-unlock"></i>
                                </div>
                                <input type="password" class="form-control" name="password" placeholder="Password" id="password">
                                <span class="span2 fa fa-eye"></span>
                            </div>
                            <div>
                                <button type="submit" class="btn btn-outline-white border shadow-sm  col-md-12">เข้าสู่ระบบ</button>
                            </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Toastr -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <script>
        toastr.options = {
            "closeButton": true,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right mt-5",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    </script>

    <script>
        const triggerPassword = document.querySelector('.fa-eye');
        const showPassword = trigger => {
            trigger.addEventListener('click', () => {
                if (trigger.previousElementSibling.getAttribute('type') === 'password') {
                    trigger.previousElementSibling.setAttribute('type', 'text');
                    trigger.classList.remove('fa-eye');
                    trigger.classList.add('fa-eye-slash');
                } else if (trigger.previousElementSibling.getAttribute('type') === 'text') {
                    trigger.previousElementSibling.setAttribute('type', 'password');
                    trigger.classList.remove('fa-eye-slash');
                    trigger.classList.add('fa-eye');
                }
            });
        }
        showPassword(triggerPassword);

        $(document).ready(function() {
            $('#loginForm').submit(function(event) {
                event.preventDefault();
                var username = $('#username').val();
                var password = $('#password').val();

                $.ajax({
                    type: 'POST',
                    url: 'action/login.php',
                    data: {
                        username: username,
                        password: password
                    },
                    success: function(response) {
                        if (response === "success") {
                            toastr.success('Username  และ  Password ถูกต้อง.', 'กำลังเข้าสู้ระบบ', {
                                timeOut: 2500
                            })
                            setTimeout(() => {
                                window.location = "admin/index.php?page=ระบบงานโครงการ";
                            }, 2500);
                            //toastr.success("Login successful");

                        } else {
                            toastr.warning('Username หรือ Password ถูกต้อง.', 'กรุณาตรวจสอบข้อมูล', {
                                timeOut: 2500
                            })
                            //toastr.error("Login failed");
                        }
                    }
                });
            });
        });
    </script>