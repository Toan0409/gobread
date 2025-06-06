<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Lịch Sử Đơn Hàng Bánh Mì</title>
                    <!-- Bootstrap 5 CSS CDN -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
                        rel="stylesheet">
                    <style>
                        body {
                            font-family: 'Inter', sans-serif;
                            background-color: #f8f9fa;
                            color: #343a40;
                        }
                    </style>
                </head>

                <body>
                    <div class="container py-5">
                        <div class="card shadow-lg">
                            <div class="card-body">
                                <h1 class="card-title text-center mb-4">Lịch Sử Đơn Hàng Bánh Mì Của Bạn</h1>

                                <c:forEach var="order" items="${orders}">
                                    <div class="border rounded p-3 mb-4 bg-light">
                                        <div class="row mb-2">
                                            <div class="col-md-6">
                                                <strong>Mã Đơn:</strong> ${order.orderId}
                                            </div>
                                            <div class="col-md-3">
                                                <strong>Tổng:</strong>
                                                <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                            </div>
                                            <div class="col-md-3">
                                                <strong>Trạng Thái:</strong> ${order.status}
                                            </div>
                                        </div>

                                        <table class="table table-sm table-bordered table-hover bg-white">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>Sản phẩm</th>
                                                    <th>Giá</th>
                                                    <th>Số lượng</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="orderDetail" items="${order.orderDetails}">
                                                    <tr>
                                                        <td>${orderDetail.product.name}</td>
                                                        <td>
                                                            <fmt:formatNumber type="number"
                                                                value="${orderDetail.price}" /> đ
                                                        </td>
                                                        <td>x${orderDetail.quantity}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <!-- Bootstrap 5 JS CDN (for interactive components if needed) -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>