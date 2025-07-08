<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <title>Thêm Sản Phẩm</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- jQuery CDN -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

            <body class="bg-light">
                <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
                <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />

                <div class="container mt-5">
                    <h2 class="text-center mb-4">Thêm Sản Phẩm</h2>
                    <form:form action="/admin/product/add" method="post" modelAttribute="newProduct"
                        enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">

                        <div class="mb-3">
                            <label class="form-label">Tên Sản Phẩm</label>
                            <form:input path="name" class="form-control" />
                            <form:errors path="name" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mô tả</label>
                            <form:textarea path="description" class="form-control" rows="3" />
                            <form:errors path="description" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Giá (VND)</label>
                            <form:input path="price" type="number" class="form-control" />
                            <form:errors path="price" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Số Lượng Tồn</label>
                            <form:input path="quantity" type="number" class="form-control" />
                            <form:errors path="quantity" cssClass="text-danger" />
                        </div>

                        <div class="mb-3">
                            <label for="imageFile" class="form-label">Ảnh sản phẩm</label>
                            <input class="form-control" type="file" id="imageFile" name="image"
                                accept=".jpg, .jpeg, .png">
                        </div>

                        <div style="margin-top: 10px;">
                            <img id="avatarPreview" src="#" alt="Ảnh xem trước"
                                style="max-height: 200px; display: none;" />
                        </div>

                        <button type="submit" class="btn btn-success w-100">Lưu Sản Phẩm</button>
                    </form:form>

                </div>

            </body>

            </html>