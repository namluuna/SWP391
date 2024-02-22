<%-- 
    Document   : profile
    Created on : Feb 18, 2024, 12:53:12 PM
    Author     : ifyou
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Profile</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/home.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" />
        <link rel="shortcut icon" type="image/png" href="img/favicon.png">
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <!-- Favicon -->
        <link href="img/icons8-cofee-16.png" rel="icon" />

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

        <!--Libraries Stylesheet-->
        <link href="js/animate/animate.min.css" rel="stylesheet" />
        <link href="js/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet" />

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet" />

        <style>
            .input-image {
                text-align: center;
                max-width: 12rem;
                padding: 1rem;
                border-radius: 1rem;
                background-color: transparent;
            }
        </style>
    </head>

    <body>
        <jsp:include page="view/customer/header.jsp"></jsp:include>
            <div class="container rounded bg-white mt-5 mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">Edogaru</span><span class="text-black-50"></span><span> </span></div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Chỉnh sửa thông tin cá nhân</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12"><label class="labels">Họ tên</label><input type="text" class="form-control" placeholder="Xin hãy nhập họ và tên" value=""></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Địa chỉ email</label><input type="text" class="form-control" value="" disabled></div>
                                <div class="col-md-12"><label class="labels">Số điện thoại</label><input type="text" class="form-control" placeholder="Xin hãy nhập số điện thoại" value=""></div>
                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Save Profile</button></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center experience"><span>Chỉnh sửa địa chỉ</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Thêm mới địa chỉ</span></div><br>
                            <div class="col-md-12"><label class="labels">Địa chỉ 1</label><input type="text" class="form-control" placeholder="experience" value=""></div> <br>
                            <div class="col-md-12"><label class="labels">Địa chỉ 2</label><input type="text" class="form-control" placeholder="additional details" value=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer End -->
</div>
</div>
<jsp:include page="view/customer/footer.jsp"></jsp:include>
</body>

</html>
