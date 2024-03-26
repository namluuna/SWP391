<%-- 
    Document   : PDetailCustomer
    Created on : Mar 16, 2024, 9:47:32 AM
    Author     : lucdu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel='stylesheet' id='fe-bootstrap-css-css'  href='ananas.vn/wp-content/themes/ananas/fe-assets/css/bootstrap.min261b.css' type='text/css' media='all' />
        <link rel='stylesheet' id='fe-ie10-viewport-bug-workaround-css-css'  href='ananas.vn/wp-content/themes/ananas/fe-assets/css/ie10-viewport-bug-workaround261b.css' type='text/css' media='all' />
        <link rel='stylesheet' id='fe-jquery-simple-mobilemenu-css'  href='ananas.vn/wp-content/themes/ananas/fe-assets/css/jquery-simple-mobilemenu261b.css' type='text/css' media='all' />
        <link rel='stylesheet' id='fe-slick-css'  href='ananas.vn/wp-content/themes/ananas/fe-assets/css/slick261b.css' type='text/css' media='all' />
        <link rel='stylesheet' id='fe-slick-theme-css'  href='ananas.vn/wp-content/themes/ananas/fe-assets/css/slick-theme261b.css' type='text/css' media='all' />
        <link rel='stylesheet' id='fe-bootstrap-select-css'  href='ananas.vn/wp-content/themes/ananas/fe-assets/css/bootstrap-select.min261b.css' type='text/css' media='all' />
        <link rel='stylesheet' id='fe-jBox-css'  href='ananas.vn/wp-content/themes/ananas/fe-assets/css/jBox261b.css' type='text/css' media='all' />
        <link rel='stylesheet' id='fe-style-css'  href='ananas.vn/wp-content/themes/ananas/fe-assets/css/style261b.css' type='text/css' media='all' />
        <link rel='stylesheet' id='ananas-style-css'  href='ananas.vn/wp-content/themes/ananas/style5fba.css' type='text/css' media='all' />
        <style type="text/css">
            img.wp-smiley,
            img.emoji {
                display: inline !important;
                border: none !important;
                box-shadow: none !important;
                height: 1em !important;
                width: 1em !important;
                margin: 0 .07em !important;
                vertical-align: -0.1em !important;
                background: none !important;
                padding: 0 !important;
            }
        </style>
        <style>
            .color {
                display: flex; /* Sử dụng flexbox */
                justify-content: flex-start; /* Căn trái */
                align-items: center; /* Căn dọc giữa */
            }

            .nav.tree {
                display: flex; /* Sử dụng flexbox */
                list-style-type: none; /* Loại bỏ các dấu hiệu danh sách */
                padding: 0; /* Loại bỏ padding mặc định */
                margin: 0; /* Loại bỏ margin mặc định */
            }

            .cb-color-fixed {
                margin-right: 10px; /* Khoảng cách giữa các mục */
            }

            .bg-color {
                width: 20px; /* Độ rộng của mỗi màu */
                height: 20px; /* Chiều cao của mỗi màu */
                display: inline-block; /* Hiển thị là khối */
                margin-right: 5px; /* Khoảng cách giữa mỗi màu */
            }

        </style>
    </head>
    <body>
        <div class="header container-fluid hidden-xs hidden-sm">
            <div class="row">
                <ul class="menu">
                    <li><a href="SearchOrder.jsp"><img src="ananas.vn/wp-content/themes/ananas/fe-assets/images/svg/icon_tra_cuu_don_hang.svg"> Tra cứu đơn hàng</a></li>
                            <c:choose>
                                <c:when test="${not empty user}">
                            <li><a href="profile"><img
                                        src="ananas.vn/wp-content/themes/ananas/fe-assets/images/svg/icon_dang_nhap.svg"> ${user.name}</a></li>
                            <li><a href="CartController"><img src="ananas.vn/wp-content/themes/ananas/fe-assets/images/svg/icon_gio_hang.svg">Giỏ hàng (<span class="countProduct">${total}</span>)</a></li>
                            <li><a href="logout"><img src="ananas.vn/wp-content/themes/ananas/fe-assets/images/svg/logout.svg">Đăng xuất</a></li>
                                </c:when>
                                <c:otherwise>
                            <li><a href="login"><img
                                        src="ananas.vn/wp-content/themes/ananas/fe-assets/images/svg/icon_dang_nhap.svg"> Đăng nhập</a></li>
                                </c:otherwise>
                            </c:choose> 
                </ul>
            </div>
            <div class="row d-flex justify-content-center align-items-center">
                <div class="navbar center" >

                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="dropdown mt-0">
                                <a href="CustomerProducts" class="py-0 d-flex align-items-center">TRANG CHỦ</a>
                            </li>

                            <li class="line" style="margin-top:28px"></li>
                            <li class="dropdown mt-0">
                                <a href="CustomerProducts" class="py-0 d-flex align-items-center">SẢN PHẨM MỚI</a>
                            </li>

                            <li class="line" style="margin-top:28px"></li>
                            <li class="dropdown mt-0">
                                <a href="CustomerProducts" class="py-0 d-flex align-items-center">BÁN CHẠY</a>

                            </li>
                        </ul>
                        <form action="" class="navbar-form navbar-right">
                            <form action="CustomerProducts" method="get" class="navbar-form navbar-right">
                                <div class="form-group">
                                    <img class="icon-search" src="ananas.vn/wp-content/themes/ananas/fe-assets/images/svg/icon_tim_kiem.svg">
                                    <input type="hidden" name="filter" value="search">
                                    <input style="
                                           margin-bottom: 0;
                                           border: #ffc221 solid 2px !important;
                                           " type="text" name="id" class="form-control" value="" placeholder="Tìm kiếm" onkeydown="if (event.keyCode == 13)
                                                       this.form.submit();">
                                </div>
                            </form>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="prd-detail container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
                    <div class="wrapper-slide">
                        <div class="prd-detail-main-img">
                            <img class="main-img" src="images/${pd.getImage_url_1()}">
                            <img id="zoom" class="zoom-img hidden-xs hidden-sm" src="../../ananas.vn/wp-content/themes/ananas/fe-assets/images/svg/icon_zoom.svg">
                        </div>
                        <div class="prd-detail-slide1 slick-initialized slick-slider">
                            <button class="slick-prev slick-arrow slick-disabled" aria-label="Previous" type="button" aria-disabled="true" style="display: block;" control-id="ControlID-2">Previous</button>
                            <div class="slick-list draggable">
                                <div class="slick-track" style="opacity: 1; width: 1600px; transform: translate3d(0px, 0px, 0px);">
                                    <div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 160px;">
                                        <div>
                                            <div class="thumbnail" style="width: 100%; display: inline-block;">
                                                <div class="cont-item">
                                                    <img src="images/${pd.getImage_url_1()}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slick-slide slick-active" data-slick-index="1" aria-hidden="false" style="width: 160px;">
                                        <div><div class="thumbnail" style="width: 100%; display: inline-block;">
                                                <div class="cont-item">
                                                    <img src="images/${pd.getImage_url_2()}"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slick-slide slick-active" data-slick-index="2" aria-hidden="false" style="width: 160px;">
                                        <div>
                                            <div class="thumbnail" style="width: 100%; display: inline-block;">
                                                <div class="cont-item">
                                                    <img src="images/${pd.getImage_url_3()}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="slick-slide slick-active" data-slick-index="3" aria-hidden="false" style="width: 160px;">
                                        <div>
                                            <div class="thumbnail" style="width: 100%; display: inline-block;">
                                                <div class="cont-item">
                                                    <img src="images/${pd.getImage_url_4()}"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="slick-next slick-arrow" aria-label="Next" type="button" style="display: block;" aria-disabled="false" control-id="ControlID-3">Next</button>
                        </div>
                    </div>

                    <div class="row prd-detail-img hidden-xs hidden-sm">

                    </div>
                </div>
                <form action="AddToCartServlet">
                    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 prd-detail-right">
                        <input type="hidden" name="id" value="${pd.id}">
                        <h4>${pd.getProduct().getName()}</h4>
                        <h6 class="detail1">
                            <input type="hidden" id="productId" value="25705">
                            <span class="pull-left">Mã sản phẩm: <strong>${pd.getProduct().getCode()}</strong></span>
                            <span class="pull-right">Tình trạng: <strong>${pd.getProduct().getGroup().getName()}</strong></span>
                        </h6>

                        <h5 class="detail1">
                            <span class="saleprice"><fmt:formatNumber type="currency" currencySymbol="VND" value="${pd.getProduct().getPrice()}" maxFractionDigits="0" /></span>
                            <!--                        <span class="realprice">580.000 VND</span>-->

                        </h5>
                        <div class="divider"></div>
                        <h6 class="detail1">${pd.getProduct().getForm().getDescription()}</h6>
                        <div class="divider"></div>
                        <div class="color">
                            <ul class="nav tree">
                                <c:forEach var="c" items="${cls}">
                                    <li class="cb-color-fixed">
                                        <label data-link>
                                            <a href="CustomerProducts?detail=${c.id}">
                                                <span class="bg-color" style="background-color: ${c.color_code};"></span>
                                            </a>
                                        </label>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>


                        <!--                        <div class="color">
                                                    <ul class="nav tree">
                                                        <li class="cb-color-fixed">
                                                            <label data-link><span class="bg-color"
                                                                                   style="background-color: ${pd.getColor().getColor_code()};
                                                                                   "></span><input
                                                                                   name="cbColor" type="checkbox" value="0" hidden></label>
                                                        </li>
                                                    </ul>
                                                </div>-->
                        <div class="divider"></div>
                        
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <h5>SIZE</h5>
                                <select class="selectpicker">
                                    <option></option>
                                    <option >35</option>
                                    <option>36</option>
                                    <option>37</option>
                                    <option>38</option>
                                    <option>39</option>
                                    <option >40</option>
                                    <option >41</option>
                                    <option >42</option>
                                    <option>43</option>
                                    <option>44</option>
                                    <option >45</option>
                                    <option >46</option>
                                </select>
                            </div>
                            
                            <div class="col-xs-12 col-sm-6 col-md-6">
                                <h5>SỐ LƯỢNG</h5>
                                <select id="pickQuantity" disabled class="selectpicker quantity" data-style="btn">
                                    <option selected >&nbsp;</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </div>
                        </div>
                        <div class="row grp-btn1">
                            <button class="btn btn-addcart" type="submit" style="width: 480px">THÊM VÀO GIỎ HÀNG</button>
                        </div>
                        <% String message = (String) session.getAttribute("addToCartSuccess"); %>
                        <% if(message != null){ %>
                        <% session.removeAttribute("addToCartSuccess"); %>
                        <br>
                        <div style="color:green !important"><%= message %></div>
                        <% } %>
                        <div class="row info-validate empty-error" style="display: none;">
                            Vui lòng chọn Size/Số lượng phù hợp
                        </div>
                </form>
                <div>
                    <div class="panel-group" id="prdDetailInfor" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#prdDetailInfor"
                                       href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        THÔNG TIN SẢN PHẨM <span class="caret"></span>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                                 aria-labelledby="headingOne">
                                <div class="divider-1"></div>
                                <div class="panel-body">
                                    <h6><p>&#8211; Gender: Unisex<br />
                                            &#8211; Size run: 35 &#8211; 46<br />
                                            &#8211; Upper: Suede<br />
                                            &#8211; Outsole: Rubber</p>
                                        <p><a href="../../wp-content/uploads/Ananas_SizeChart.jpg"><img class="alignnone wp-image-886913" src="../../wp-content/uploads/Ananas_SizeChart.jpg" alt="" width="398" height="563" srcset="https://ananas.vn/wp-content/uploads/Ananas_SizeChart.jpg 481w, https://ananas.vn/wp-content/uploads/Ananas_SizeChart-212x300.jpg 212w, https://ananas.vn/wp-content/uploads/Ananas_SizeChart-184x260.jpg 184w, https://ananas.vn/wp-content/uploads/Ananas_SizeChart-353x500.jpg 353w" sizes="(max-width: 398px) 100vw, 398px" /></a></p>
                                        <p>${pd.getProduct().getDescription()}</p>
                                    </h6>
                                </div>
                            </div>
                            <div class="divider-1"></div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse"
                                       data-parent="#prdDetailInfor"
                                       href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        QUY ĐỊNH ĐỔI SẢN PHẨM <span class="caret"></span>
                                    </a>

                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingTwo">
                                <div class="divider-1"></div>
                                <div class="panel-body">
                                    <h6><ul>
                                            <li>Chỉ đổi hàng 1 lần duy nhất, mong bạn cân nhắc kĩ trước khi quyết định.</li>
                                            <li>Thời hạn đổi sản phẩm khi mua trực tiếp tại cửa hàng là 07 ngày, kể từ ngày mua. Đổi sản phẩm khi mua online là 14 ngày, kể từ ngày nhận hàng.</li>
                                            <li>Sản phẩm đổi phải kèm hóa đơn. Bắt buộc phải còn nguyên tem, hộp, nhãn mác.</li>
                                            <li>Sản phẩm đổi không có dấu hiệu đã qua sử dụng, không giặt tẩy, bám bẩn, biến dạng.</li>
                                            <li>Ananas chỉ ưu tiên hỗ trợ đổi size. Trong trường hợp sản phẩm hết size cần đổi, bạn có thể đổi sang 01 sản phẩm khác:<br />
                                                - Nếu sản phẩm muốn đổi ngang giá trị hoặc có giá trị cao hơn, bạn sẽ cần bù khoảng chênh lệch tại thời điểm đổi (nếu có).<br />
                                                - Nếu bạn mong muốn đổi sản phẩm có giá trị thấp hơn, chúng tôi sẽ không hoàn lại tiền.</li>
                                            <li>Trong trường hợp sản phẩm - size bạn muốn đổi không còn hàng trong hệ thống. Vui lòng chọn sản phẩm khác.</li>
                                            <li>Không hoàn trả bằng tiền mặt dù bất cứ trong trường hợp nào. Mong bạn thông cảm.</li>
                                        </ul>
                                    </h6>
                                </div>
                            </div>
                            <div class="divider-1"></div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse"
                                       data-parent="#prdDetailInfor"
                                       href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        BẢO HÀNH THẾ NÀO ? <span class="caret"></span>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <div class="divider-1"></div>
                                <div class="panel-body">
                                    <h6><p>Mỗi đôi giày Ananas trước khi xuất xưởng đều trải qua nhiều khâu kiểm tra. Tuy vậy, trong quá trình sử dụng, nếu nhận thấy các lỗi: gãy đế, hở đế, đứt chỉ may,...trong thời gian 6 tháng từ ngày mua hàng, mong bạn sớm gửi sản phẩm về Ananas nhằm giúp chúng tôi có cơ hội phục vụ bạn tốt hơn. Vui lòng gửi sản phẩm về bất kỳ cửa hàng Ananas nào, hoặc gửi đến trung tâm bảo hành Ananas ngay trong trung tâm TP.HCM trong giờ hành chính:</p>
                                        <p>Địa chỉ: 5C Tân Cảng, P.25, Q.Bình Thạnh , TP. Hồ Chí Minh.<br />
                                            Hotline: 028 2211 0067</p>
                                    </h6>
                                </div>
                            </div>
                            <div class="divider-1 hidden-xs hidden-sm"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            // Sử dụng jQuery để chọn slick slider và khởi tạo nó
            $('.prd-detail-slide1').slick();

            // Bắt sự kiện khi click vào nút Previous
            $('.slick-prev').click(function () {
                // Chuyển ảnh chính về ảnh đầu tiên
                $('.main-img').attr('src', 'images/${pd.getImage_url_1()}');
            });

            // Bắt sự kiện khi click vào nút Next
            $('.slick-next').click(function () {
                // Chuyển ảnh chính về ảnh đầu tiên
                $('.main-img').attr('src', 'images/${pd.getImage_url_1()}');
            });
        });
    </script>
    <script>
// Lưu trữ các color_code đã xuất hiện
        var seenColors = {};

// Lấy danh sách các màu
        var colors = document.querySelectorAll('.bg-color');

// Lặp qua từng màu
        colors.forEach(function (color) {
            // Lấy color_code của màu
            var colorCode = color.style.backgroundColor;

            // Nếu color_code đã xuất hiện, ẩn màu
            if (seenColors[colorCode]) {
                color.style.display = 'none';
            } else {
                // Nếu color_code chưa xuất hiện, đánh dấu đã xuất hiện và hiển thị màu
                seenColors[colorCode] = true;
                color.style.display = 'inline-block';
            }
        });

    </script>
</body>
</html>
