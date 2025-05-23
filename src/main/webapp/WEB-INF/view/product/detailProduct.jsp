<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User Detail ${id}</title>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                    rel="stylesheet" />
                <!-- <link rel="stylesheet" href="/css/demo.css"> -->
            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <hr>
                            <div class="d-flex justify-content-between ">
                                <h1>User Details with ID = ${productID}</h1>

                            </div>
                            <hr />

                            <div class="card" style="width: 60%;">
                                <div class="card-header">
                                    Product Information
                                </div>
                                <ul class="list-group list-group-flush">
                                    <div class="card" style="width: 60%;">
                                        <img src="/images/product/${product.imageUrl}" alt="card image cap">
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