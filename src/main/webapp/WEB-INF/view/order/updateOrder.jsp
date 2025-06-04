<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">

                    <title>Quản lý đơn hàng</title>
                    <meta content="" name="description">
                    <meta content="" name="keywords">

                    <!-- Favicons -->
                    <link href="/assets/img/breadlogo.png" rel="icon">
                    <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

                    <!-- Google Fonts -->
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                        rel="stylesheet" />
                    <link href="https://fonts.gstatic.com" rel="preconnect">
                    <link
                        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
                        rel="stylesheet">

                    <!-- Vendor CSS Files -->
                    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
                    <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
                    <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
                    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
                    <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

                    <!-- Template Main CSS File -->
                    <link href="/assets/css/style.css" rel="stylesheet">

                    <style>
                        body {
                            font-family: Arial, sans-serif;
                            margin: 20px;
                            padding: 20px;
                            background-color: #f8f9fa;
                        }

                        .container {
                            max-width: 1600px;
                            margin: auto;
                            background: white;
                            padding: 20px;
                            border-radius: 8px;
                            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        }
                    </style>

                    <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
                </head>

                <body>

                    <!-- ======= Header ======= -->
                    <!-- ======= Header ======= -->
                    <header id="header" class="header fixed-top d-flex align-items-center">

                        <div class="d-flex align-items-center justify-content-between">
                            <a href="/admin" class="logo d-flex align-items-center">
                                <img src="/assets/img/breadlogo.png" alt="">
                                <span class="d-none d-lg-block">GoBread</span>
                            </a>
                            <i class="bi bi-list toggle-sidebar-btn"></i>
                        </div><!-- End Logo -->

                        <div class="search-bar">
                            <form class="search-form d-flex align-items-center" method="POST" action="#">
                                <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                                <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                            </form>
                        </div><!-- End Search Bar -->

                        <nav class="header-nav ms-auto">
                            <ul class="d-flex align-items-center">

                                <li class="nav-item d-block d-lg-none">
                                    <a class="nav-link nav-icon search-bar-toggle " href="#">
                                        <i class="bi bi-search"></i>
                                    </a>
                                </li><!-- End Search Icon-->

                                <div class="branch-selector">
                                    <label for="branch">Chọn cơ sở:</label>
                                    <select id="branch">
                                        <option value="hanoi">Cơ sở Hà Nội</option>
                                        <option value="hcm">Cơ sở TP. Hồ Chí Minh</option>
                                        <option value="danang">Cơ sở Đà Nẵng</option>
                                    </select>
                                </div>

                                <li class="nav-item dropdown">

                                    <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                                        <i class="bi bi-bell"></i>
                                        <span class="badge bg-primary badge-number">4</span>
                                    </a><!-- End Notification Icon -->

                                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                                        <li class="dropdown-header">
                                            Bạn có 4 thông báo mới
                                            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">Xem tất
                                                    cả</span></a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li class="notification-item">
                                            <i class="bi bi-exclamation-circle text-warning"></i>
                                            <div>
                                                <h4>Cảnh báo đăng nhập</h4>
                                                <p>Phát hiện tài khoản đăng nhập ở nơi khác</p>
                                                <p>2 phút trước</p>
                                            </div>
                                        </li>

                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li class="notification-item">
                                            <i class="bi bi-x-circle text-danger"></i>
                                            <div>
                                                <h4>Đặt hàng không thành công</h4>
                                                <p>Vui lòng điền đầy đủ thông tin đơn hàng</p>
                                                <p>1 hr. ago</p>
                                            </div>
                                        </li>

                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li class="notification-item">
                                            <i class="bi bi-check-circle text-success"></i>
                                            <div>
                                                <h4>Thông báo 3</h4>
                                                <p>Nội dung thông báo 3</p>
                                                <p>2 hrs. ago</p>
                                            </div>
                                        </li>

                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li class="notification-item">
                                            <i class="bi bi-info-circle text-primary"></i>
                                            <div>
                                                <h4>Thông báo 4 </h4>
                                                <p>Nội dung thông báo 4</p>
                                                <p>4 hrs. ago</p>
                                            </div>
                                        </li>

                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li class="dropdown-footer">
                                            <a href="#">Hiển thị tất cả thông báo</a>
                                        </li>

                                    </ul><!-- End Notification Dropdown Items -->

                                </li><!-- End Notification Nav -->

                                <li class="nav-item dropdown">

                                    <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                                        <i class="bi bi-chat-left-text"></i>
                                        <span class="badge bg-success badge-number">3</span>
                                    </a><!-- End Messages Icon -->

                                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
                                        <li class="dropdown-header">
                                            Bạn có 3 tin nhắn mới
                                            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">Xem tất
                                                    cả</span></a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li class="message-item">
                                            <a href="#">
                                                <img src="/assets/img/user1.png" alt="" class="rounded-circle">
                                                <div>
                                                    <h4>Vũ Tùng Dương</h4>
                                                    <p>Thêm đơn hàng #2024245676</p>
                                                    <p>Vừa xong</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li class="message-item">
                                            <a href="#">
                                                <img src="/assets/img/user2.jpg" alt="" class="rounded-circle">
                                                <div>
                                                    <h4>Trần Quốc Toàn</h4>
                                                    <p>Thêm đơn hàng #202423445</p>
                                                    <p>6 phút trước</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li class="message-item">
                                            <a href="#">
                                                <img src="/assets/img/user3.jpg" alt="" class="rounded-circle">
                                                <div>
                                                    <h4>Lê Võ Khôi Nguyên</h4>
                                                    <p>Thêm đơn hàng #202423346</p>
                                                    <p>8 phút trước</p>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li class="dropdown-footer">
                                            <a href="#">Hiển thị tất cả tin nhắn</a>
                                        </li>

                                    </ul><!-- End Messages Dropdown Items -->

                                </li><!-- End Messages Nav -->

                                <li class="nav-item dropdown pe-3">

                                    <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
                                        data-bs-toggle="dropdown">
                                        <img src="/assets/img/user1.png" alt="Profile" class="rounded-circle">
                                        <span class="d-none d-md-block dropdown-toggle ps-2">
                                            <c:out value="${pageContext.request.userPrincipal.name}" />
                                        </span>
                                    </a><!-- End Profile Image Icon -->

                                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">


                                        <li>
                                            <a class="dropdown-item d-flex align-items-center" href="/admin">
                                                <i class="bi bi-person"></i>
                                                <span>Hồ sơ của tôi</span>
                                            </a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>

                                        <li>
                                            <a class="dropdown-item d-flex align-items-center" href="/admin">
                                                <i class="bi bi-gear"></i>
                                                <span>Cài đặt</span>
                                            </a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>


                                        <li>
                                            <form action="/logout" method="post">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />
                                                <button class="dropdown-item d-flex align-items-center">
                                                    <i class="bi bi-box-arrow-right"></i>
                                                    <span>Đăng xuất</span>
                                                </button>
                                            </form>
                                        </li>

                                    </ul><!-- End Profile Dropdown Items -->
                                </li><!-- End Profile Nav -->

                            </ul>
                        </nav><!-- End Icons Navigation -->

                    </header><!-- End Header -->






                    <body>
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Orders</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"> <a href="/admin">Dashboard </a></li>
                                    <li class="breadcrumb-item active"><a href="/admin/order"> Order </a></li>
                                    <li class="breadcrumb-item active"> Update</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h1> Update Order</h1>
                                            <hr />
                                            <form:form method="post" action="/admin/order/update"
                                                modelAttribute="newOrder" class="row" enctype="multipart/form-data">
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id </label>
                                                    <form:input type="text" class="form-control" path="orderId" />
                                                </div>
                                                <div class="mb-3 alert alert-warning">
                                                    <div class="mb-3 col-12">
                                                        <label>Order ID = ${newOrder.orderId} </label>
                                                    </div>
                                                    <div class="col-12">
                                                        <label class="form-label">Total price: </label>
                                                        <fmt:formatNumber type="number"
                                                            value="${newOrder.totalPrice}" /> đ
                                                    </div>

                                                </div>

                                                <div class="mb-3 col-12">
                                                    <label class="form-label">User:</label>
                                                    <form:input type="text" class="form-control" disabled="true"
                                                        path="user.fullName" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Status:</label>
                                                    <form:select class="form-select" path="status">
                                                        <form:option value="PENDING">PENDING</form:option>
                                                        <form:option value="SHIPPING">SHIPPING</form:option>
                                                        <form:option value="COMPLETE">COMPLETE</form:option>
                                                        <form:option value="CANCEL">CANCEL</form:option>
                                                    </form:select>
                                                </div>


                                                <div class="mb-5 col-12">
                                                    <button type="submit" class="btn btn-warning">Update</button>
                                                </div>

                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>


                    </body>



                    </main><!-- End #main -->

                    <!-- ======= Footer ======= -->
                    <footer id="footer" class="footer">


                    </footer><!-- End Footer -->

                    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                            class="bi bi-arrow-up-short"></i></a>

                    <!-- Vendor JS Files -->
                    <script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
                    <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="/assets/vendor/chart.js/chart.umd.js"></script>
                    <script src="/assets/vendor/echarts/echarts.min.js"></script>
                    <script src="/assets/vendor/quill/quill.js"></script>
                    <script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
                    <script src="/assets/vendor/tinymce/tinymce.min.js"></script>
                    <script src="/assets/vendor/php-email-form/validate.js"></script>

                    <!-- Template Main JS File -->
                    <script src="/assets/js/main.js"></script>

                </body>

                </html>