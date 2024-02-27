<%-- 
    Document   : UpdatePDetail
    Created on : Feb 26, 2024, 8:14:11 AM
    Author     : lucdu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product Details</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                min-height: 100vh;
                display: flex;
                align-items: center;
            }
            .card {
                border: none;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .btn-primary {
                background-color: #0d6efd;
                border-color: #0d6efd;
            }
            .btn-primary:hover {
                background-color: #0b5ed7;
                border-color: #0b5ed7;
            }
            .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
            }
            .btn-secondary:hover {
                background-color: #545b62;
                border-color: #4e555b;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card mx-auto p-4">
                <h1 class="text-center mb-4">Update Product Details</h1>
                <form name="form" action="productdetails" method="POST" enctype="multipart/form-data" onsubmit="return validateForm();">
                    <input type="hidden" class="form-control" name="id" value="${pDetail.getId()}">
                    <div class="mb-3">
                        <label for="product_id" class="form-label">Product Name:</label>
                        <select id="product_id" name="product_id" class="form-select" required>
                            <option value="0">Please select a product</option>
                            <c:forEach items="${data1}" var="c">
                                <c:choose>
                                    <c:when test="${pDetail.getProduct().getId() eq c.getId()}">
                                        <option selected value="${c.getId()}">${c.getName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${c.getId()}">${c.getName()}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                        <span id="error-message-product" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="color_id" class="form-label">Color:</label>
                        <select id="color_id" name="color_id" class="form-select" required>
                            <option value="0">Please select a color</option>
                            <c:forEach items="${data2}" var="c">
                                <c:choose>
                                    <c:when test="${pDetail.getColor().getId() eq c.getId()}">
                                        <option selected value="${c.getId()}">${c.getName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${c.getId()}">${c.getName()}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                        <span id="error-message-color" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="size_id" class="form-label">Size:</label>
                        <select id="size_id" name="size_id" class="form-select" required>
                            <option value="0">Please select a size</option>
                            <c:forEach items="${data3}" var="c">
                                <c:choose>
                                    <c:when test="${pDetail.getSize().getId() eq c.getId()}">
                                        <option selected value="${c.getId()}">${c.getName()}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${c.getId()}">${c.getName()}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                        <span id="error-message-size" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="inventory" class="form-label">Inventory:</label>
                        <input type="number" class="form-control" id="inventory" name="inventory" value="${pDetail.getInventory_number()}" required>
                        <span id="error-message-inventory" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="image1" class="form-label">Image 1:</label>
                        <input type="file" class="form-control" id="image1" name="image1" accept="image/*">
                        <img src="images/${pDetail.getImage_url_1()}" alt="Current Image 1" style="max-width: 100px; max-height: 100px;">
                    </div>
                    <div class="mb-3">
                        <label for="image2" class="form-label">Image 2:</label>
                        <input type="file" class="form-control" id="image2" name="image2" accept="image/*">
                        <img src="images/${pDetail.getImage_url_2()}" alt="Current Image 2" style="max-width: 100px; max-height: 100px;">
                    </div>
                    <div class="mb-3">
                        <label for="image3" class="form-label">Image 3:</label>
                        <input type="file" class="form-control" id="image3" name="image3" accept="image/*">
                        <img src="images/${pDetail.getImage_url_3()}" alt="Current Image 3" style="max-width: 100px; max-height: 100px;">
                    </div>
                    <div class="mb-3">
                        <label for="image4" class="form-label">Image 4:</label>
                        <input type="file" class="form-control" id="image4" name="image4" accept="image/*">
                        <img src="images/${pDetail.getImage_url_4()}" alt="Current Image 4" style="max-width: 100px; max-height: 100px;">
                    </div>
                    <button type="submit" class="btn btn-primary" name="update">Save</button>
                    <a href="productdetails" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>

        <!-- Include Bootstrap JS (if needed) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                    function validateForm() {
                        var product_id = document.getElementById("product_id").value;
                        var color_id = document.getElementById("color_id").value;
                        var size_id = document.getElementById("size_id").value;
                        var inventory = document.getElementById("inventory").value;
                        var errorMessageProduct = document.getElementById("error-message-product");
                        var errorMessageColor = document.getElementById("error-message-color");
                        var errorMessageSize = document.getElementById("error-message-size");
                        var errorMessageInventory = document.getElementById("error-message-inventory");
                        // Set error messages to empty before checking
                        errorMessageProduct.innerHTML = "";
                        errorMessageColor.innerHTML = "";
                        errorMessageSize.innerHTML = "";
                        errorMessageInventory.innerHTML = "";
                        if (product_id === "0") {
                            errorMessageProduct.innerHTML = "Please select a product";
                            return false;
                        }
                        if (color_id === "0") {
                            errorMessageColor.innerHTML = "Please select a color";
                            return false;
                        }
                        if (size_id === "0") {
                            errorMessageSize.innerHTML = "Please select a size";
                            return false;
                        }
                        if (inventory === "") {
                            errorMessageInventory.innerHTML = "Please enter inventory";
                            return false;
                        }
                        return true;
                    }
        </script>

    </body>
</html>
