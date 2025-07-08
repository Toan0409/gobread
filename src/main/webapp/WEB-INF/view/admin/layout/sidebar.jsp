<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link " href="/admin">
                        <i class="bi bi-grid"></i>
                        <span>Doanh thu & Lợi nhuận</span>
                    </a>
                </li><!-- End Dashboard Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-menu-button-wide"></i><span>Quản lý</span><i
                            class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="/admin/order">
                                <i class="bi bi-cart"></i><span>Quản lý đơn hàng</span>
                            </a>
                        </li>
                        <li>
                            <a href="/admin/user">
                                <i class="bi bi-person"></i><span>Quản lý khách hàng</span>
                            </a>
                        </li>
                        <li>
                            <a href="/admin/product">
                                <i class="bi bi-bag"></i><span>Quản lý sản phẩm & tồn kho</span>
                            </a>
                        </li>

                    </ul>
                </li><!-- End Components Nav -->




                <li class="nav-heading">Pages</li>

                <li class="nav-item">
                    <a class="nav-link collapsed" href="/admin">
                        <i class="bi bi-person"></i>
                        <span>Thông tin</span>
                    </a>
                </li><!-- End Profile Page Nav -->





                <li class="nav-item">
                    <a class="nav-link collapsed" href="/admin/user/create">
                        <i class="bi bi-card-list"></i>
                        <span>Đăng ký</span>
                    </a>
                </li><!-- End Register Page Nav -->

                <li class="nav-item">
                    <a class="nav-link collapsed" href="/login">
                        <i class="bi bi-box-arrow-in-right"></i>
                        <span>Login</span>
                    </a>
                </li><!-- End Login Page Nav -->


            </ul>

        </aside><!-- End Sidebar-->