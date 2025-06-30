<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <title>GoBread</title>
                <meta name="description" content="">
                <meta name="keywords" content="">

                <!-- Favicons -->
                <link href="/assets/img/breadlogo.png" rel="icon">
                <link href="/assets/img/apple-touch-icon.jpg" rel="apple-touch-icon">

                <!-- Fonts -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link href="https://fonts.googleapis.com" rel="preconnect">
                <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap"
                    rel="stylesheet">

                <!-- Vendor CSS Files -->
                <link href="/assets_client/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="/assets_client/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
                <link href="/assets_client/vendor/aos/aos.css" rel="stylesheet">
                <link href="/assets_client/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
                <link href="/assets_client/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

                <!-- Main CSS File -->
                <link href="/assets_client/css/main.css" rel="stylesheet">

            </head>

            <body class="index-page">

                <header id="header" class="header d-flex align-items-center sticky-top">
                    <div class="container position-relative d-flex align-items-center justify-content-between">

                        <a href="/user" class="logo d-flex align-items-center me-auto me-xl-0">
                            <img src="/assets/img/breadlogo.png" alt="">
                            <!-- Uncomment the line below if you also wish to use an image logo -->
                            <!-- <img src="assets/img/logo.png" alt=""> -->
                            <h1 class="sitename">GoBread</h1>

                        </a>

                        <nav id="navmenu" class="navmenu">
                            <ul>
                                <li><a href="#hero" class="active">Trang chủ<br></a></li>
                                <li><a href="#about">Thông tin về chúng tôi</a></li>
                                <li><a href="#menu">Danh sách </a></li>

                                <c:if test="${ empty pageContext.request.userPrincipal}">
                                    <li><a href="/signup">Đăng kí</a></li>
                                    <li> <a href="/login">Đăng nhập</a></li>
                                </c:if>
                                <c:if test="${not empty pageContext.request.userPrincipal}">

                                    </li>
                                    <a href="/cart">Giỏ hàng </a>
                                    </li>
                                    <li><a href="/chatbot" class="active">Hỏi đáp<br></a></li>
                                </c:if>
                            </ul>
                            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                        </nav>

                        <a class="btn-getstarted" href="<c:url value='/order' />">Đặt hàng</a>
                        <c:if test="${not empty pageContext.request.userPrincipal}">

                            <li class="nav-item dropdown pe-3">
                                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
                                    data-bs-toggle="dropdown">
                                    <img src="/assets/img/user1.png" alt="Profile" class="rounded-circle">
                                    <span class="d-none d-md-block dropdown-toggle ps-2">
                                        <c:out value="${sessionScope.fullName}" />

                                    </span>
                                </a><!-- End Profile Image Icon -->

                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">

                                    <li>
                                        <a class="dropdown-item d-flex align-items-center" href="/admin">
                                            <i class="bi bi-person"></i>
                                            <span>Hồ sơ của tôi</span>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li>
                                        <a class="dropdown-item d-flex align-items-center" href="/order-history">
                                            <i class="bi bi-bag-fill"></i>
                                            <span>Lịch sử mua hàng</span>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>

                                    <li>
                                        <a class="dropdown-item d-flex align-items-center" href="/admin">
                                            <i class="bi bi-gear"></i>
                                            <span>Cài đặt</span>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>



                                    <li>
                                        <form action="/logout" method="post">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button class="dropdown-item d-flex align-items-center">
                                                <i class="bi bi-box-arrow-right"></i>
                                                <span>Đăng xuất</span>
                                            </button>
                                        </form>
                                    </li>

                                </ul><!-- End Profile Dropdown Items -->
                            </li><!-- End Profile Nav -->
                        </c:if>

                    </div>
                </header>

                <main class="main">

                    <!-- Hero Section -->
                    <section id="hero" class="hero section light-background">

                        <div class="container">
                            <div class="row gy-4 justify-content-center justify-content-lg-between">
                                <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                                    <h1 data-aos="fade-up">Bùng nổ vị giác<br>Thức ăn tuyệt ngon</h1>
                                    <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
                                    </div>
                                </div>
                                <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
                                    <img src="/assets_client/img/hero-img.jpg" class="img-fluid animated" alt="">
                                </div>
                            </div>
                        </div>

                    </section><!-- /Hero Section -->

                    <!-- About Section -->
                    <section id="about" class="about section">

                        <!-- Section Title -->
                        <div class="container section-title" data-aos="fade-up">
                            <h2>Thông tin về chúng tôi<br></h2>
                            <p><span>Hiểu thêm</span> <span class="description-title">về chúng tôi</span></p>
                        </div><!-- End Section Title -->

                        <div class="container">

                            <div class="row gy-4">
                                <div class="col-lg-7" data-aos="fade-up" data-aos-delay="100">
                                    <img src="/assets_client/img/about.jpg" class="img-fluid mb-4" alt="">
                                    <div class="book-a-table">
                                        <p>+84 342437211</p>
                                    </div>
                                </div>
                                <div class="col-lg-5" data-aos="fade-up" data-aos-delay="250">
                                    <div class="content ps-0 ps-lg-5">
                                        <p class="fst-italic">
                                            Tại GoBread, chúng tôi cam kết mang đến những chiếc bánh mì tươi ngon, chất
                                            lượng nhất
                                            cho khách hàng.
                                            Nguyên liệu được chọn lọc kỹ càng, bánh mì luôn nóng giòn và nhân đầy đủ
                                            dinh dưỡng.
                                        </p>
                                        <ul>
                                            <li><i class="bi bi-check-circle-fill"></i> <span>Bánh mì giòn rụm, nhân đậm
                                                    đà, phù hợp
                                                    khẩu vị mọi người..</span></li>
                                            <li><i class="bi bi-check-circle-fill"></i> <span>Nguyên liệu tươi sạch, chế
                                                    biến ngay
                                                    trong ngày.</span></li>
                                            <li><i class="bi bi-check-circle-fill"></i> <span>Đa dạng hương vị từ truyền
                                                    thống đến
                                                    sáng tạo, phù hợp với mọi sở thích.</span></li>
                                        </ul>
                                        <p>
                                            Chúng tôi không ngừng cải tiến để mang đến trải nghiệm ẩm thực tuyệt vời
                                            nhất.
                                            Hãy ghé GoBread để thưởng thức ngay hôm nay!
                                        </p>

                                        <div class="position-relative mt-4">
                                            <img src="/assets_client/img/about-2.jpg" class="img-fluid" alt="">
                                            <a href="https://www.youtube.com/watch?v=Y7f98aduVJ8"
                                                class="glightbox pulsating-play-btn"></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </section><!-- /About Section -->

                    <!-- Why Us Section -->
                    <section id="why-us" class="why-us section light-background">

                        <div class="container">

                            <div class="row gy-4">

                                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                                    <div class="why-box">
                                        <h3>Tại sao nên chọn bánh mì GoBread</h3>
                                        <p>
                                            GoBread mang đến trải nghiệm ẩm thực tuyệt vời với bánh mì tươi ngon, nóng
                                            giòn mỗi
                                            ngày.
                                            Công thức độc quyền giúp hương vị đậm đà, hấp dẫn. Nguyên liệu sạch, dinh
                                            dưỡng cân
                                            bằng, đảm bảo an toàn cho sức khỏe.
                                            Đặc biệt, dịch vụ nhanh chóng, tiện lợi, giúp bạn có bữa ăn ngon mà không
                                            tốn thời gian.
                                            👉 Thử ngay GoBread để cảm nhận sự khác biệt!
                                        </p>
                                        <div class="text-center">
                                            <a href="#" class="more-btn"><span>Learn More</span> <i
                                                    class="bi bi-chevron-right"></i></a>
                                        </div>
                                    </div>
                                </div><!-- End Why Box -->

                                <div class="col-lg-8 d-flex align-items-stretch">
                                    <div class="row gy-4" data-aos="fade-up" data-aos-delay="200">

                                        <div class="col-xl-4">
                                            <div
                                                class="icon-box d-flex flex-column justify-content-center align-items-center">
                                                <i class="bi bi-clipboard-data"></i>
                                                <h4> 1️⃣ Nguyên liệu tươi sạch</h4>
                                                <p>Sử dụng nguyên liệu chất lượng cao, đảm bảo vệ sinh và an toàn thực
                                                    phẩm.</p>
                                            </div>
                                        </div><!-- End Icon Box -->

                                        <div class="col-xl-4" data-aos="fade-up" data-aos-delay="300">
                                            <div
                                                class="icon-box d-flex flex-column justify-content-center align-items-center">
                                                <i class="bi bi-gem"></i>
                                                <h4> 2️⃣ Hương vị độc quyền</h4>
                                                <p>Công thức chế biến đặc biệt, kết hợp gia vị tinh tế, tạo nên hương vị
                                                    khó quên.
                                                </p>
                                            </div>
                                        </div><!-- End Icon Box -->

                                        <div class="col-xl-4" data-aos="fade-up" data-aos-delay="400">
                                            <div
                                                class="icon-box d-flex flex-column justify-content-center align-items-center">
                                                <i class="bi bi-inboxes"></i>
                                                <h4> 3️⃣ Dịch vụ nhanh chóng</h4>
                                                <p>Phục vụ nhanh, tiện lợi, giúp bạn tiết kiệm thời gian mà vẫn có bữa
                                                    ăn ngon.</p>
                                            </div>
                                        </div><!-- End Icon Box -->

                                    </div>
                                </div>

                            </div>

                        </div>

                    </section><!-- /Why Us Section -->

                    <!-- Stats Section -->
                    <section id="stats" class="stats section dark-background">

                        <img src="assets/img/stats-bg.jpg" alt="" data-aos="fade-in">

                        <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">

                            <div class="row gy-4">

                                <div class="col-lg-3 col-md-6">
                                    <div class="stats-item text-center w-100 h-100">
                                        <span data-purecounter-start="0" data-purecounter-end="${userCount}"
                                            data-purecounter-duration="1" class="purecounter">
                                        </span>

                                        <p>Khách hàng</p>
                                    </div>
                                </div><!-- End Stats Item -->

                                <div class="col-lg-3 col-md-6">
                                    <div class="stats-item text-center w-100 h-100">
                                        <span data-purecounter-start="0" data-purecounter-end="${productCount}"
                                            data-purecounter-duration="1" class="purecounter">
                                        </span>

                                        <p>Sản Phẩm</p>
                                    </div>
                                </div><!-- End Stats Item -->

                            </div>

                        </div>

                    </section><!-- /Stats Section -->

                    <!-- Menu Section -->
                    <section id="menu" class="menu section">

                        <!-- Section Title -->
                        <div class="container section-title" data-aos="fade-up">
                            <h2>Thực đơn của chúng tôi</h2>
                            <p><span></span><span class="description-title">Thực đơn của GoBread</span></p>
                        </div><!-- End Section Title -->

                        <div class="container">

                            <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up"
                                data-aos-delay="100">


                                </li>


                            </ul>

                            <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

                                <div class="tab-pane fade active show" id="menu-starters">

                                    <div class="tab-header text-center">
                                        <p>Menu</p>
                                        <h3>Starters</h3>
                                    </div>

                                    <div class="row gy-5">
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-lg-4 menu-item justify-content-center">
                                                <!-- Link đến trang chi tiết -->
                                                <a href="/user/product/${product.productID}">
                                                    <img src="/resources/images/product/${product.imageUrl}"
                                                        class="menu-img img-fluid" alt="${product.name}">
                                                </a>

                                                <!-- Nút xem ảnh lớn (lightbox) -->
                                                <a href="/resources/images/product/${product.imageUrl}"
                                                    class="glightbox preview-link" title="${product.name}">
                                                    <i class="bi bi-zoom-in"></i>
                                                </a>

                                                <h4>${product.name}</h4>
                                                <p class="price">${product.price} VNĐ</p>

                                                <form action="/add-product-to-cart/${product.productID}" method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button class="mx-auto btn border border-secondary rounded">
                                                        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                                    </button>
                                                </form>
                                            </div>
                                        </c:forEach>
                                    </div>



                                </div>

                            </div>

                    </section><!-- /Menu Section -->

                    <!-- Testimonials Section -->
                    <section id="testimonials" class="testimonials section light-background">

                        <!-- Section Title -->
                        <div class="container section-title" data-aos="fade-up">
                            <h2>BÌNH LUẬN</h2>
                            <p>Các Đánh Giá Về<span class="description-title">GoBread</span></p>
                        </div><!-- End Section Title -->

                        <div class="container" data-aos="fade-up" data-aos-delay="100">

                            <div class="swiper init-swiper">
                                <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              }
            }
          </script>
                                <div class="swiper-wrapper">

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="row gy-4 justify-content-center">
                                                <div class="col-lg-6">
                                                    <div class="testimonial-content">
                                                        <p>
                                                            <i class="bi bi-quote quote-icon-left"></i>
                                                            <span>"Bánh mì ở GoBread thật sự đỉnh! Vỏ giòn, nhân đầy
                                                                đặn, đặc biệt
                                                                là sốt siêu ngon.
                                                                Mình mê nhất bánh mì bò sốt trứng lòng đào, béo ngậy khó
                                                                cưỡng!"</span>
                                                            <i class="bi bi-quote quote-icon-right"></i>
                                                        </p>
                                                        <h3>Lan</h3>
                                                        <h4>Sinh viên &amp; 21 tuổi</h4>
                                                        <div class="stars">
                                                            <i class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 text-center">
                                                    <img src="assets/img/testimonials/testimonials-1.jpg"
                                                        class="img-fluid testimonial-img" alt="">
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="row gy-4 justify-content-center">
                                                <div class="col-lg-6">
                                                    <div class="testimonial-content">
                                                        <p>
                                                            <i class="bi bi-quote quote-icon-left"></i>
                                                            <span>"GoBread đúng chuẩn bánh mì cho dân công sở! Nhanh,
                                                                gọn, ngon mà
                                                                vẫn đầy đủ dinh dưỡng.
                                                                Bánh mì gà BBQ sốt mật ong là chân ái của mình, vừa thơm
                                                                vừa đậm
                                                                vị."</span>
                                                            <i class="bi bi-quote quote-icon-right"></i>
                                                        </p>
                                                        <h3>Hùng</h3>
                                                        <h4>Dân văn phòng</h4>
                                                        <div class="stars">
                                                            <i class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 text-center">
                                                    <img src="assets/img/testimonials/testimonials-2.jpg"
                                                        class="img-fluid testimonial-img" alt="">
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="row gy-4 justify-content-center">
                                                <div class="col-lg-6">
                                                    <div class="testimonial-content">
                                                        <p>
                                                            <i class="bi bi-quote quote-icon-left"></i>
                                                            <span>"Bánh mì xịn xò nhất từng ăn! Không chỉ ngon mà còn
                                                                đẹp mắt nữa,
                                                                chụp hình sống ảo siêu chất.
                                                                Combo Bánh Mì Chảo Phô Mai + Trà Đào Cam Sả là
                                                                best!"</span>
                                                            <i class="bi bi-quote quote-icon-right"></i>
                                                        </p>
                                                        <h3>Minh</h3>
                                                        <h4>GenZ, 18 tuổi</h4>
                                                        <div class="stars">
                                                            <i class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 text-center">
                                                    <img src="assets/img/testimonials/testimonials-3.jpg"
                                                        class="img-fluid testimonial-img" alt="">
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                    <div class="swiper-slide">
                                        <div class="testimonial-item">
                                            <div class="row gy-4 justify-content-center">
                                                <div class="col-lg-6">
                                                    <div class="testimonial-content">
                                                        <p>
                                                            <i class="bi bi-quote quote-icon-left"></i>
                                                            <span>"Bánh mì ở đây ngon và chất lượng, vị đậm đà, nguyên
                                                                liệu tươi
                                                                ngon. Mình và gia đình đều thíchnhất bánh mì heo quay
                                                                giòn rụm, lớp
                                                                da giòn tan, ăn một lần là nhớ mãi!"</span>
                                                            <i class="bi bi-quote quote-icon-right"></i>
                                                        </p>
                                                        <h3>Cô Mai</h3>
                                                        <h4>Nội trợ</h4>
                                                        <div class="stars">
                                                            <i class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i><i
                                                                class="bi bi-star-fill"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2 text-center">
                                                    <img src="assets/img/testimonials/testimonials-4.jpg"
                                                        class="img-fluid testimonial-img" alt="">
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- End testimonial item -->

                                </div>
                                <div class="swiper-pagination"></div>
                            </div>

                        </div>

                    </section><!-- /Testimonials Section -->

                    <!-- Events Section -->
                    <section id="events" class="events section">

                        <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

                            <div class="swiper init-swiper">
                                <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 40
                },
                "1200": {
                  "slidesPerView": 3,
                  "spaceBetween": 1
                }
              }
            }
          </script>
                                <div class="swiper-wrapper">

                                    <div class="swiper-slide event-item d-flex flex-column justify-content-end"
                                        style="background-image: url(assets/img/event-1.webp)">
                                        <h3>1️⃣Mua 1 Tặng 1 – Nhân Đôi Vị Ngon!</h3>
                                        <p class="description">
                                            "Mua một ổ bánh mì bất kỳ, nhận ngay một ổ miễn phí! Thưởng thức vị ngon
                                            nhân đôi!"
                                        </p>
                                    </div><!-- End Event item -->

                                    <div class="swiper-slide event-item d-flex flex-column justify-content-end"
                                        style="background-image: url(assets/img/event-2.webp)">
                                        <h3>2️⃣Giảm 20% Cho Đơn Đầu Tiên</h3>
                                        <p class="description">
                                            "Đặt hàng lần đầu tiên? Giảm ngay 20%! Trải nghiệm bánh mì chất lượng với
                                            giá siêu hời!"
                                        </p>
                                    </div><!-- End Event item -->

                                    <div class="swiper-slide event-item d-flex flex-column justify-content-end"
                                        style="background-image: url(assets/img/event-3.webp)">
                                        <h3>3️⃣Combo Siêu Tiết Kiệm – Ăn Ngon Giá Hời!</h3>
                                        <p class="description">
                                            "Chọn combo tiết kiệm – bánh mì ngon kèm nước mát lạnh, giá chỉ từ 69K!"
                                        </p>
                                    </div><!-- End Event item -->

                                    <div class="swiper-slide event-item d-flex flex-column justify-content-end"
                                        style="background-image: url(assets/img/event-4.webp)">
                                        <h3> 4️⃣Freeship Cho Đơn Từ 100K!!</h3>
                                        <p class="description">
                                            "Đặt đơn từ 100K, freeship tận nơi! Ngồi nhà thưởng thức, không lo phí
                                            ship!"
                                        </p>
                                    </div><!-- End Event item -->

                                </div>
                                <div class="swiper-pagination"></div>
                            </div>

                        </div>

                    </section><!-- /Events Section -->

                    <!-- Chefs Section -->
                    <section id="chefs" class="chefs section">



                        <!-- Gallery Section -->
                        <section id="gallery" class="gallery section light-background">

                            <!-- Section Title -->
                            <div class="container section-title" data-aos="fade-up">
                                <h2>Gallery</h2>
                                <p><span>Check</span> <span class="description-title">Our Gallery</span></p>
                            </div><!-- End Section Title -->

                            <div class="container" data-aos="fade-up" data-aos-delay="100">

                                <div class="swiper init-swiper">
                                    <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "centeredSlides": true,
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 0
                },
                "768": {
                  "slidesPerView": 3,
                  "spaceBetween": 20
                },
                "1200": {
                  "slidesPerView": 5,
                  "spaceBetween": 20
                }
              }
            }
          </script>
                                    <div class="swiper-wrapper align-items-center">
                                        <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery"
                                                href="assets/img/gallery/gallery-1.jpg"><img
                                                    src="assets/img/gallery/gallery-1.jpg" class="img-fluid" alt=""></a>
                                        </div>
                                        <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery"
                                                href="assets/img/gallery/gallery-2.jpg"><img
                                                    src="assets/img/gallery/gallery-2.jpg" class="img-fluid" alt=""></a>
                                        </div>
                                        <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery"
                                                href="assets/img/gallery/gallery-3.jpg"><img
                                                    src="assets/img/gallery/gallery-3.jpg" class="img-fluid" alt=""></a>
                                        </div>
                                        <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery"
                                                href="assets/img/gallery/gallery-4.jpg"><img
                                                    src="assets/img/gallery/gallery-4.jpg" class="img-fluid" alt=""></a>
                                        </div>
                                        <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery"
                                                href="assets/img/gallery/gallery-5.jpg"><img
                                                    src="assets/img/gallery/gallery-5.jpg" class="img-fluid" alt=""></a>
                                        </div>
                                        <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery"
                                                href="assets/img/gallery/gallery-6.jpg"><img
                                                    src="assets/img/gallery/gallery-6.jpg" class="img-fluid" alt=""></a>
                                        </div>
                                        <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery"
                                                href="assets/img/gallery/gallery-7.jpg"><img
                                                    src="assets/img/gallery/gallery-7.jpg" class="img-fluid" alt=""></a>
                                        </div>
                                        <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery"
                                                href="assets/img/gallery/gallery-8.jpg"><img
                                                    src="assets/img/gallery/gallery-8.jpg" class="img-fluid" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="swiper-pagination"></div>
                                </div>

                            </div>

                        </section><!-- /Gallery Section -->

                        <!-- Contact Section -->
                        <section id="contact" class="contact section">

                            <!-- Section Title -->
                            <!-- <div class="container section-title" data-aos="fade-up">
                            <h2>Liên Hệ</h2>
                            <p><span>Bạn Cần Giúp Đỡ</span> <span class="description-title">Hãy Liên Lạc Chúng
                                    Tôi</span></p>
                        </div>End Section Title -->

                            <!-- <div class="container" data-aos="fade-up" data-aos-delay="100">

                            <div class="mb-5">
                                <iframe
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.123456789012!2d105.1234567890123!3d21.1234567890123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abcdef12345%3A0xabcdef123456789!2sGoBread!5e0!3m2!1sen!2s!4v1710000000000"
                                    width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy">
                                </iframe>
                            </div><!-- End Google Maps -->

                            <div class="row gy-4">

                                <div class="col-md-6">
                                    <div class="info-item d-flex align-items-center" data-aos="fade-up"
                                        data-aos-delay="200">
                                        <i class="icon bi bi-geo-alt flex-shrink-0"></i>
                                        <div>
                                            <h3>Địa Chỉ</h3>
                                            <p>100, Nguyên Xá, Bắc Từ Liêm, Hà Nội</p>
                                        </div>
                                    </div>
                                </div><!-- End Info Item -->

                                <div class="col-md-6">
                                    <div class="info-item d-flex align-items-center" data-aos="fade-up"
                                        data-aos-delay="300">
                                        <i class="icon bi bi-telephone flex-shrink-0"></i>
                                        <div>
                                            <h3>Liên hệ với chúng tôi</h3>
                                            <p>+0342437211</p>
                                        </div>
                                    </div>
                                </div><!-- End Info Item -->

                                <div class="col-md-6">
                                    <div class="info-item d-flex align-items-center" data-aos="fade-up"
                                        data-aos-delay="400">
                                        <i class="icon bi bi-envelope flex-shrink-0"></i>
                                        <div>
                                            <h3>Email: </h3>
                                            <p>Duongtungvu2004@gmail.com</p>
                                        </div>
                                    </div>
                                </div><!-- End Info Item -->

                                <div class="col-md-6">
                                    <div class="info-item d-flex align-items-center" data-aos="fade-up"
                                        data-aos-delay="500">
                                        <i class="icon bi bi-clock flex-shrink-0"></i>
                                        <div>
                                            <h3>Giờ mở cửa:<br></h3>
                                            <p><strong>Thứ Hai - Chủ nhật:</strong> 11AM - 23PM </p>
                                        </div>
                                    </div>
                                </div><!-- End Info Item -->

                            </div>



                </main>

                <footer id="footer" class="footer dark-background">

                    <div class="container">
                        <div class="row gy-3">
                            <div class="col-lg-3 col-md-6 d-flex">
                                <i class="bi bi-geo-alt icon"></i>
                                <div class="address">
                                    <h4>Địa Chỉ</h4>
                                    <p>100, Nguyên Xá</p>
                                    <p>Bắc Từ Liêm, Hà Nội</p>
                                    <p></p>
                                </div>

                            </div>

                            <div class="col-lg-3 col-md-6 d-flex">
                                <i class="bi bi-telephone icon"></i>
                                <div>
                                    <h4>Liên Hệ</h4>
                                    <p>
                                        <strong>Số điện thoại:</strong> <span>+84 342437211</span><br>
                                        <strong>Email:</strong> <span>Duongtungvu2004@gmail.com</span><br>
                                    </p>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6 d-flex">
                                <i class="bi bi-clock icon"></i>
                                <div>
                                    <h4>Thời gian mở cửa: </h4>
                                    <p>
                                        <strong>Thứ Hai-Chủ Nhật:</strong> <span>8AM - 23PM</span><br>
                                    </p>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <h4>Theo dõi chúng tôi:</h4>
                                <div class="social-links d-flex">
                                    <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
                                    <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                                    <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                                    <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="container copyright text-center mt-4">
                        <p>© <span>Copyright</span> <strong class="px-1 sitename">GoBread</strong> <span>All Rights
                                Reserved</span>
                        </p>
                        <div class="credits">
                            <!-- All the links in the footer should remain intact. -->
                            <!-- You can delete the links only if you've purchased the pro version. -->
                            <!-- Licensing information: https://bootstrapmade.com/license/ -->
                            <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
                            Thiết kế bởi: <a href="https://bootstrapmade.com/">Dương Đẹp Trai</a>
                        </div>
                    </div>

                </footer>

                <!-- Scroll Top -->
                <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
                        class="bi bi-arrow-up-short"></i></a>

                <!-- Preloader -->
                <div id="preloader"></div>

                <!-- Vendor JS Files -->
                <script src="/assets_client/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="/assets_client/vendor/php-email-form/validate.js"></script>
                <script src="/assets_client/vendor/aos/aos.js"></script>
                <script src="/assets_client/vendor/glightbox/js/glightbox.min.js"></script>
                <script src="/assets_client/vendor/purecounter/purecounter_vanilla.js"></script>
                <script src="/assets_client/vendor/swiper/swiper-bundle.min.js"></script>

                <!-- Main JS File -->
                <script src="/assets_client/js/main.js"></script>

            </body>

            </html>