<%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
                    <link href="/assets_client/img/favicon.jpg" rel="icon">
                    <link href="/assets_client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/assets_client/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                    <link href="/assets_client/vendor/aos/aos.css" rel="stylesheet">
                    <link href="/assets_client/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
                    <link href="/assets_client/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
                    <link href="/assets_client/css/main.css" rel="stylesheet">


                    <!-- Owl Carousel CSS -->
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

                    <!-- Owl Carousel JS -->
                    <script
                        src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

                </head>

                <body>
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
                                            <li class="breadcrumb-item active" aria-current="page">Chi tiết giỏ hàng
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
                                                <th scope="col">Xử lý</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${ empty cartDetails}">
                                                <tr style="text-align: center; font-size: 24px;">
                                                    <td colspan="6">
                                                        Không có sản phẩm trong giỏ hàng
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
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
                                                                value="${cartDetail.price}" />
                                                            đ
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <div class="input-group-btn">
                                                                <button
                                                                    class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${cartDetail.quantity}"
                                                                data-cart-detail-id="${cartDetail.id}"
                                                                data-cart-detail-price="${cartDetail.price}"
                                                                data-cart-detail-index="${status.index}">
                                                            <div class="input-group-btn">
                                                                <button
                                                                    class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price * cartDetail.quantity}" /> đ
                                                    </td>
                                                    <td>
                                                        <form method="post"
                                                            action="/delete-cart-product/${cartDetail.id}">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                value="${_csrf.token}" />
                                                            <button
                                                                class="btn btn-md rounded-circle bg-light border mt-4">
                                                                <i class="fa fa-times text-danger"></i>
                                                            </button>
                                                        </form>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <c:if test="${not empty cartDetails}">
                                    <div class="mt-5 row g-4 justify-content-start">
                                        <div class="col-12 col-md-8">
                                            <div class="bg-light rounded">
                                                <div class="p-4">
                                                    <h1 class="display-6 mb-4">Thông Tin <span class="fw-normal">Đơn
                                                            Hàng</span>
                                                    </h1>

                                                    <div class="d-flex justify-content-between mb-4">
                                                        <h5 class="mb-0 me-4">Tạm tính:</h5>
                                                        <p class="mb-0" data-cart-total-price="${totalPrice}">
                                                            <fmt:formatNumber type="number" value="${totalPrice}" /> đ
                                                        </p>
                                                    </div>
                                                    <div class="d-flex justify-content-between">
                                                        <h5 class="mb-0 me-4">Phí vận chuyển</h5>
                                                        <div class="">
                                                            <p class="mb-0">0 đ</p>
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

                                                <form:form method="post" action="/confirm-checkout"
                                                    modelAttribute="cart">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <div style="display: none;">
                                                        <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                            varStatus="status">
                                                            <div class="mb-3">
                                                                <div class="form-group">
                                                                    <label>Id:</label>
                                                                    <form:input type="text" class="form-control"
                                                                        value="${cartDetail.id}"
                                                                        path="cartDetails[${status.index}].id" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Quantity:</label>
                                                                    <form:input type="text" class="form-control"
                                                                        value="${cartDetail.quantity}"
                                                                        path="cartDetails[${status.index}].quantity" />
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                    <button
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                                        Xác nhận đặt hàng
                                                    </button>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Cart Page End -->

                    </main>

                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                    <script src="${pageContext.request.contextPath}/assets_client/js/cart.js"></script>


                    <script
                        src="${pageContext.request.contextPath}/assets_client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="${pageContext.request.contextPath}/assets_client/js/main.js"></script>




                </body>

                </html>