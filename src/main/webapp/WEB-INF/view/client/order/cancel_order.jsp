<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8">
                <title>Hủy đơn hàng | GoBread</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link href="/assets_client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="/assets_client/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                <link href="/assets_client/css/main.css" rel="stylesheet">
            </head>

            <body>

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

                <main class="main">
                    <section class="section py-5">
                        <div class="container">
                            <h2 class="text-center mb-4">❌ Hủy đơn hàng</h2>
                            <table class="table table-bordered text-center align-middle">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Mã đơn</th>
                                        <th>Ngày đặt</th>
                                        <th>Trạng thái</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody id="order-list">
                                    <!-- JavaScript sẽ load dữ liệu -->
                                </tbody>
                            </table>
                        </div>
                    </section>
                </main>

                <footer id="footer" class="footer dark-background text-center py-3">
                    <div class="container">© 2025 GoBread</div>
                </footer>

                <script src="/assets_client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="/assets_client/js/validateCancel.js"></script>
            </body>

            </html>