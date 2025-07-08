<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Đăng ký</title>
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script>
          $(document).ready(() => {
            const avatarFile = $("#imageFile");

            avatarFile.change(function (e) {
              const imgURL = URL.createObjectURL(e.target.files[0]);
              $("#avatarPreview").attr("src", imgURL);
              $("#avatarPreview").css({ display: "block" });
            });
          });
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
        <main>
          <div class="container">

            <section
              class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
              <div class="container">
                <div class="row justify-content-center">
                  <div class="col-lg-8 col-md-10 d-flex flex-column align-items-center justify-content-center">



                    <div class="card mb-3">

                      <div class="card-body">

                        <div class="pt-4 pb-2">
                          <h5 class="card-title text-center pb-0 fs-4">Tạo tài khoản</h5>
                          <p class="text-center small">Nhập thông tin của bạn để tạo tài khoản</p>
                        </div>

                        <form:form modelAttribute="newUser" method="post" class="row g-3 needs-validation"
                          action="${pageContext.request.contextPath}/admin/user/create">
                          <div class="col-md-6">
                            <label for="fullName" class="form-label">Họ và tên</label>
                            <form:input path="fullName" cssClass="form-control" id="fullName" required="required" />
                            <div class="invalid-feedback">Please, enter your name!</div>
                          </div>

                          <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <form:input path="email" cssClass="form-control" id="email" required="required" />
                            <div class="invalid-feedback">Vui lòng nhập địa chỉ email!</div>
                          </div>

                          <div class="col-md-6">
                            <label for="username" class="form-label">Tên đăng nhập</label>
                            <form:input path="username" cssClass="form-control" id="username" required="required" />
                            <div class="invalid-feedback">Không được để trống</div>
                          </div>

                          <div class="col-md-6">
                            <label for="password" class="form-label">Mật khẩu</label>
                            <form:password path="password" cssClass="form-control" id="password" required="required" />
                            <div class="invalid-feedback">Không được để trống</div>
                          </div>

                          <div class="col-md-6">
                            <label for="phoneNumber" class="form-label">Số điện thoại</label>
                            <form:input path="phoneNumber" cssClass="form-control" id="phoneNumber"
                              required="required" />
                            <div class="invalid-feedback">Không được để trống</div>
                          </div>

                          <div class="col-md-6">
                            <label for="address" class="form-label">Địa chỉ</label>
                            <form:input path="address" cssClass="form-control" id="address" required="required" />
                            <div class="invalid-feedback">Không được để trống</div>
                          </div>

                          <div class="col-md-6">
                            <label for="roleId" class="form-label">Vai trò</label>
                            <form:select path="role.id" cssClass="form-select" id="roleId" required="required">
                              <form:option value="" label="-- Chọn vai trò --" />
                              <form:options items="${roles}" itemValue="id" itemLabel="name" />
                            </form:select>
                            <div class="invalid-feedback">Vui lòng chọn vai trò!</div>
                          </div>


                          <div class="col-md-6">
                            <label for="imageFile" class="form-label">Avatar:</label>
                            <input class="form-control" type="file" id="imageFile" name="image"
                              accept=".jpg, .jpeg, .png">
                          </div>

                          <div style="margin-top: 10px;">
                            <img id="avatarPreview" src="#" alt="Ảnh xem trước"
                              style="max-height: 200px; display: none;" />
                          </div>



                          <div class="col-12">
                            <div class="form-check">
                              <form:checkbox path="terms" cssClass="form-check-input" id="acceptTerms" />
                              <label class="form-check-label" for="acceptTerms">I agree and accept the <a href="#">terms
                                  and
                                  conditions</a></label>
                              <div class="invalid-feedback">You must agree before submitting.</div>
                            </div>
                          </div>

                          <div class="col-12">
                            <button class="btn btn-primary w-100" type="submit">Create Account</button>
                          </div>
                        </form:form>


                      </div>
                    </div>

                    <div class="credits">
                      <!-- All the links in the footer should remain intact. -->
                      <!-- You can delete the links only if you purchased the pro version. -->
                      <!-- Licensing information: https://bootstrapmade.com/license/ -->
                      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                    </div>

                  </div>
                </div>
              </div>

            </section>

          </div>
        </main><!-- End #main -->

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
        <script>
          document.addEventListener("DOMContentLoaded", function () {
            const form = document.querySelector("form");
            form.addEventListener("submit", function (e) {
              // Ngăn chặn submit mặc định để kiểm tra

              let isValid = true;
              const fullName = document.getElementById("fullName");
              const email = document.getElementById("email");
              const username = document.getElementById("username");
              const password = document.getElementById("password");
              const phone = document.getElementById("phoneNumber");
              const address = document.getElementById("address");
              const terms = document.getElementById("acceptTerms");

              // Xóa thông báo lỗi cũ
              const invalids = form.querySelectorAll(".is-invalid");
              invalids.forEach(el => el.classList.remove("is-invalid"));

              // Kiểm tra từng trường
              if (fullName.value.trim() === "") {
                fullName.classList.add("is-invalid");
                isValid = false;
              }

              const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
              if (!emailPattern.test(email.value.trim())) {
                email.classList.add("is-invalid");
                isValid = false;
              }

              if (username.value.trim() === "") {
                username.classList.add("is-invalid");
                isValid = false;
              }

              if (password.value.length < 6) {
                password.classList.add("is-invalid");
                isValid = false;
              }

              if (phone.value.trim() === "") {
                phone.classList.add("is-invalid");
                isValid = false;
              }

              if (address.value.trim() === "") {
                address.classList.add("is-invalid");
                isValid = false;
              }

              if (!terms.checked) {
                terms.classList.add("is-invalid");
                isValid = false;
              }

              if (isValid) {
                alert("✅ Đăng ký thành công!");
                form.submit(); // Cho phép submit nếu hợp lệ
              } else {
                alert("❌ Vui lòng kiểm tra lại các trường thông tin!");
              }
            });
          });

        </script>


      </body>

      </html>