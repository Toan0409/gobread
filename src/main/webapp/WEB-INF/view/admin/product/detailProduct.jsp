<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="vi">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Chi tiết sản phẩm ${productID}</title>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

            <link href="/assets/img/breadlogo.png" rel="icon">
            <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

            <!-- Google Fonts -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
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

            <!-- Template Main CSS File -->
            <link href="/assets/css/style.css" rel="stylesheet">
        </head>

        <body>

            <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />


            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 mx-auto">
                        <hr />
                        <div class="d-flex justify-content-between">
                            <h1>Chi tiết sản phẩm = ${productID}</h1>
                        </div>
                        <hr />

                        <div class="card" style="width: 60%;">
                            <div class="card-header">
                                Thông tin sản phẩm
                            </div>
                            <ul class="list-group list-group-flush">
                                <div class="card" style="width: auto;">
                                    <img src="${pageContext.request.contextPath}/resources/images/product/${product.imageUrl}"
                                        alt="Ảnh sản phẩm" style="width: 300px;" />
                                </div>
                                <li class="list-group-item">ID: ${productID}</li>
                                <li class="list-group-item">Tên sản phẩm: ${product.name}</li>
                                <li class="list-group-item">Mô tả: ${product.description}</li>
                                <li class="list-group-item">Giá: ${product.price}</li>
                                <li class="list-group-item">Số lượng tồn: ${product.quantity}</li>
                            </ul>

                            <div class="card-body">
                                <a href="javascript:history.back()" class="btn btn-secondary">
                                    <i class="fa fa-arrow-left"></i> Trở lại
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </body>

        </html>