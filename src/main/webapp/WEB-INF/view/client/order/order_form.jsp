<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Order Form</title>
                <!-- Bootstrap CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- MDB CSS -->
                <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.css" rel="stylesheet">
                <!-- Your custom CSS -->
                <link href="<c:url value='/resources/css/order-form.css'/>" rel="stylesheet" type="text/css">
                <link href="/assets_client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="/assets_client/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                <link href="/assets_client/css/main.css" rel="stylesheet">
                <link href="/assets_client/css/order-form.css" rel="stylesheet">

            </head>

            <body>
                <section class="order-form m-4">
                    <div class="container pt-4">
                        <div class="row">
                            <div class="col-12 px-4">
                                <h1>Form Order </h1>
                                
                                <hr class="mt-1" />
                            </div>

                            <div class="col-12">
                                <form id="orderForm">
                                    <!-- Name Fields -->
                                    <div class="row mx-4">
                                        <div class="col-12">
                                            <label class="order-form-label">Name</label>
                                        </div>
                                        <div class="mb-3">
                                            <label for="firstName" class="form-label">First Name</label>
                                            <input type="text" class="form-control" id="firstName" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="firstName" class="form-label">Last Name</label>
                                            <input type="text" class="form-control" id="firstName" required>
                                        </div>

                                        <div class="row mt-3 mx-4">
                                            <div class="col-12">
                                                <label class="order-form-label">Adress</label>
                                            </div>
                                            <div class="col-12">
                                                <div data-mdb-input-init class="form-outline">
                                                    <input type="text" id="form5"
                                                        class="form-control order-form-input" />
                                                    <label class="form-label" for="form5">Street Address</label>
                                                </div>
                                            </div>
                                            <div class="col-12 mt-2">
                                                <div data-mdb-input-init class="form-outline">
                                                    <input type="text" id="form6"
                                                        class="form-control order-form-input" />
                                                    <label class="form-label" for="form6">Street Address Line 2</label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-2 pe-sm-2">
                                                <div data-mdb-input-init class="form-outline">
                                                    <input type="text" id="form7"
                                                        class="form-control order-form-input" />
                                                    <label class="form-label" for="form7">City</label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 mt-2 ps-sm-0">
                                                <div data-mdb-input-init class="form-outline">
                                                    <input type="text" id="form10"
                                                        class="form-control order-form-input" />
                                                    <label class="form-label" for="form10">Country</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-3 mx-4">
                                            <div class="col-12">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value=""
                                                        id="flexCheckDefault" />
                                                    <label class="form-check-label" for="flexCheckDefault">I know what I
                                                        need to know</label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-12">
                                                <button type="submit" data-mdb-button-init id="btnSubmit"
                                                    data-mdb-ripple-init
                                                    class="btn btn-primary d-block mx-auto btn-submit">Submit</button>
                                            </div>
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Add JavaScript dependencies -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.1.0/mdb.min.js"></script>
            </body>

            </html>