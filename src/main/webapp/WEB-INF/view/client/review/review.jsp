<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <title>Đánh giá sản phẩm | GoBread</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <!-- Vendor & Main CSS -->
                <link href="/assets_client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="/assets_client/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                <link href="/assets_client/css/main.css" rel="stylesheet">
            </head>

            <body>

                <!-- Header -->
                <header id="header" class="header d-flex align-items-center sticky-top">
                    <div class="container d-flex justify-content-between align-items-center">
                        <a href="index.html" class="logo">
                            <h1 class="sitename">GoBread</h1><span>.</span>
                        </a>
                        <nav id="navmenu" class="navmenu">
                            <ul>
                                <li><a href="index.html#hero">Trang chủ</a></li>
                                <li><a href="index.html#menu">Menu</a></li>
                                <li><a href="index.html#order-online">Đặt hàng</a></li>
                            </ul>
                            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                        </nav>
                    </div>
                </header>

                <!-- Main -->
                <main class="main">
                    <section class="section py-5">
                        <div class="container">
                            <h2 class="text-center mb-4">⭐ Đánh giá sản phẩm</h2>

                            <select id="orderSelect" class="form-select mb-3">
                                <option disabled selected>Chọn sản phẩm từ đơn đã mua</option>
                            </select>

                            <div id="reviewForm" style="display: none;">
                                <div class="mb-3">
                                    <label class="form-label">Số sao:</label>
                                    <select id="rating" class="form-select">
                                        <option value="5">⭐⭐⭐⭐⭐ - Rất hài lòng</option>
                                        <option value="4">⭐⭐⭐⭐ - Hài lòng</option>
                                        <option value="3">⭐⭐⭐ - Tạm ổn</option>
                                        <option value="2">⭐⭐ - Kém</option>
                                        <option value="1">⭐ - Tệ</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="comment" class="form-label">Nhận xét:</label>
                                    <textarea id="comment" rows="4" class="form-control"
                                        placeholder="Nhập nhận xét..."></textarea>
                                </div>

                                <button class="btn btn-primary" onclick="submitReview()">Gửi đánh giá</button>
                            </div>
                        </div>
                    </section>
                </main>

                <footer id="footer" class="footer dark-background text-center py-3">
                    <div class="container">
                        © 2025 GoBread
                    </div>
                </footer>

                <script src="/assets_client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="validateReview.js"></script>
            </body>

            </html>