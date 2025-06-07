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
                    <!-- Tailwind CSS CDN -->
                    <script src="https://cdn.tailwindcss.com"></script>
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
                        rel="stylesheet">
                    <style>
                        body {
                            font-family: 'Inter', sans-serif;
                            background-color: #f9fafb;
                        }
                    </style>
                </head>

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

                        </div>
                    </div>
                </body>

                </html>