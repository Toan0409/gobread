<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <title>Giỏ hàng | GoBread</title>

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

                <!-- Header giữ nguyên -->
                <header id="header" class="header d-flex align-items-center sticky-top">
                    <div class="container d-flex justify-content-between align-items-center">
                        <a href="index.html" class="logo">
                            <h1 class="sitename">GoBread</h1><span>.</span>
                        </a>
                        <nav id="navmenu" class="navmenu">
                            <ul>
                                <li><a href="/user">Trang chủ</a></li>
                                <li><a href="index.html#menu">Menu</a></li>
                                <li><a href="index.html#order-online">Đặt hàng</a></li>
                            </ul>
                            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                        </nav>
                    </div>
                </header>

                <main class="main">
                    <section class="section py-5">
                        <div class="container">
                            <h2 class="text-center mb-4">🛒 Giỏ hàng của bạn</h2>
                            <div class="table-responsive">
                                <table class="table table-hover align-middle text-center">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>STT</th>
                                            <th>Sản phẩm</th>
                                            <th>Ảnh</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Tổng</th>
                                            <th>Hành động</th>
                                        </tr>
                                    </thead>
                                    <tbody id="cart-body">
                                        <!-- JavaScript sẽ thêm hàng động -->
                                    </tbody>
                                </table>
                            </div>
                            <div class="text-end mt-4">
                                <h4>Tổng cộng: <span id="total-price" class="text-danger fw-bold">0₫</span></h4>
                                <button class="btn btn-success" onclick="placeOrder()">🧾 Đặt hàng</button>
                            </div>
                        </div>
                    </section>
                </main>

                <!-- Footer -->
                <footer id="footer" class="footer dark-background">
                    <div class="container text-center py-3">
                        <p>© GoBread 2025. Thiết kế bởi <a href="#">gobread</a></p>
                    </div>
                </footer>

                <!-- JS -->
                <script src="/assets_client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="/assets_client/js/main.js"></script>
                <script src="/assets_client/js/validateCart.js"></script>
                <script src="/assets_client/js/validateCart.js"></script>
            </body>

            </html>