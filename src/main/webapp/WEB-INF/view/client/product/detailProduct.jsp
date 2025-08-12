<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <title>Chi tiết sản phẩm</title>
                    <!-- Google Fonts -->
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                        rel="stylesheet" />
                    <link href="https://fonts.gstatic.com" rel="preconnect">
                    <link
                        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
                        rel="stylesheet">

                    <!-- Vendor CSS Files -->
                    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                    <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
                    <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
                    <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
                    <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
                    <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

                    <link href="/assets/css/style.css" rel="stylesheet">
                </head>

                <body class="bg-light">
                    <!-- <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" /> -->
                    <div class="container py-5">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="card shadow-lg rounded-4">
                                    <div class="row g-0">
                                        <!-- Hình ảnh -->
                                        <div class="col-md-5">
                                            <img src="${pageContext.request.contextPath}/resources/images/product/${product.imageUrl}"
                                                alt="Ảnh sản phẩm" style="width: 350px; height: auto;" />
                                        </div>

                                        <!-- Thông tin sản phẩm -->
                                        <div class="col-md-7">
                                            <div class="card-body">
                                                <h2 class="card-title mb-3">${product.name}</h2>
                                                <p class="text-muted">Mã sản phẩm: ${product.productID}</p>
                                                <p class="card-text">Mô tả: ${product.description}</p>

                                                <h4 class="text-danger fw-bold mt-4">Giá: ${product.price} ₫</h4>
                                                <p class="text-success mt-2">Số lượng còn: ${product.quantity}</p>

                                                <!-- Nút hành động -->
                                                <div class="d-grid gap-2 mt-4">
                                                    <form action="/add-product-to-cart/${product.productID}"
                                                        method="post">
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button class="mx-auto btn border border-secondary rounded">
                                                            <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                                                            cart
                                                        </button>
                                                    </form>

                                                    <form action="/buy-now" method="post">
                                                        <input type="hidden" name="productID"
                                                            value="${product.productID}">
                                                        <button type="submit" class="btn btn-danger btn-lg">⚡ Mua
                                                            ngay</button>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div> <!-- end row -->
                                </div> <!-- end card -->
                            </div>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>