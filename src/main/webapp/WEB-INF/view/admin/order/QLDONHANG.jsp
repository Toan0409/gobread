<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

        <!-- ======= Sidebar ======= -->
        <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
        <!-- End Sidebar-->

        <main id="main" class="main">

          <div class="pagetitle">
            <h1>Đơn hàng</h1>
            <nav>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin">Home</a></li>
                <li class="breadcrumb-item">Quản lý</li>
                <li class="breadcrumb-item active">Đơn hàng</li>
              </ol>
            </nav>
          </div><!-- End Page Title -->


          <body>
            <div class="container">
              <h2>Quản Lý Đơn Hàng</h2>

              <table>
                <tr>
                  <th>Mã Đơn</th>
                  <th>Khách Hàng</th>

                  <th>Tổng Tiền</th>
                  <th class="address-column">Trạng Thái</th>
                  <th>Hành Động</th>
                </tr>

                <c:forEach var="order" items="${orders}">
                  <tr>

                    <td>${order.orderId}</td>
                    <td>${order.receiverName}</td>
                    <td>${order.totalPrice}</td>
                    <td class="address-column">${order.status}</td>
                    <td>
                      <a href="/admin/order/${order.orderId}" class="btn btn-sm btn-primary" title="Xem chi tiết">
                        <i class="fa fa-eye">
                        </i>
                      </a>
                      <a href="/admin/order/update/${order.orderId}" class="btn btn-sm btn-secondary" title="Chỉnh sửa">
                        <i class="fa fa-pen">
                        </i>
                      </a>
                      <a href="/admin/order/delete/${order.orderId}" class="btn btn-sm btn-danger" title="Xoá">
                        <i class="fa fa-trash">
                        </i>
                      </a>
                    </td>
                  </tr>
                </c:forEach>

              </table>
              <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                  <li class="page-item">
                    <a class="${currentPage eq 1 ? 'disabled page-link' : 'page-link'}"
                      href="/admin/order?page=${currentPage - 1}" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <c:forEach begin="0" end="${totalPages-1}" varStatus="page">
                    <li class="page-item"><a class="${(page.index+1) eq currentPage ? 'active page-link' : 'page-link'}"
                        href="/admin/order?page=${page.index + 1}">${page.index
                        + 1}</a></li>
                  </c:forEach>
                  <li class="page-item">

                    <a class="${currentPage eq totalPages ? 'disabled page-link' : 'page-link'}"
                      href="/admin/order?page=${currentPage + 1}" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
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