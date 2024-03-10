<%-- 
    Document   : ProductDetail
    Created on : Mar 10, 2024, 5:19:38 PM
    Author     : lucdu
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Detail</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            /* Thi?t l?p font ch? v� margin */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            /* Canh gi?a ti�u ?? s?n ph?m */
            .pro-d-title {
                text-align: center;
                margin-bottom: 20px;
            }

            /* Thi?t l?p k�ch th??c v� padding cho c�c c?t */
            .col-md-6 {
                padding: 0 15px;
            }

            /* Canh gi?a h�nh ?nh ch�nh */
            .pro-img-details {
                margin-bottom: 20px;
                text-align: center;
                overflow: hidden; /* ?n ph?n th?a */
                position: relative; /* Cho ph�p ??nh v? tuy?t ??i cho c�c ph?n t? con */
            }

            /* K�ch th??c v� canh gi?a ?nh ch�nh */
            .pro-img-details img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* Zoom ra v?a v?i k�ch th??c c? ??nh */
            }

            /* M?i t�n chuy?n ??i ?nh */
            .arrow {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                background: rgba(255, 255, 255, 0.5); /* M�u n?n ??c */
                color: #000; /* M�u ch? */
                padding: 10px;
                cursor: pointer;
                font-size: 1.5em;
                border: none;
                outline: none;
                transition: background 0.3s, color 0.3s;
            }

            /* M?i t�n chuy?n ??i ?nh: Hover */
            .arrow:hover {
                background: rgba(0, 0, 0, 0.5); /* M�u n?n ??c khi hover */
                color: #fff; /* M�u ch? khi hover */
            }

            /* M?i t�n chuy?n ??i ?nh b�n tr�i */
            .arrow.left {
                left: 0;
            }

            /* M?i t�n chuy?n ??i ?nh b�n ph?i */
            .arrow.right {
                right: 0;
            }

            /* Canh gi?a danh s�ch c�c ?nh nh? */
            .pro-img-list {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                margin-bottom: 20px;
            }

            /* K�ch th??c v� canh gi?a c�c ?nh nh? */
            .pro-img-list a {
                display: block;
                margin: 0 10px 10px 0;
                width: 100px; /* K�ch th??c c? ??nh */
                height: 100px; /* K�ch th??c c? ??nh */
                overflow: hidden; /* ?n ph?n th?a */
            }

            /* K�ch th??c v� canh gi?a c�c ?nh nh? */
            .pro-img-list img {
                width: 100%; /* K�ch th??c t? ??ng */
                height: 100%; /* K�ch th??c t? ??ng */
                object-fit: cover; /* Zoom ra v?a v?i k�ch th??c c? ??nh */
            }

            /* Button Add to Cart */
            .btn-round {
                border-radius: 20px;
            }

            /* Thi?t l?p k�ch th??c input quantity */
            .form-group input {
                width: 50px;
                padding: 5px;
                text-align: center;
            }

            /* CSS ?? ?n/m? r?ng ph?n m� t? s?n ph?m */
            .product-description {
                display: none; /* ?n m?c ??nh */
            }

            /* Thi?t l?p c�c n�t t?ng/gi?m s? l??ng s?n ph?m */
            .quantity-controls {
                display: flex;
                align-items: center;
                margin-top: 10px;
            }

            .quantity-controls button {
                background: none;
                border: none;
                cursor: pointer;
                font-size: 1.2em;
            }

            .quantity-input {
                width: 50px;
                padding: 5px;
                text-align: center;
            }

            /* Thi?t l?p margin gi?a c�c c?t */
            .column-margin {
                margin-bottom: 20px;
            }

            /* Thi?t l?p hi?n th? h�ng ngang */
            .horizontal-line {
                border-top: 1px solid #ccc;
                margin-top: 20px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 column-margin">
                    <div class="pro-img-details">
                        <div class="arrow left" onclick="prevImage()">&#10094;</div>
                        <img id="mainImage" src="images/${pd.getImage_url_1()}" alt="?nh 1">
                        <div class="arrow right" onclick="nextImage()">&#10095;</div>
                    </div>
                    <div class="pro-img-list">
                        <a onclick="changeImage('images/${pd.getImage_url_1()}')">
                            <img src="images/${pd.getImage_url_1()}" alt="?nh 1">
                        </a>
                        <a onclick="changeImage('images/${pd.getImage_url_2()}')">
                            <img src="images/${pd.getImage_url_2()}" alt="">
                        </a>
                        <a onclick="changeImage('images/${pd.getImage_url_3()}')">
                            <img src="images/${pd.getImage_url_3()}" alt="">
                        </a>
                        <a onclick="changeImage('images/${pd.getImage_url_4()}')">
                            <img src="images/${pd.getImage_url_4()}" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 column-margin">
                    <h2 class="pro-d-title">${pd.getProduct().getName()}</h2>
                    <p>
                        <strong>M� s?n ph?m: </strong>${pd.getProduct().getCode()}<br>
                        <strong>T�nh tr?ng: </strong>${pd.getProduct().getGroup().getName()}<br>
                        <strong>K�ch th??c: </strong>${pd.getSize().getName()}<br>
                        <strong>C�n: </strong>${pd.getInventory_number()} <span>s?n ph?m.</span><br>
                        <strong>Gi� ti?n: </strong>${pd.getProduct().getPrice()}<br>
                        <strong>M�u S?c: </strong>
                    <div style="display: inline-block;
                         width: 20px;
                         height: 20px;
                         background-color: ${pd.getColor().getColor_code()};
                         margin-right: 5px;
                         border: 1px solid black"></div>
                    </p>
                    <div class="quantity-controls">
                        <button onclick="decreaseQuantity()">-</button>
                        <input type="number" class="quantity-input" id="quantity" value="1">
                        <button onclick="increaseQuantity()">+</button>
                    </div>
                    <p>
                        <button class="btn btn-round btn-danger" type="button"><i class="fa fa-shopping-cart"></i> Th�m v�o gi? h�ng</button>
                    </p>
                    <strong class="toggle-btn" onclick="toggleDescription()">Th�ng tin s?n ph?m</strong>
                    <div class="product-description">
                        ${pd.getProduct().getDescription()}
                    </div>
                </div>
            </div>
            <div class="row horizontal-line"></div>
            <div class="row">
                <div class="col-md-6 offset-md-3 column-margin">
                    <!-- ??t n?i dung d??i ?�y cho ph?n ?nh nh? -->
                </div>
            </div>
        </div>

        <script>
            // Bi?n l?u tr? ???ng d?n c?a h�nh ?nh hi?n t?i
            var currentImageUrl = 'images/${pd.getImage_url_1()}';
            var imageIndex = 0;
            var imageUrls = [
                'images/${pd.getImage_url_1()}',
                'images/${pd.getImage_url_2()}',
                'images/${pd.getImage_url_3()}',
                'images/${pd.getImage_url_4()}'
            ];

            // Function ?? thay ??i h�nh ?nh ch�nh
            function changeImage(imageUrl) {
                document.getElementById('mainImage').src = imageUrl;
                currentImageUrl = imageUrl; // C?p nh?t gi� tr? c?a bi?n ???ng d?n hi?n t?i
            }

            // Function ?? chuy?n ??n ?nh tr??c ?�
            function prevImage() {
                imageIndex = (imageIndex - 1 + imageUrls.length) % imageUrls.length;
                changeImage(imageUrls[imageIndex]);
            }

            // Function ?? chuy?n ??n ?nh k? ti?p
            function nextImage() {
                imageIndex = (imageIndex + 1) % imageUrls.length;
                changeImage(imageUrls[imageIndex]);
            }

            // Thi?t l?p h�nh ?nh ??u ti�n l� h�nh ?nh m?c ??nh
            window.onload = function () {
                document.getElementById('mainImage').src = currentImageUrl;
            };
        </script>
        <script>
            // JavaScript ?? toggle hi?n th? m� t? s?n ph?m
            function toggleDescription() {
                var description = document.querySelector('.product-description');
                if (description.style.display === 'none') {
                    description.style.display = 'block'; // Hi?n th? khi ?n
                } else {
                    description.style.display = 'none'; // ?n khi hi?n th?
                }
            }

            // JavaScript ?? t?ng gi?m s? l??ng s?n ph?m
            function increaseQuantity() {
                var quantityInput = document.getElementById('quantity');
                quantityInput.value = parseInt(quantityInput.value) + 1;
            }

            function decreaseQuantity() {
                var quantityInput = document.getElementById('quantity');
                if (parseInt(quantityInput.value) > 1) {
                    quantityInput.value = parseInt(quantityInput.value) - 1;
                }
            }
        </script>
    </body>
</html>

