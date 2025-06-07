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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f9fafb;
        }
    </style>
</head>

<body>
    <div class="container py-5">
        <div class="bg-white p-5 rounded-4 shadow-lg">
            <h1 class="text-center text-dark fw-bold mb-5">
                <i class="bi bi-clock-history me-2 text-primary"></i>Lịch Sử Đơn Hàng Bánh Mì Của Bạn
            </h1>

            <c:forEach var="order" items="${orders}">
                <div class="card mb-4 border-0 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-start align-items-md-center mb-3">
                            <h5 class="card-title mb-2 mb-md-0">
                                Mã Đơn Hàng: <span class="text-primary fw-bold">${order.orderId}</span>
                            </h5>
                            <span class="badge bg-success">${order.status}</span>
                        </div>
                        <hr>
                        <div class="list-group list-group-flush">
                            <c:forEach var="orderDetail" items="${order.orderDetails}">
                                <div class="list-group-item d-flex justify-content-between align-items-center">
                                    <div>
                                        <i class="bi bi-bag-fill text-secondary me-2"></i>
                                        <span class="fw-semibold">${orderDetail.product.name}</span>
                                        <small class="text-muted ms-2">x${orderDetail.quantity}</small>
                                    </div>
                                    <div class="fw-bold text-dark">
                                        <fmt:formatNumber type="number" value="${orderDetail.price}" /> đ
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="d-flex justify-content-end mt-4">
                            <h5 class="text-end text-dark fw-bold">
                                Tổng Cộng: <fmt:formatNumber type="number" value="${order.totalPrice}" /> đ
                            </h5>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
