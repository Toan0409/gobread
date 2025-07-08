<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Quản lý khách hàng</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="/assets/img/breadlogo.png" rel="icon">
        <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">


        <!-- Google Fonts -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
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

        <script>
          let currentPage = 0;
          const size = 5;

          function loadUsers(page) {
            fetch(`/admin/user/fragment?page=${page}&size=${size}`)
              .then(res => res.text())
              .then(html => {
                document.getElementById("userContainer").innerHTML = html;
                currentPage = page;
              });
          }

          window.onload = function () {
            loadUsers(0); // Tải trang đầu tiên khi trang load
          };
        </script>

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
        <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
        <!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
        <!-- End Sidebar-->

        <main id="main" class="main">

          <div class="pagetitle">
            <h1>Khách hàng</h1>
            <nav>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin">Home</a></li>
                <li class="breadcrumb-item">Quản lý</li>
                <li class="breadcrumb-item active">Khách hàng</li>
              </ol>
            </nav>
          </div><!-- End Page Title -->

          <body>
            <div class="container">
              <h2>Quản Lý Khách Hàng</h2>
              <a href="/admin/user/create" class="btn btn-add">Thêm Khách Hàng</a>
              <table>
                <tr>
                  <th>ID</th>
                  <th>Tên Khách Hàng</th>
                  <th>Email</th>
                  <th>Số Điện Thoại</th>
                  <th class="address-column">Địa Chỉ</th>
                  <th>Hành Động</th>
                </tr>
                <c:forEach var="user" items="${users1}">
                  <tr>

                    <td>${user.id}</td>
                    <td>${user.fullName}</td>
                    <td>${user.email}</td>
                    <td>${user.phoneNumber}</td>
                    <td class="address-column">${user.address}</td>
                    <td>
                      <a href="/admin/user/${user.id}" class="btn btn-sm btn-primary" title="Xem chi tiết">
                        <i class="fa fa-eye">
                        </i>
                      </a>
                      <a href="/admin/user/update/${user.id}" class="btn btn-sm btn-secondary" title="Chỉnh sửa">
                        <i class="fa fa-pen">
                        </i>
                      </a>
                      <a href="/admin/user/delete/${user.id}" class="btn btn-sm btn-danger" title="Xoá">
                        <i class="fa fa-trash">
                        </i>
                      </a>
                    </td>
                  </tr>
                </c:forEach>


              </table>
              <nav>
                <ul class="pagination justify-content-center">
                  <c:forEach var="i" begin="0" end="${totalPages - 1}">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                      <a class="page-link" href="?page=${i}&size=10">${i + 1}</a>
                    </li>
                  </c:forEach>
                </ul>
              </nav>
            </div>
          </body>

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
          <div class="copyright">
            &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
          </div>
          <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
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