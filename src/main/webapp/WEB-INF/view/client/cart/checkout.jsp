<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="utf-8">
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <title>Giỏ hàng | GoBread</title>


                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                        rel="stylesheet" />
                    <!-- Favicons & CSS -->
                    <link href="/assets_client/img/favicon.jpg" rel="icon">
                    <link href="/assets_client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/assets_client/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                    <link href="/assets_client/vendor/aos/aos.css" rel="stylesheet">
                    <link href="/assets_client/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
                    <link href="/assets_client/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
                    <link href="/assets_client/css/main.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Header -->
                    <header id="header" class="header d-flex align-items-center sticky-top">
                        <div class="container d-flex justify-content-between align-items-center">
                            <a href="/" class="logo">
                                <h1 class="sitename">GoBread</h1>
                            </a>
                            <nav id="navmenu" class="navmenu">
                                <ul>
                                    <li><a href="/">Trang chủ</a></li>
                                    <li><a href="/#menu">Menu</a></li>
                                    <li><a href="/#order-online">Đặt hàng</a></li>
                                </ul>
                                <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                            </nav>
                        </div>
                    </header>

                    <main class="main">
                        <div class="container-fluid py-5">
                            <div class="container py-5">
                                <div class="mb-3">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Thông tin thanh toán
                                            </li>
                                        </ol>
                                    </nav>
                                </div>

                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Sản phẩm</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Giá cả</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Thành tiền</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${ empty cartDetails}">
                                                <tr>
                                                    <td colspan="6">
                                                        Không có sản phẩm trong giỏ hàng
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:forEach var="cartDetail" items="${cartDetails}">

                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="/images/product/${cartDetail.product.imageUrl}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <p class="mb-0 mt-4">

                                                            ${cartDetail.product.name}

                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price}" /> đ
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${cartDetail.quantity}">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                        </p>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${not empty cartDetails}">
                                    <form:form action="/place-order" method="post" modelAttribute="cart">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <div class="mt-5 row g-4 justify-content-start">
                                            <div class="col-12 col-md-6">
                                                <div class="p-4 ">
                                                    <h5>Thông Tin Người Nhận
                                                    </h5>
                                                    <div class="row">
                                                        <div class="col-12 form-group mb-3">
                                                            <label>Tên người nhận</label>
                                                            <input class="form-control" name="receiverName" required />
                                                        </div>
                                                        <div class="col-12 form-group mb-3">
                                                            <label>Địa chỉ người nhận</label>
                                                            <input class="form-control" name="receiverAddress"
                                                                required />
                                                        </div>
                                                        <div class="col-12 form-group mb-3">
                                                            <label>Số điện thoại</label>
                                                            <input class="form-control" name="receiverPhone" required />
                                                        </div>
                                                        <div class="mt-4">
                                                            <i class="fas fa-arrow-left"></i>
                                                            <a href="/cart">Quay lại giỏ hàng</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12 col-md-6">
                                                <div class="bg-light rounded">
                                                    <div class="p-4">
                                                        <h1 class="display-6 mb-4">Thông Tin <span
                                                                class="fw-normal">Thanh
                                                                Toán</span>
                                                        </h1>

                                                        <div class="d-flex justify-content-between">
                                                            <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                            <div class="">
                                                                <p class="mb-0">0 đ</p>
                                                            </div>
                                                        </div>
                                                        <div class="mt-3 d-flex justify-content-between">
                                                            <h5 class="mb-0 me-4">Hình thức</h5>
                                                            <div class="">
                                                                <p class="mb-0">Thanh toán khi nhận hàng (COD)</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div
                                                        class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                        <h5 class="mb-0 ps-4 me-4">Tổng số tiền</h5>
                                                        <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                                            <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                        </p>
                                                    </div>

                                                    <button
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                                        Xác nhận thanh toán
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                </c:if>

                            </div>
                        </div>
                        <!-- Cart Page End -->

                    </main>

                    <!-- JS -->
                    <script src="/assets_client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


                    <script src="/assets_client/js/main.js"></script>



                </body>

                </html>