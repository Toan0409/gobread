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
<<<<<<< HEAD
                            background-color: #f9fafb;
=======
                            background-color: #f8f9fa;
                            color: #343a40;
>>>>>>> 70dddc4a44a1fe4e92b4222697c31e0a32aa4962
                        }
                    </style>
                </head>

<<<<<<< HEAD
                <body class="antialiased">
                    <div class="min-h-screen flex items-center justify-center p-4 sm:p-6 lg:p-10 bg-gray-100">
                        <div class="bg-white rounded-2xl shadow-2xl w-full max-w-5xl p-8">
                            <h1 class="text-4xl font-extrabold text-center text-gray-800 mb-10">Lịch Sử Đơn Hàng Bánh Mì
                                Của Bạn</h1>

                            <c:forEach var="order" items="${orders}">
                                <div
                                    class="mb-6 border border-gray-200 rounded-xl p-6 bg-gray-50 hover:shadow-lg transition-shadow">
                                    <div
                                        class="flex flex-col md:flex-row justify-between items-start md:items-center mb-4">
                                        <div class="text-lg font-semibold text-gray-700">Mã Đơn Hàng: <span
                                                class="text-indigo-600 font-bold">${order.orderId}</span></div>
                                        <div class="text-sm text-gray-500 mt-2 md:mt-0">Trạng Thái: <span
                                                class="font-medium text-green-600">${order.status}</span></div>
                                    </div>
                                    <div class="space-y-4">
                                        <c:forEach var="orderDetail" items="${order.orderDetails}">
                                            <div
                                                class="flex justify-between items-center bg-white border rounded-lg p-4">
                                                <div>
                                                    <div class="text-base font-medium text-gray-800">
                                                        ${orderDetail.product.name}</div>
                                                    <div class="text-sm text-gray-500">Số lượng:
                                                        x${orderDetail.quantity}</div>
                                                </div>
                                                <div class="text-base font-semibold text-gray-700">
                                                    <fmt:formatNumber type="number" value="${orderDetail.price}" /> đ
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="mt-4 flex justify-end">
                                        <div class="text-lg font-bold text-gray-900">
                                            Tổng Cộng:
                                            <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

=======
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
>>>>>>> 70dddc4a44a1fe4e92b4222697c31e0a32aa4962
                        </div>
                    </div>

                    <!-- Bootstrap 5 JS CDN (for interactive components if needed) -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>