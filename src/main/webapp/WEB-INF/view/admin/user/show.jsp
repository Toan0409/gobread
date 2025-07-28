<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta content="width=device-width, initial-scale=1.0" name="viewport">

            <title>Chi tiết khách hàng</title>

            <!-- Favicons -->
            <link href="/assets/img/breadlogo.png" rel="icon">
            <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

            <!-- Vendor CSS Files -->
            <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
            <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
            <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
            <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
            <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
            <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

            <!-- Main CSS -->
            <link href="/assets/css/style.css" rel="stylesheet">
        </head>

        <body>

            <!-- Header -->
            <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />

            <!-- Sidebar -->
            <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />

            <main id="main" class="main">

                <div class="pagetitle">
                    <h1>Chi tiết khách hàng</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="/admin/user">Khách hàng</a></li>
                            <li class="breadcrumb-item active">Chi tiết</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">

                            <div class="card">
                                <div class="card-header bg-primary text-white">
                                    <h5 class="mb-0">Thông tin khách hàng - ID: ${id}</h5>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <div class="card" style="width: auto;">
                                            <img src="${pageContext.request.contextPath}/resources/images/avatar/${user.avatar}"
                                                alt="Avatar" style="width: 300px;" />
                                        </div>
                                        <li class="list-group-item"><strong>Họ tên:</strong> ${user.fullName}</li>
                                        <li class="list-group-item"><strong>Email:</strong> ${user.email}</li>
                                        <li class="list-group-item"><strong>Số điện thoại:</strong> ${user.phoneNumber}
                                        </li>
                                        <li class="list-group-item"><strong>Địa chỉ:</strong> ${user.address}</li>
                                        <li class="list-group-item"><strong>Tên đăng nhập:</strong> ${user.username}
                                        </li>
                                    </ul>
                                </div>
                                <div class="card-footer text-end">
                                    <a href="/admin/user" class="btn btn-secondary">
                                        <i class="bi bi-arrow-left"></i> Quay lại danh sách
                                    </a>
                                    <a href="/admin/user/update/${user.id}" class="btn btn-warning">
                                        <i class="bi bi-pencil-square"></i> Chỉnh sửa
                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

            </main><!-- End #main -->



            <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                    class="bi bi-arrow-up-short"></i></a>

            <!-- Vendor JS Files -->
            <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
            <script src="/assets/js/main.js"></script>

        </body>

        </html>