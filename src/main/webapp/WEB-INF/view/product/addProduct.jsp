<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <html>

            <head>
                <title>Thêm Sản Phẩm</title>
                <style>
                    label {
                        display: block;
                        margin: 10px 0 5px;
                    }

                    input,
                    select {
                        width: 100%;
                        padding: 8px;
                        margin-bottom: 10px;
                    }

                    .form-container {
                        max-width: 400px;
                        margin: auto;
                    }

                    button {
                        padding: 10px 20px;
                        background-color: green;
                        color: white;
                        border: none;
                    }
                </style>
            </head>

            <body>

                <h2 style="text-align:center;">Thêm Sản Phẩm</h2>

                <div class="form-container">
                    <form method="POST" action="/product/add" modelAttribute="product">
                        <label for="name">Tên Sản Phẩm:</label>
                        <input path="name" id="name" />

                        <label for="category">Loại:</label>
                        <input path="category" id="category" />

                        <label for="price">Giá (VNĐ):</label>
                        <input path="price" id="price" type="number" step="1000" />

                        <label for="stock">Số Lượng Tồn:</label>
                        <input path="stock" id="stock" type="number" />

                        <button type="submit">Lưu Sản Phẩm</button>
                    </form>
                </div>

            </body>

            </html>