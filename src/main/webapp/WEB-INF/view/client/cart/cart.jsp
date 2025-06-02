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
                                        <c:forEach var="cartDetail" items="${cartDetails}" varStatus="loop">
                                            <tr data-price="${cartDetail.product.price}"
                                                data-quantity="${cartDetail.quantity}">
                                                <td>${loop.index + 1}</td>
                                                <td>${cartDetail.product.name}</td>
                                                <td>
                                                    <img src="/images/product/${cartDetail.product.imageUrl}" alt=""
                                                        class="img-fluid rounded-circle"
                                                        style="width: 80px; height: 80px;">
                                                </td>
                                                <td>${cartDetail.product.price}₫</td>
                                                <td>
                                                    <div class="d-flex justify-content-center align-items-center"
                                                        style="height: 100%;">
                                                        <button class="btn btn-sm btn-outline-secondary me-2"
                                                            onclick="updateQuantity(this, -1)">-</button>
                                                        <span class="quantity px-2">${cartDetail.quantity}</span>
                                                        <button class="btn btn-sm btn-outline-secondary ms-2"
                                                            onclick="updateQuantity(this, 1)">+</button>
                                                    </div>
                                                </td>

                                                <td class="subtotal">
                                                    ${cartDetail.product.price * cartDetail.quantity}₫
                                                </td>
                                                <td>
                                                    <button class="btn btn-sm btn-danger"
                                                        onclick="removeRow(this)">Xóa</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="text-end mt-4">
                                <h4>Tổng cộng: <span id="total-price" class="text-danger fw-bold">${totalPrice}đ</span>
                                </h4>
                                <button class="btn btn-success" onclick="placeOrder()">🧾 Đặt hàng</button>
                            </div>
                        </div>
                    </section>
                </main>

                <!-- JS -->
                <script src="/assets_client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="/assets_client/js/main.js"></script>
                <script>
                    function formatCurrency(num) {
                        return num.toLocaleString('vi-VN') + '₫';
                    }

                    function updateTotal() {
                        let total = 0;
                        document.querySelectorAll('#cart-body tr').forEach(row => {
                            const price = parseInt(row.dataset.price);
                            const quantity = parseInt(row.dataset.quantity);
                            const subtotal = price * quantity;

                            row.querySelector('.subtotal').textContent = formatCurrency(subtotal);
                            row.querySelector('.quantity').textContent = quantity;
                            total += subtotal;
                        });
                        document.getElementById('total-price').textContent = formatCurrency(total);
                    }

                    function updateQuantity(button, delta) {
                        const row = button.closest('tr');
                        let quantity = parseInt(row.dataset.quantity) || 1;
                        quantity = Math.max(1, quantity + delta); // Không cho nhỏ hơn 1
                        row.dataset.quantity = quantity;
                        updateTotal();
                    }

                    function removeRow(button) {
                        button.closest('tr').remove();
                        updateTotal();
                    }

                    function placeOrder() {
                        alert("Tính năng đặt hàng đang phát triển!");
                        // TODO: Gửi dữ liệu lên server để xử lý đơn hàng
                    }

                    document.addEventListener("DOMContentLoaded", updateTotal);
                </script>

            </body>

            </html>