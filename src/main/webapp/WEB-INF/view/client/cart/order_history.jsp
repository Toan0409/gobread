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
                            background-color: #f3f4f6;
                            /* Light background color */
                            color: #374151;
                            /* Default text color */
                        }
                    </style>
                </head>

                <body class="antialiased">
                    <div class="min-h-screen flex items-center justify-center p-4 sm:p-6 lg:p-8">
                        <div class="bg-white rounded-lg shadow-xl p-6 w-full max-w-4xl">
                            <h1 class="text-3xl sm:text-4xl font-bold text-center text-gray-800 mb-8">Lịch Sử Đơn Hàng
                                Bánh Mì Của Bạn</h1>


                            <div
                                class="border border-gray-200 rounded-lg p-5 mb-6 bg-gray-50 hover:shadow-md transition-shadow duration-300">
                                <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-4">
                                    <c:forEach var="order" items="${orders}">
                                        <tr>
                                            <td colspan="2">Order ID = ${order.orderId}</td>
                                            <td colspan="1">
                                                <fmt:formatNumber type="number" value="${order.totalPrice}" /> dong
                                            </td>
                                            <td colspan="2"></td>
                                            <td colspan="1">
                                                ${order.status}
                                            </td>
                                        </tr>
                                        <c:forEach var="orderDetail" items="${order.orderDetails}">
                                            <tr>
                                                <td colspan="2">${orderDetail.product.name}</td>
                                                <td colspan="1">
                                                    <fmt:formatNumber type="number" value="${orderDetail.price}" /> dong
                                                </td>
                                                <td colspan="2">x${orderDetail.quantity}</td>
                                                <td colspan="1"></td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                </div>

                                <hr class="border-t border-gray-200 my-4">
                            </div>


                        </div>
                    </div>
                </body>

                </html>