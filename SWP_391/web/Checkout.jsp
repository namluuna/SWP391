<%-- 
    Document   : Checkout.jsp
    Created on : Mar 3, 2024, 5:12:34 PM
    Author     : ifyou
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Đặt hàng</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Ion Icon Fonts-->
        <link rel="stylesheet" href="css/ionicons.min.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Magnific Popup -->
        <link rel="stylesheet" href="css/magnific-popup.css">

        <!-- Flexslider  -->
        <link rel="stylesheet" href="css/flexslider.css">

        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">

        <!-- Date Picker -->
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <!-- Flaticons  -->
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body>
        <jsp:include page="view/customer/header.jsp"></jsp:include>
        <div class="colorlib-loader"></div>
        <div id="page" style="margin-top: 32px">
            <div class="colorlib-product">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <form method="post" class="colorlib-form">
                                <h2>Thông tin đơn hàng</h2>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="country">Chọn địa chỉ giao hàng</label>
                                            <div class="form-group">
                                                <select name="people" id="people" class="form-control" style="height:60px;">
                                                    <option value="#">Địa chỉ giao hàng</option>
                                                    <option value="#">Alaska</option>
                                                    <option value="#">China</option>
                                                    <option value="#">Japan</option>
                                                    <option value="#">Korea</option>
                                                    <option value="#">Philippines</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="companyname">Người nhận hàng</label>
                                            <input type="text" id="companyname" class="form-control" value="${user.name}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="fname">Địa chỉ Email</label>
                                            <input type="text" id="address" class="form-control" value="${user.email}" disabled>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="companyname">Số điện thoại</label>
                                            <input type="text" id="towncity" class="form-control" value="${user.phone}" disabled>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="col-lg-4" >
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="cart-detail">
                                        <h2>Chi tiết đơn hàng</h2>
                                        <ul>
                                            <li>
                                                <ul>
                                                    <li><span>1 x Product Name</span> <span>$99.00</span></li>
                                                    <li><span>1 x Product Name</span> <span>$78.00</span></li>
                                                </ul>
                                            </li>
                                            <li><span>Phí vận chuyển:</span> <span>Miễn phí</span></li>
                                            <li><span>Tổng tiền: </span> <span>$180.00</span></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="w-100"></div>

                                <div class="col-md-12">
                                    <div class="cart-detail">
                                        <h2>Phương thức thanh toán</h2>
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <div class="radio">
                                                    <label><input type="radio" name="optradio" checked="true"> Thanh toán khi nhận hàng</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <p><a href="#" class="btn btn-primary">Đặt hàng</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
        </div>

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>
        <!-- popper -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap 4.1 -->
        <script src="js/bootstrap.min.js"></script>
        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- Waypoints -->
        <script src="js/jquery.waypoints.min.js"></script>
        <!-- Flexslider -->
        <script src="js/jquery.flexslider-min.js"></script>
        <!-- Owl carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- Magnific Popup -->
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/magnific-popup-options.js"></script>
        <!-- Date Picker -->
        <script src="js/bootstrap-datepicker.js"></script>
        <!-- Stellar Parallax -->
        <script src="js/jquery.stellar.min.js"></script>
        <!-- Main -->
        <script src="js/main.js"></script>
        <jsp:include page="view/customer/footer.jsp"></jsp:include>
    </body>
</html>


