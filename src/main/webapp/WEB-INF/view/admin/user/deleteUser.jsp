<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Xác nhận xoá người dùng</title>

                <!-- Favicons -->
                <link href="/assets/img/breadlogo.png" rel="icon">
                <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

                <!-- Bootstrap & Font Awesome -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                    rel="stylesheet" />

                <!-- jQuery & Bootstrap JS -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <link href="/assets/css/style.css" rel="stylesheet">
            </head>

            <body class="bg-light">
                <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
                <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />

                <div class="container py-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-8">
                            <div class="card shadow-sm">
                                <div class="card-header bg-danger text-white">
                                    <h4 class="mb-0">
                                        <i class="fa-solid fa-user-xmark me-2"></i>
                                        Xác nhận xoá người dùng
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <div class="alert alert-warning">
                                        <p>Bạn có chắc chắn muốn <strong>xoá người dùng có ID = ${id}</strong> không?
                                        </p>
                                        <p class="mb-0 text-danger"><strong>Hành động này không thể hoàn tác!</strong>
                                        </p>
                                    </div>

                                    <form:form method="post" action="/admin/user/delete" modelAttribute="newUser">
                                        <div class="mb-3">
                                            <label class="form-label">Mã người dùng (ID)</label>
                                            <form:input path="id" type="text" class="form-control" readonly="true" />
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <a href="/admin/user" class="btn btn-secondary">
                                                <i class="fa fa-arrow-left me-1"></i> Huỷ bỏ
                                            </a>
                                            <button type="submit" class="btn btn-danger">
                                                <i class="fa fa-trash me-1"></i> Xác nhận xoá
                                            </button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </body>

            </html>