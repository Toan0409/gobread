<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>Thêm đơn hàng</title>
            <!-- Bootstrap 5 CDN -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-5">
                <h2 class="mb-4">Thêm đơn hàng</h2>

                <form:form method="post" action="/orders/add" modelAttribute="order">
                    <div class="mb-3">
                        <label class="form-label">Họ tên khách hàng</label>
                        <form:input path="customerName" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Địa chỉ</label>
                        <form:input path="customerAddress" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Số điện thoại</label>
                        <form:input path="customerPhoneNumber" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Sản phẩm</label>
                        <form:input path="product" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Số lượng</label>
                        <form:input path="quantity" type="number" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Trạng thái</label>
                        <form:input path="status" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Tổng tiền</label>
                        <form:input path="totalPrice" type="number" step="0.01" cssClass="form-control" />
                    </div>

                    <button type="submit" class="btn btn-primary">Thêm đơn hàng</button>
                </form:form>
            </div>

            <!-- Bootstrap JS (nếu cần) -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>