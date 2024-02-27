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
        <h2>Danh sách s?n ph?m</h2>
        <div class="row">
            <!-- B?t ??u vòng l?p d? li?u s?n ph?m -->
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="https://via.placeholder.com/300" class="card-img-top" alt="Product Image">
                    <div class="card-body">
                        <h5 class="card-title">Tên s?n ph?m</h5>
                        <p class="card-text">Mô t? s?n ph?m</p>
                        <p class="card-text">Giá: $XX.XX</p>
                        <div class="text-center">
                            <!-- Nút thêm vào gi? hàng -->
                            <button class="btn btn-success addToCartBtn" data-product-id="1">Thêm vào gi? hàng</button>
                            <!-- Nút mua ngay -->
                            <button class="btn btn-primary buyNowBtn" data-product-id="1">Mua ngay</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- K?t thúc vòng l?p d? li?u s?n ph?m -->
        </div>
    </div>

    <!-- Include Bootstrap's JavaScript and jQuery (required for Bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script>
        // X? lý s? ki?n khi ng??i dùng nh?p vào nút "Thêm vào gi? hàng"
        $('.addToCartBtn').click(function() {
            var productId = $(this).data('product-id');
            // Th?c hi?n các hành ??ng c?n thi?t, ch?ng h?n nh? thêm s?n ph?m vào gi? hàng
            // B?n có th? s? d?ng AJAX ?? g?i yêu c?u ??n máy ch? ?? thêm s?n ph?m vào gi? hàng
            // Ví d?: $.post('add-to-cart.php', { productId: productId }, function(response) { ... });
            alert("Thêm s?n ph?m có ID " + productId + " vào gi? hàng thành công!");
        });

        // X? lý s? ki?n khi ng??i dùng nh?p vào nút "Mua ngay"
        $('.buyNowBtn').click(function() {
            var productId = $(this).data('product-id');
            // Th?c hi?n các hành ??ng c?n thi?t khi ng??i dùng mu?n mua ngay s?n ph?m
            alert("B?t ??u quá trình thanh toán cho s?n ph?m có ID " + productId);
        });
    </script>
</body>
</html>

