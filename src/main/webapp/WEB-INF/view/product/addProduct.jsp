<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <title>Thêm Sản Phẩm</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-light">
                <div class="container mt-5">
                    <h2 class="text-center mb-4">Thêm Sản Phẩm</h2>
                    <form action="/product/add" method="post" class="mx-auto" style="max-width: 500px;">
                        <div class="mb-3">
                            <label class="form-label">Tên Sản Phẩm</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Loại</label>
                            <input type="text" name="category" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Giá (VND)</label>
                            <input type="number" name="price" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Số Lượng Tồn</label>
                            <input type="number" name="quantity" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-success w-100">Lưu Sản Phẩm</button>
                    </form>
                </div>
            </body>

            </html>