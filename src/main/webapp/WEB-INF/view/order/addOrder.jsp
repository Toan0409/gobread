<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <html>

            <head>
                <title>Thêm Đơn Hàng</title>
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

                <h2 style="text-align:center;">Thêm Đơn Hàng</h2>

                <div class="form-container">
                    <form method="POST" action="/order/add" modelAttribute="order">
                        <label for="customerName">Khách Hàng:</label>
                        <input path="customerName" id="customerName" />

                        <label for="productName">Sản Phẩm:</label>
                        <input path="productName" id="productName" />

                        <label for="quantity">Số Lượng:</label>
                        <input path="quantity" id="quantity" type="number" />

                        <label for="totalPrice">Tổng Tiền:</label>
                        <input path="totalPrice" id="totalPrice" type="number" step="0.01" />

                        <label for="status">Trạng Thái:</label>
                        <select path="status" id="status">
                            <option value="Đang xử lý" label="Đang xử lý" />
                            <option value="Hoàn thành" label="Hoàn thành" />
                            <option value="Hủy" label="Hủy" />
                        </select>

                        <button type="submit">Lưu Đơn Hàng</button>
                    </form>
                </div>

            </body>

            </html>