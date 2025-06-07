<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Thanh toán thất bại</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }

            .failed-icon {
                font-size: 80px;
                color: #dc3545;
            }
        </style>
    </head>

    <body>

        <div class="container text-center mt-5">
            <div class="card shadow-sm p-4 mx-auto" style="max-width: 500px;">
                <div class="card-body">
                    <div class="failed-icon mb-3">
                        <i class="bi bi-x-circle-fill"></i>
                    </div>
                    <h2 class="text-danger">Thanh toán thất bại</h2>
                    <p class="mt-3">Rất tiếc, giao dịch của bạn không thể hoàn tất.</p>
                    <p>Vui lòng kiểm tra lại phương thức thanh toán hoặc thử lại sau.</p>
                    <div class="d-grid gap-2 mt-4">
                        <a href="/checkout" class="btn btn-danger">Thử lại</a>
                        <a href="/" class="btn btn-outline-secondary">Quay về trang chủ</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </body>

    </html>