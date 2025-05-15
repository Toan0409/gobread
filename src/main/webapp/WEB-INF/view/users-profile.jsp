<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Thông tin</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="/assets/img/breadlogo.png" rel="icon">
        <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">

          <div class="d-flex align-items-center justify-content-between">
            <a href="/" class="logo d-flex align-items-center">
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
                    <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">Xem tất cả</span></a>
                  </li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>

                  <li class="message-item">
                    <a href="#">
                      <img src="//assets/img/user1.png" alt="" class="rounded-circle">
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
                      <img src="//assets/img/user2.jpg" alt="" class="rounded-circle">
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
                      <img src="//assets/img/user3.jpg" alt="" class="rounded-circle">
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

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                  <img src="//assets/img/user1.png" alt="Profile" class="rounded-circle">
                  <span class="d-none d-md-block dropdown-toggle ps-2">Admin</span>
                </a><!-- End Profile Image Icon -->

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                  <li class="dropdown-header">
                    <h6>Admin</h6>
                    <span>Web Designer</span>
                  </li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>

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
                    <a class="dropdown-item d-flex align-items-center" href="pages-faq.html">
                      <i class="bi bi-question-circle"></i>
                      <span>Trợ giúp</span>
                    </a>
                  </li>
                  <li>
                    <hr class="dropdown-divider">
                  </li>

                  <li>
                    <a class="dropdown-item d-flex align-items-center" href="#">
                      <i class="bi bi-box-arrow-right"></i>
                      <span>Đăng xuất</span>
                    </a>
                  </li>

                </ul><!-- End Profile Dropdown Items -->
              </li><!-- End Profile Nav -->

            </ul>
          </nav><!-- End Icons Navigation -->

        </header><!-- End Header -->

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

          <ul class="sidebar-nav" id="sidebar-nav">

            <li class="nav-item">
              <a class="nav-link " href="/">
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
                  <a href="/order">
                    <i class="bi bi-cart"></i><span>Quản lý đơn hàng</span>
                  </a>
                </li>
                <li>
                  <a href="/admin/user">
                    <i class="bi bi-person"></i><span>Quản lý khách hàng</span>
                  </a>
                </li>
                <li>
                  <a href="/product">
                    <i class="bi bi-bag"></i><span>Quản lý sản phẩm & tồn kho</span>
                  </a>
                </li>

              </ul>
            </li><!-- End Components Nav -->

            <!--      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span>Forms</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="forms-elements.html">
              <i class="bi bi-circle"></i><span>Form Elements</span>
            </a>
          </li>
          <li>
            <a href="forms-layouts.html">
              <i class="bi bi-circle"></i><span>Form Layouts</span>
            </a>
          </li>
          <li>
            <a href="forms-editors.html">
              <i class="bi bi-circle"></i><span>Form Editors</span>
            </a>
          </li>
          <li>
            <a href="forms-validation.html">
              <i class="bi bi-circle"></i><span>Form Validation</span>
            </a>
          </li>
        </ul>
      </li><!-- End Forms Nav -->

            <!--      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-layout-text-window-reverse"></i><span>Tables</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="tables-general.html">
              <i class="bi bi-circle"></i><span>General Tables</span>
            </a>
          </li>
          <li>
            <a href="tables-data.html">
              <i class="bi bi-circle"></i><span>Data Tables</span>
            </a>
          </li>
        </ul>
      </li>End Tables Nav-->


            <!--      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-gem"></i><span>Icons</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="icons-bootstrap.html">
              <i class="bi bi-circle"></i><span>Bootstrap Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-remix.html">
              <i class="bi bi-circle"></i><span>Remix Icons</span>
            </a>
          </li>
          <li>
            <a href="icons-boxicons.html">
              <i class="bi bi-circle"></i><span>Boxicons</span>
            </a>
          </li>
        </ul>
      </li><!-- End Icons Nav -->

            <li class="nav-heading">Pages</li>

            <li class="nav-item">
              <a class="nav-link collapsed" href="/admin">
                <i class="bi bi-person"></i>
                <span>Thông tin</span>
              </a>
            </li><!-- End Profile Page Nav -->



            <li class="nav-item">
              <a class="nav-link collapsed" href="/contact">
                <i class="bi bi-envelope"></i>
                <span>Liên hệ</span>
              </a>
            </li><!-- End Contact Page Nav -->

            <li class="nav-item">
              <a class="nav-link collapsed" href="/admin/user/create">
                <i class="bi bi-card-list"></i>
                <span>Đăng ký</span>
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
            <h1>Profile</h1>
            <nav>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">Users</li>
                <li class="breadcrumb-item active">Profile</li>
              </ol>
            </nav>
          </div><!-- End Page Title -->

          <section class="section profile">
            <div class="row">
              <div class="col-xl-4">

                <div class="card">
                  <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                    <img src="/assets/img/2huychuong.jpg" alt="Profile" class="rounded-circle">
                    <h2>Admin - Nhóm 17</h2>
                    <h3>Lập trình viên</h3>
                    <div class="social-links mt-2">
                      <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                      <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                      <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                      <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                    </div>
                  </div>
                </div>

              </div>

              <div class="col-xl-8">

                <div class="card">
                  <div class="card-body pt-3">
                    <!-- Bordered Tabs -->
                    <ul class="nav nav-tabs nav-tabs-bordered">

                      <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Tổng
                          quan</button>
                      </li>

                      <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Chỉnh sửa
                          profiles</button>
                      </li>

                      <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">cài
                          đặt</button>
                      </li>

                      <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Thay đổi
                          mật khẩu</button>
                      </li>

                    </ul>
                    <div class="tab-content pt-2">

                      <div class="tab-pane fade show active profile-overview" id="profile-overview">
                        <h5 class="card-title">Về Chúng tôi</h5>
                        <p class="small fst-italic">Tôi là Người sáng lập lên quán Bánh Mì.
                          Tôi muốn mọi người Việt Nam và nước ngoài có thể thưởng thức các món ăn ngon mỗi ngày.
                          Đó không chỉ là ẩm thực mà đó còn là văn hóa</p>

                        <h5 class="card-title">Chi tiết hồ sơ</h5>

                        <div class="row">
                          <div class="col-lg-3 col-md-4 label ">Tên</div>
                          <div class="col-lg-9 col-md-8">Admin - Nhóm 17</div>
                        </div>

                        <div class="row">
                          <div class="col-lg-3 col-md-4 label">Công Ty</div>
                          <div class="col-lg-9 col-md-8">Lueilwitz, Wisoky and Leuschke</div>
                        </div>

                        <div class="row">
                          <div class="col-lg-3 col-md-4 label">Công Việc</div>
                          <div class="col-lg-9 col-md-8">Lập Trình Viên</div>
                        </div>

                        <div class="row">
                          <div class="col-lg-3 col-md-4 label">Quốc Gia</div>
                          <div class="col-lg-9 col-md-8">Việt Nam</div>
                        </div>

                        <div class="row">
                          <div class="col-lg-3 col-md-4 label">Địa chỉ</div>
                          <div class="col-lg-9 col-md-8">Nhổn, Minh Khai, Nam Từ Liêm, Hà Nội</div>
                        </div>

                        <div class="row">
                          <div class="col-lg-3 col-md-4 label">Số điện thoại</div>
                          <div class="col-lg-9 col-md-8">(436) 486-3538 x29071</div>
                        </div>

                        <div class="row">
                          <div class="col-lg-3 col-md-4 label">địa chỉ Email</div>
                          <div class="col-lg-9 col-md-8">admin_nhom17@gmail.com</div>
                        </div>

                      </div>

                      <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                        <!-- Profile Edit Form -->
                        <form>
                          <div class="row mb-3">
                            <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                            <div class="col-md-8 col-lg-9">
                              <img src="/assets/img/2huychuong.jpg" alt="Profile">
                              <div class="pt-2">
                                <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i
                                    class="bi bi-upload"></i></a>
                                <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i
                                    class="bi bi-trash"></i></a>
                              </div>
                            </div>
                          </div>

                          <div class="row mb-3">
                            <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="fullName" type="text" class="form-control" id="fullName"
                                value="admin_nhom17">
                            </div>
                          </div>

                          <div class="row mb-3">
                            <label for="about" class="col-md-4 col-lg-3 col-form-label">Về chúng tôi</label>
                            <div class="col-md-8 col-lg-9">
                              <textarea name="about" class="form-control" id="about" style="height: 100px">Tôi là Người sáng lập lên quán Bánh Mì. Tôi muốn mọi người Việt Nam và nước ngoài có thể thưởng thức các món ăn
                          ngon mỗi ngày. Đó không chỉ là ẩm thực mà đó còn là văn hóa</textarea>
                            </div>
                          </div>

                          <div class="row mb-3">
                            <label for="company" class="col-md-4 col-lg-3 col-form-label">Công ty</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="company" type="text" class="form-control" id="company"
                                value="Lueilwitz, Wisoky and Leuschke">
                            </div>
                          </div>

                          <div class="row mb-3">
                            <label for="Job" class="col-md-4 col-lg-3 col-form-label">Công Việc</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="job" type="text" class="form-control" id="Job" value="Lập Trình Viên">
                            </div>
                          </div>

                          <div class="row mb-3">
                            <label for="Country" class="col-md-4 col-lg-3 col-form-label">Quốc Gia</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="country" type="text" class="form-control" id="Country" value="Việt Nam">
                            </div>
                          </div>

                          <div class="row mb-3">
                            <label for="Address" class="col-md-4 col-lg-3 col-form-label">Địa Ch</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="address" type="text" class="form-control" id="Address"
                                value="Nhổn, Bắc Từ Liêm, Hà Nội">
                            </div>

                            <div class="row mb-3">
                              <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Số điện thoại</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="phone" type="text" class="form-control" id="Phone"
                                  value="(436) 486-3538 x29071">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Email" class="col-md-4 col-lg-3 col-form-label">địa chỉ Email</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="email" type="email" class="form-control" id="Email"
                                  value="admin_nhom17@gmail.com">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Twitter Profile</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="twitter" type="text" class="form-control" id="Twitter"
                                  value="https://twitter.com/#">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Facebook" class="col-md-4 col-lg-3 col-form-label">Facebook Profile</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="facebook" type="text" class="form-control" id="Facebook"
                                  value="https://facebook.com/#">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Instagram Profile</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="instagram" type="text" class="form-control" id="Instagram"
                                  value="https://instagram.com/#">
                              </div>
                            </div>

                            <div class="row mb-3">
                              <label for="Linkedin" class="col-md-4 col-lg-3 col-form-label">Linkedin Profile</label>
                              <div class="col-md-8 col-lg-9">
                                <input name="linkedin" type="text" class="form-control" id="Linkedin"
                                  value="https://linkedin.com/#">
                              </div>
                            </div>

                            <div class="text-center">
                              <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </form><!-- End Profile Edit Form -->

                      </div>

                      <div class="tab-pane fade pt-3" id="profile-settings">

                        <!-- Settings Form -->
                        <form>

                          <div class="row mb-3">
                            <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Email Notifications</label>
                            <div class="col-md-8 col-lg-9">
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="changesMade" checked>
                                <label class="form-check-label" for="changesMade">
                                  Changes made to your account
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="newProducts" checked>
                                <label class="form-check-label" for="newProducts">
                                  Information on new products and services
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="proOffers">
                                <label class="form-check-label" for="proOffers">
                                  Marketing and promo offers
                                </label>
                              </div>
                              <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="securityNotify" checked disabled>
                                <label class="form-check-label" for="securityNotify">
                                  Security alerts
                                </label>
                              </div>
                            </div>
                          </div>

                          <div class="text-center">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                          </div>
                        </form><!-- End settings Form -->

                      </div>

                      <div class="tab-pane fade pt-3" id="profile-change-password">
                        <!-- Change Password Form -->
                        <form>

                          <div class="row mb-3">
                            <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current
                              Password</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="password" type="password" class="form-control" id="currentPassword">
                            </div>
                          </div>

                          <div class="row mb-3">
                            <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="newpassword" type="password" class="form-control" id="newPassword">
                            </div>
                          </div>

                          <div class="row mb-3">
                            <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New
                              Password</label>
                            <div class="col-md-8 col-lg-9">
                              <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                            </div>
                          </div>

                          <div class="text-center">
                            <button type="submit" class="btn btn-primary">Change Password</button>
                          </div>
                        </form><!-- End Change Password Form -->

                      </div>

                    </div><!-- End Bordered Tabs -->

                  </div>
                </div>

              </div>
            </div>
          </section>

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