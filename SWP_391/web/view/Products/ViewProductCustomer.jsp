<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>lighten</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

        <style>
            .sidebar {
                display: grid;
                grid-template-columns: 1fr 1fr;
                grid-gap: 20px;
            }

            .category, .brands {
                border: 1px solid #ccc;
                padding: 10px;
            }

        </style>  

    </head>
    <!-- body -->
    <body class="main-layout product_page">
        <!-- loader  -->
        <div class="loader_bg">
            <div class="loader"><img src="images/loading.gif" alt="#" /></div>
        </div>


        <!-- end loader --> 
        <!-- header -->

        <jsp:include page="../Groups/header.jsp"></jsp:include>

            <div class="product-bg">

                <div class="sidebar">
                    <div class="category">
                        <h2>Category</h2>
                    <c:forEach var="category" items="${data1}"> 
                        <a href="CustomerProducts?filter=category&id=${category.id}">${category.name}</a>
                    </c:forEach>
                </div>
                <div class="brands">
                    <h2>Brands</h2>
                    <c:forEach var="brand" items="${data2}"> 
                        <a href="CustomerProducts?filter=brand&id=${brand.id}">${brand.name}</a>
                    </c:forEach>
                </div>
            </div>

            <div class="product-bg-white">
                <div class="container">
                    <div class="row">

                        <c:forEach var="product" items="${data}"> 
                            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12">
                                <div class="product-box">
                                    <i><img src="icon/p1.png"/></i>
                                    <span>${product.name}</span>
                                    <div class="text-monospace">${product.price}</div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!--  footer --> 

            <jsp:include page="../Groups/footer.jsp"></jsp:include>
        </div>

    </body>
</html>