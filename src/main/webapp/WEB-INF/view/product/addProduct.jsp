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
                <div class="container mt-5">
                    <h2 class="text-center mb-4">Thêm Sản Phẩm</h2>
                    <form:form action="/product/add" method="post" modelAttribute="newProduct"
                        enctype="multipart/form-data" class="mx-auto" style="max-width: 500px;">
                        <div class="mb-3">
                            <label class="form-label">Tên Sản Phẩm</label>
                            <form:input path="name" class="form-control" required="true" />
                        </div>

                        <div class="form-group">
                            <label>Mô tả</label>
                            <form:textarea path="description" class="form-control" rows="3" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Giá (VND)</label>
                            <form:input path="price" type="number" class="form-control" required="true" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Số Lượng Tồn</label>
                            <form:input path="quantity" type="number" class="form-control" required="true" />
                        </div>

                        <div class="mb-3">
                            <label for="imageFile" class="form-label">Image:</label>
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