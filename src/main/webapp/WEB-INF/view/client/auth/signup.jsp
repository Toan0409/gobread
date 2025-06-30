<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html lang="vi">

      <head>
        <meta charset="UTF-8">
        <title>Đăng ký</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="/assets/css/style.css" rel="stylesheet">
        <link href="/assets/img/breadlogo.png" rel="icon">

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
      </head>

      <body>
        <main>
          <div class="container">
            <section
              class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
              <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                  <div class="d-flex justify-content-center py-4">
                    <a href="/" class="logo d-flex align-items-center w-auto">
                      <img src="/assets/img/breadlogo.png" alt="">
                      <span class="d-none d-lg-block">GoBread</span>
                    </a>
                  </div>

                  <div class="card mb-3">
                    <div class="card-body">
                      <div class="pt-4 pb-2">
                        <h5 class="card-title text-center pb-0 fs-4">Tạo tài khoản</h5>
                        <p class="text-center small">Nhập thông tin để đăng ký</p>
                      </div>

                      <form:form action="/signup" method="post" modelAttribute="registerDTO"
                        cssClass="row g-3 needs-validation">

                        <!-- Họ tên -->
                        <div class="col-12">
                          <label class="form-label">Họ và tên</label>
                          <form:input path="fullName"
                            cssClass="form-control ${status.errorFields['fullName'] ? 'is-invalid' : ''}" />
                          <form:errors path="fullName" cssClass="invalid-feedback" />
                        </div>

                        <!-- Email -->
                        <div class="col-12">
                          <label class="form-label">Email</label>
                          <form:input path="email" type="email"
                            cssClass="form-control ${status.errorFields['email'] ? 'is-invalid' : ''}" />
                          <form:errors path="email" cssClass="text-danger" />
                        </div>

                        <!-- Tên đăng nhập -->
                        <div class="col-12">
                          <label class="form-label">Tên đăng nhập</label>
                          <form:input path="username"
                            cssClass="form-control ${status.errorFields['username'] ? 'is-invalid' : ''}" />
                          <form:errors path="username" cssClass="invalid-feedback" />
                        </div>

                        <!-- Mật khẩu -->
                        <div class="col-12">
                          <label class="form-label">Mật khẩu</label>
                          <form:password path="password"
                            cssClass="form-control ${status.errorFields['password'] ? 'is-invalid' : ''}" />
                          <form:errors path="password" cssClass="invalid-feedback" />
                        </div>

                        <!-- Nhập lại mật khẩu -->
                        <div class="col-12">
                          <label class="form-label">Nhập lại mật khẩu</label>
                          <form:password path="confirmPassword"
                            cssClass="form-control ${status.errorFields['confirmPassword'] ? 'is-invalid' : ''}" />
                          <form:errors path="confirmPassword" cssClass="text-danger" />

                        </div>

                        <!-- Số điện thoại -->
                        <div class="col-12">
                          <label class="form-label">Số điện thoại</label>
                          <form:input path="phoneNumber"
                            cssClass="form-control ${status.errorFields['phoneNumber'] ? 'is-invalid' : ''}" />
                          <form:errors path="phoneNumber" cssClass="invalid-feedback" />
                        </div>

                        <!-- Địa chỉ -->
                        <div class="col-12">
                          <label class="form-label">Địa chỉ</label>
                          <form:input path="address"
                            cssClass="form-control ${status.errorFields['address'] ? 'is-invalid' : ''}" />
                          <form:errors path="address" cssClass="invalid-feedback" />
                        </div>

                        <div class="mb-3">
                          <label for="imageFile" class="form-label">Avatar:</label>
                          <input class="form-control" type="file" id="imageFile" name="image"
                            accept=".jpg, .jpeg, .png">
                        </div>

                        <div style="margin-top: 10px;">
                          <img id="avatarPreview" src="#" alt="Ảnh xem trước"
                            style="max-height: 200px; display: none;" />
                        </div>

                        <!-- Đồng ý điều khoản -->
                        <div class="col-12">
                          <div class="form-check">
                            <form:checkbox path="terms"
                              cssClass="form-check-input ${status.errorFields['terms'] ? 'is-invalid' : ''}"
                              id="terms" />
                            <label class="form-check-label" for="terms">Tôi đồng ý với <a href="#">Điều
                                khoản</a></label>
                            <form:errors path="terms" cssClass="invalid-feedback" />
                          </div>
                        </div>

                        <!-- Nút đăng ký -->
                        <div class="col-12">
                          <button class="btn btn-primary w-100" type="submit">Đăng ký</button>
                        </div>

                        <!-- Gợi ý đăng nhập -->
                        <div class="col-12">
                          <p class="small mb-0">Đã có tài khoản? <a href="/login">Đăng nhập</a></p>
                        </div>

                      </form:form>
                    </div>
                  </div>

                  <div class="credits text-center">
                    Thiết kế bởi <a href="https://bootstrapmade.com/">BootstrapMade</a>
                  </div>

                </div>
              </div>
            </section>
          </div>
        </main>

        <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="/assets/js/main.js"></script>
      </body>

      </html>