<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="utf-8">
          <meta content="width=device-width, initial-scale=1.0" name="viewport">

          <title>GoBread - Món ngon đường phố</title>
          <meta content="" name="description">
          <meta content="" name="keywords">

          <!-- Favicons -->
          <link href="/assets/img/breadlogo.png" rel="icon">
          <link href="/assets/img/breadlogo.png" rel="apple-touch-icon">

          <!-- Google Fonts -->
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
                      <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">Xem tất cả</span></a>
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
                        <h4>Đặt đơn hàng thành công</h4>
                        <p>Lê Võ Khôi Nguyên vừa nhận thành công đơn hàng</p>
                        <p>2 hrs. ago</p>
                      </div>
                    </li>

                    <li>
                      <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                      <i class="bi bi-info-circle text-primary"></i>
                      <div>
                        <h4>Số lượng bánh mì sắp hết </h4>
                        <p>Số lượng bánh mì còn lại trong kho không còn nhiều hãy nhập thêm bánh mì</p>
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
                      <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">Xem tất cả</span></a>
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
                        <img src="/assets/img/2huychuong.jpg" alt="" class="rounded-circle">
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

                <c:if test="${not empty pageContext.request.userPrincipal}">

                  <li class="nav-item dropdown pe-3">
                    <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                      <img src="/assets/img/user1.png" alt="Profile" class="rounded-circle">
                      <span class="d-none d-md-block dropdown-toggle ps-2">
                        <c:out value="${pageContext.request.userPrincipal.name}" />

                      </span>
                    </a><!-- End Profile Image Icon -->

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">

                      <li>
                        <a class="dropdown-item d-flex align-items-center" href="/admin/profile">
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
                          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                          <button class="dropdown-item d-flex align-items-center">
                            <i class="bi bi-box-arrow-right"></i>
                            <span>Đăng xuất</span>
                          </button>
                        </form>
                      </li>

                    </ul><!-- End Profile Dropdown Items -->
                  </li><!-- End Profile Nav -->
                </c:if>

              </ul>
            </nav><!-- End Icons Navigation -->

          </header><!-- End Header -->

          <!-- ======= Sidebar ======= -->
          <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">

              <li class="nav-item">
                <a class="nav-link " href="/admin">
                  <i class="bi bi-grid"></i>
                  <span>Doanh thu & Lợi nhuận</span>
                </a>
              </li><!-- End Dashboard Nav -->

              <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                  <i class="bi bi-menu-button-wide"></i><span>Quản lý</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                  <li>
                    <a href="/admin/order">
                      <i class="bi bi-cart"></i><span>Quản lý đơn hàng</span>
                    </a>
                  </li>
                  <li>
                    <a href="/admin/user">
                      <i class="bi bi-person"></i><span>Quản lý khách hàng</span>
                    </a>
                  </li>
                  <li>
                    <a href="/admin/product">
                      <i class="bi bi-bag"></i><span>Quản lý sản phẩm & tồn kho</span>
                    </a>
                  </li>


                </ul>
              </li><!-- End Components Nav -->




              <li class="nav-item">
                <a class="nav-link collapsed" href="/contact">
                  <i class="bi bi-envelope"></i>
                  <span>Liên Hệ</span>
                </a>
              </li><!-- End Contact Page Nav -->

              <li class="nav-item">
                <a class="nav-link collapsed" href="/admin/user/create">
                  <i class="bi bi-card-list"></i>
                  <span>Đăng kí</span>
                </a>
              </li><!-- End Register Page Nav -->

              <li class="nav-item">
                <a class="nav-link collapsed" href="/login">
                  <i class="bi bi-box-arrow-in-right"></i>
                  <span>Đăng nhập</span>
                </a>
              </li><!-- End Login Page Nav -->



            </ul>

          </aside><!-- End Sidebar-->

          <main id="main" class="main">

            <div class="pagetitle">
              <h1>Doanh thu & Lợi nhuận</h1>
              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                  <li class="breadcrumb-item active">Doanh thu & Lợi nhuận</li>
                </ol>
              </nav>
            </div><!-- End Page Title -->

            <section class="section dashboard">
              <div class="row">

                <!-- Left side columns -->
                <div>
                  <div class="row">

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                      <div class="card info-card sales-card">
                        <div class="card-body">
                          <h5 class="card-title"><a href="/admin/order">Đơn hàng</a></h5>

                          <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                              <i class="bi bi-cart"></i>
                            </div>
                            <div class="ps-3">
                              <h6>${countOrders}</h6>

                            </div>
                          </div>
                        </div>

                      </div>
                    </div><!-- End Sales Card -->

                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                      <div class="card info-card revenue-card">
                        <div class="card-body">
                          <h5 class="card-title"><a href="/admin/product">Doanh thu</a></h5>

                          <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                              <i class="bi bi-currency-dollar"></i>
                            </div>
                            <div class="ps-3">
                              <h6>${countRevenues} VNĐ</h6>


                            </div>
                          </div>
                        </div>

                      </div>
                    </div><!-- End Revenue Card -->

                    <!-- Customers Card -->
                    <div class="col-xxl-4 col-xl-12">
                      <div class="card info-card customers-card">
                        <div class="card-body">
                          <h5 class="card-title"><a href="/admin/user">Khách hàng</a></h5>

                          <div class="d-flex align-items-center">
                            <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                              <i class="bi bi-people"></i>
                            </div>
                            <div class="ps-3">
                              <h6>${countUsers}</h6>


                            </div>
                          </div>

                        </div>
                      </div>

                    </div><!-- End Customers Card -->

                    <!-- Reports -->
                    <div class="col-12">
                      <div class="card">
                        <div class="card-body">
                          <h5 class="card-title">Báo cáo</h5>

                          <!-- ApexCharts CDN -->
                          <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

                          <div class="container mt-5">
                            <h3 class="text-center">Doanh thu theo sản phẩm</h3>
                            <div id="productRevenueChart"></div>
                          </div>
                        </div>
                      </div>
                    </div>

                    <c:if test="${not empty productRevenues}">
                      <script>
                        document.addEventListener("DOMContentLoaded", function () {
                          var productNames = [
                            <c:forEach var="item" items="${productRevenues}" varStatus="loop">
                              "${item.productName}"<c:if test="${!loop.last}">,</c:if>
                            </c:forEach>
                          ];

                          var productRevenues = [
                            <c:forEach var="item" items="${productRevenues}" varStatus="loop">
                              ${item.totalRevenue}<c:if test="${!loop.last}">,</c:if>
                            </c:forEach>
                          ];

                          var options = {
                            chart: {
                              type: 'bar',
                              height: 400
                            },
                            series: [{
                              name: 'Doanh thu',
                              data: productRevenues
                            }],
                            xaxis: {
                              categories: productNames
                            },
                            dataLabels: {
                              formatter: function (val) {
                                return val.toLocaleString() + " đ";
                              }
                            },
                            tooltip: {
                              y: {
                                formatter: function (val) {
                                  return val.toLocaleString() + " đ";
                                }
                              }
                            }
                          };

                          var chart = new ApexCharts(document.querySelector("#productRevenueChart"), options);
                          chart.render();
                        });
                      </script>
                    </c:if>

                    <c:if test="${empty productRevenues}">
                      <p class="text-center text-muted mt-4">Không có dữ liệu doanh thu để hiển thị.</p>
                    </c:if>

                  </div> <!-- End Card Body -->
                </div> <!-- End Card -->
              </div> <!-- End Column -->




              <!-- Recent Sales -->
              <div class="col-12">
                <div class="card recent-sales overflow-auto">


                  <div class="card-body">
                    <h5 class="card-title">Đơn hàng gần đây </h5>

                    <table class="table table-borderless datatable">
                      <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">Khách hàng</th>
                          <th scope="col">Số lượng</th>
                          <th scope="col">Giá</th>
                          <th scope="col">Trạng thái</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="order" items="${orders}">
                          <%-- Tính tổng số lượng sản phẩm trong đơn hàng này --%>
                            <c:set var="totalQuantity" value="0" />
                            <c:forEach var="item" items="${order.orderDetails}">
                              <c:set var="totalQuantity" value="${totalQuantity + item.quantity}" />
                            </c:forEach>

                            <tr>
                              <th scope="row"><a href="#">${order.orderId}</a></th>
                              <td>${order.receiverName}</td>
                              <td>${totalQuantity}</td>
                              <td>
                                <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                              </td>
                              <td><span class="badge bg-success">${order.status}</span></td>
                            </tr>
                        </c:forEach>
                      </tbody>
                    </table>

                  </div>

                </div>
              </div><!-- End Recent Sales -->

              <!-- Top Selling -->
              <div class="col-12">
                <div class="card top-selling overflow-auto">



                  <div class="card-body pb-0">
                    <h5 class="card-title">Sản phẩm bán chạy </h5>

                    <table class="table table-borderless">
                      <thead>
                        <tr>

                          <th scope="col">Sản phẩm</th>

                          <th scope="col">Đã bán</th>

                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach var="item" items="${bestSellers}">
                          <tr>

                            <td><a href="#" class="text-primary fw-bold">${item.productName}</a></td>

                            <td class="fw-bold">${item.totalSold}</td>

                          </tr>
                        </c:forEach>


                      </tbody>
                    </table>

                  </div>

                </div>
              </div><!-- End Top Selling -->

              </div>
              </div><!-- End Left side columns -->







              </div><!-- End Right side columns -->

              </div>
            </section>

          </main><!-- End #main -->

          <!-- ======= Footer ======= -->
          <footer id="footer" class="footer">
            <div class="copyright">
              &copy; Copyright <strong><span>GoBread</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
              <!-- All the links in the footer should remain intact. -->
              <!-- You can delete the links only if you purchased the pro version. -->
              <!-- Licensing information: https://bootstrapmade.com/license/ -->
              <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
              Designed by <a href="">BootstrapMade</a>
            </div>
          </footer><!-- End Footer -->

          <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
              class="bi bi-arrow-up-short"></i></a>

          <!-- Vendor JS Files -->
          <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
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