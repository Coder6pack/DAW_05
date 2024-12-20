<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Trang chủ</title>
    <link href="{{ asset('bootstrap-5.2.3/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{ asset('custom.css') }}" rel="stylesheet">
    <link href="{{ asset('style.css') }}" rel="stylesheet">
    <link href="{{asset('bootstrap-5.2.3/css/bootstrap.min.css')}}" rel="stylesheet">
    <!-- <link rel="stylesheet" href="public/demo/chartist.css">
    <link rel="stylesheet" href="public/demo/chartist-plugin-tooltip.css"> -->
    <link rel="stylesheet" href="{{asset('css/graindashboard.css')}}">
    <link rel="stylesheet" href="{{asset('fontawesome-free-6.5.2-web/css/all.min.css')}}">

</head>
@extends('layout.app')

<body class="has-sidebar has-fixed-sidebar-and-header side-nav-full-mode">
    <!-- Header -->
    <header class="header bg-body">
        <nav class="navbar flex-nowrap p-0">
            <div class="navbar-brand-wrapper d-flex align-items-center col-auto">
                <!-- Logo For Mobile View -->

                <!-- End Logo For Mobile View -->

                <!-- Logo For Desktop View navbar-brand navbar-brand-desktop -->
                <a href="/">
                    <img class="side-nav-show-on-closed" src="{{asset($logoUrl->img_url)}}" alt="Graindashboard"
                        style="width: 90px; height: 70px;">
                    <img class="side-nav-hide-on-closed" src="{{asset($logoUrl->img_url)}}" alt="Graindashboard"
                        style="width: 250px; height: 70px;">
                </a>
                <!-- End Logo For Desktop View -->
            </div>

            <div class="header-content col px-md-7">
                <div class="d-flex align-items-center">
                    <!-- Side Nav Toggle -->
                    <a class="js-side-nav header-invoker d-flex mr-md-2" href="#" data-close-invoker="#sidebarClose"
                        data-target="#sidebar" data-target-wrapper="body">
                        <i class="fas fa-align-left"></i>
                    </a>
                    <!-- End Side Nav Toggle -->

                    <!-- User Notifications -->
                    <div class="dropdown ml-auto">
                        <a id="notificationsInvoker" class="header-invoker" href="#" aria-controls="notifications"
                            aria-haspopup="true" aria-expanded="false" data-unfold-event="click"
                            data-unfold-target="#notifications" data-unfold-type="css-animation"
                            data-unfold-duration="300" data-unfold-animation-in="fadeIn"
                            data-unfold-animation-out="fadeOut">
                            <span
                                class="indicator indicator-bordered indicator-top-right indicator-primary rounded-circle">{{$quantityInvoice}}</span>
                            <i class="fas fa-bell"></i>
                        </a>

                        <div id="notifications"
                            class="dropdown-menu dropdown-menu-center py-0 mt-4 w-18_75rem w-md-22_5rem unfold-css-animation unfold-hidden fadeOut"
                            aria-labelledby="notificationsInvoker" style="animation-duration: 300ms;">
                            <div class="card">

                                <div class="card-header d-flex align-items-center border-bottom py-3">
                                    <h5 class="mb-0">Duyệt đơn hàng</h5>

                                </div>
                                @if($quantityInvoice)
                                    <div class="card-body p-0">
                                        <div class="list-group list-group-flush">
                                            @foreach($customerInvoice as $invoice)
                                                @if($invoice->customer)
                                                    <a href="{{route('invoice.list')}}"
                                                        class="list-group-item list-group-item-action">
                                                        <div class="d-flex align-items-center text-nowrap mb-2">
                                                            <i class="fas fa-info-circle icon-text text-primary mr-2"></i>
                                                            <h6 class="font-weight-semi-bold mb-0">Đơn hàng: {{$invoice->id}}</h6>
                                                        </div>
                                                        <p class="mb-0">
                                                            Khách hàng: <strong>{{ $invoice->customer->name }} </strong> đang chờ
                                                            duyệt
                                                        </p>
                                                        <a class="list-group-item-closer text-muted" href="#"><i
                                                                class="fas fa-times"></i></a>
                                                    </a>

                                                @endif
                                            @endforeach
                                        </div>
                                    </div>
                                @else
                                    <span class="error-invoice">Không có đơn hàng nào cần duyệt!</span>
                                @endif
                            </div>
                        </div>
                    </div>
                    <!-- End User Notifications -->
                    <!-- User Avatar -->
                    <div class="dropdown mx-3 dropdown ml-2">
                        <a id="profileMenuInvoker" class="header-complex-invoker" href="#" aria-controls="profileMenu"
                            aria-haspopup="true" aria-expanded="false" data-unfold-event="click"
                            data-unfold-target="#profileMenu" data-unfold-type="css-animation"
                            data-unfold-duration="300" data-unfold-animation-in="fadeIn"
                            data-unfold-animation-out="fadeOut">
                            <!--img class="avatar rounded-circle mr-md-2" src="#" alt="John Doe"-->
                            <span class="mr-md-2 avatar-placeholder">
                                <img src="{{Auth::check() && Auth::user()->avatar_url ? asset(Auth::user()->avatar_url) : asset('avt/avatar-rong.jpg')}}"
                                    class="rounded-circle1">
                            </span>
                            <span class="d-none d-md-block">{{ Auth()->user()->username}}</span>
                            <i class="fas fa-angle-down d-none d-md-block ml-2"></i>
                        </a>

                        <ul id="profileMenu"
                            class="unfold unfold-user unfold-light unfold-top unfold-centered position-absolute pt-2 pb-1 mt-4 unfold-css-animation unfold-hidden fadeOut"
                            aria-labelledby="profileMenuInvoker" style="animation-duration: 300ms;">
                            <li class="unfold-item">
                                <a class="unfold-link d-flex align-items-center text-nowrap"
                                    href="{{route('admin.info')}}">
                                    <span class="unfold-item-icon mr-3">
                                        <i class="fas fa-user"></i>
                                    </span>
                                    Thông tin cá nhân
                                </a>
                            </li>
                            <li class="unfold-item unfold-item-has-divider">
                                <a class="unfold-link d-flex align-items-center text-nowrap" href="{{route('logout')}}">
                                    <span class="unfold-item-icon mr-3">
                                        <i class="fas fa-power-off"></i>
                                    </span>
                                    Đăng xuất
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- End User Avatar -->
                </div>
            </div>
        </nav>
    </header>
    <!-- End Header -->

    <main class="main">
        <aside id="sidebar" class="js-custom-scroll side-nav mCustomScrollbar _mCS_1 mCS-autoHide"
            style="overflow: visible;">
            <div id="mCSB_1" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside"
                style="max-height: none;" tabindex="0">
                <div id="mCSB_1_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
                    <ul id="sideNav" class="side-nav-menu side-nav-menu-top-level mb-0">

                        <li class="sidebar-heading h6">Trang chủ</li>

                        <!-- Dashboard -->

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#"
                                data-target="#subStatistical">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-chart-line"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Thống kê</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>
                            <ul id="subStatistical" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('statistical')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-calendar-alt"></i></span>Theo năm</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('statistical-month')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-calendar"></i></span>Theo tháng</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('statistical-day')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-calendar-day"></i></span>Theo ngày</a>
                                </li>
                            </ul>
                        </li>
                        <!-- End Dashboard -->



                        <li class="sidebar-heading h6">Quản lý</li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subUsers">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-circle-user"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Nhân viên</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>
                            <ul id="subUsers" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('admin.list')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('admin.add-new')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-plus"></i></span>Thêm mới</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subCustomers">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-users"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Khách hàng</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>
                            <ul id="subCustomers" class="side-nav-menu side-nav-menu-second-level mb-0">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('customer.list')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>

                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subProvider">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-truck"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Nhà cung cấp</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>

                            <ul id="subProvider" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('provider.list')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('provider.add-new')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-plus"></i></span>Thêm mới</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#"
                                data-target="#subProductTypes">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-industry"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Hãng sản phẩm</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>

                            <ul id="subProductTypes" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('brand.list')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('brand.add-new')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-plus"></i></span>Thêm mới</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subProducts">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-box"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Sản phẩm</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>

                            <ul id="subProducts" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('product.list')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('product.add-new')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-plus"></i></span>Thêm mới</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#Receipts">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-receipt"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Phiếu nhập kho</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>

                            <ul id="Receipts" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('warehouse.list')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{ route('warehouse.add-new')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-plus"></i></span>Thêm mới</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subInvoices">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-file-invoice"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Đơn hàng</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>

                            <ul id="subInvoices" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('invoice.list')}}">
                                        <span class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subNews">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-newspaper"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Tin tức</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>
                            <ul id="subNews" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('news.list')}}">
                                        <span class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('news.add-new')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-plus"></i></span>Thêm mới</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#"
                                data-target="#subColorCapacity">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-palette"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Dung lượng và màu sắc</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>
                            <ul id="subColorCapacity" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('capacity.list')}}">
                                        <span class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách dung lượng</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('color.list')}}">
                                        <span class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách màu sắc</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subDiscount">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-gift"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Khuyến mãi</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>
                            <ul id="subDiscount" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('discount.list')}}">
                                        <span class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('discount.add-new')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-plus"></i></span>Thêm khuyến mãi</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subSlideshow">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-images"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Slideshow</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>
                            <ul id="subSlideshow" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('slide-show.list')}}">
                                        <span class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('slide-show.add-new')}}"><span
                                            class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-plus"></i></span>Thêm</a>
                                </li>
                            </ul>
                        </li>

                        <li class="side-nav-menu-item side-nav-has-menu">
                            <a class="side-nav-menu-link media align-items-center" href="#" data-target="#subComment">
                                <span class="side-nav-menu-icon d-flex mr-3">
                                    <i class="fas fa-comments"></i>
                                </span>
                                <span class="side-nav-fadeout-on-closed media-body">Bình luận</span>
                                <span class="side-nav-control-icon d-flex">
                                    <i class="fas fa-angle-right side-nav-fadeout-on-closed"></i>
                                </span>
                                <span class="side-nav__indicator side-nav-fadeout-on-closed"></span>
                            </a>
                            <ul id="subComment" class="side-nav-menu side-nav-menu-second-level mb-0"
                                style="display: none;">
                                <li class="side-nav-menu-item">
                                    <a class="side-nav-menu-link" href="{{route('comment.list')}}">
                                        <span class="side-nav-menu-icon d-flex mr-2 mt-1"><i
                                                class="fas fa-list"></i></span>Danh sách</a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="mCSB_scrollTools  mCS-minimal-dark mCSB_scrollTools_vertical" style="display: block;">
                <div>

                    <div class="mCSB_dragger_bar" style="line-height: 0px;"></div>

                    <div class="mCSB_draggerRail"></div>
                </div>
            </div>


        </aside>


        <div class="content">
            <div class="py-4 px-3 px-md-8">
                <div class="mb-12 mb-md-4">
                    @yield('content')
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="{{asset('js/graindashboard.js')}}"></script>
    <script src="{{asset('js/graindashboard.vendor.js')}}"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="{{ asset('sweetalert2/sweetalert2.all.min.js')}}"></script>
    <script src="{{asset('bootstrap-5.2.3/js/bootstrap.min.js')}}"></script>
    @yield('page-sw')

    @yield('page-js')
</body>
<script>
    $(document).ready(function () {
        $(".js-custom-scroll").mCustomScrollbar({
            theme: "minimal-dark",
            scrollInertia: 300,
            advanced: {
                updateOnContentResize: true
            }
        });
    });
</script>

</html>