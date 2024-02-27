<%-- 
    Document   : newjsp
    Created on : Feb 27, 2024, 7:48:00 PM
    Author     : lucdu
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        /* Optional: Add custom styles here */
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Danh s�ch s?n ph?m</h2>
        <div class="row">
            <!-- B?t ??u v�ng l?p d? li?u s?n ph?m -->
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="https://via.placeholder.com/300" class="card-img-top" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title">T�n s?n ph?m</h5>
                        <p class="card-text">M� t? s?n ph?m</p>
                        <p class="card-text">Gi�: $XX.XX</p>
                        <div class="text-center">
                            <!-- N�t th�m v�o gi? h�ng -->
                            <button class="btn btn-success addToCartBtn" data-product-id="1">Th�m v�o gi? h�ng</button>
                            <!-- N�t mua ngay -->
                            <button class="btn btn-primary buyNowBtn" data-product-id="1">Mua ngay</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- K?t th�c v�ng l?p d? li?u s?n ph?m -->
        </div>
    </div>

    <!-- Include Bootstrap's JavaScript and jQuery (required for Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script>
        // X? l� s? ki?n khi ng??i d�ng nh?p v�o n�t "Th�m v�o gi? h�ng"
        $('.addToCartBtn').click(function() {
            var productId = $(this).data('product-id');
            // Th?c hi?n c�c h�nh ??ng c?n thi?t, ch?ng h?n nh? th�m s?n ph?m v�o gi? h�ng
            // B?n c� th? s? d?ng AJAX ?? g?i y�u c?u ??n m�y ch? ?? th�m s?n ph?m v�o gi? h�ng
            // V� d?: $.post('add-to-cart.php', { productId: productId }, function(response) { ... });
            alert("Th�m s?n ph?m c� ID " + productId + " v�o gi? h�ng th�nh c�ng!");
        });

        // X? l� s? ki?n khi ng??i d�ng nh?p v�o n�t "Mua ngay"
        $('.buyNowBtn').click(function() {
            var productId = $(this).data('product-id');
            // Th?c hi?n c�c h�nh ??ng c?n thi?t khi ng??i d�ng mu?n mua ngay s?n ph?m
            alert("B?t ??u qu� tr�nh thanh to�n cho s?n ph?m c� ID " + productId);
        });
    </script>
</body>
</html>

