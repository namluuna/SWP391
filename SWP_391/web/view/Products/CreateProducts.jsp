<%-- 
    Document   : CreateProducts
    Created on : Feb 6, 2024, 7:28:23 PM
    Author     : lucdu
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categories.Category" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Groups</title>
        <!-- Thêm Bootstrap CSS -->
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
                background-color: #007bff;
                border-color: #007bff;
            }
            .btn-primary:hover {
                background-color: #0056b3;
                border-color: #0056b3;
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
        <%
    List<Category> data1 = new ArrayList<>();
    if(request.getAttribute("data1") != null)
        data1 = (List<Category>) request.getAttribute("data1");
        %>
        <div class="container">
            <div class="card mx-auto p-4">
                <h1 class="text-center mb-4">Tạo sản phẩm mới</h1>
                <form name="form" action="products" method="POST" onsubmit="return validateForm();">
                    <div class="mb-3">
                        <label for="code" class="form-label">Mã sản phẩm:</label>
                        <input type="text" class="form-control" id="code" name="code">
                        <span id="error-message-name" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên sản phẩm:</label>
                        <input type="text" class="form-control" id="name" name="name">
                        <span id="error-message-name" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Mô tả sản phẩm:</label>
                        <input type="text" class="form-control" id="description" name="description">
                        <span id="error-message-description" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Giá tiền:</label>
                        <input type="text" class="form-control" id="price" name="price">
                        <span id="error-message-description" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="category_id" class="form-label">Loại giày:</label>
                        <select name="category_id">
                            <option value="0">ALL</option>
                            <%
                            for(Category c:data1){
                            out.print("<option value='"+c.getId()+"'>"+c.getName()+"</option>");
                                }
                            %>
                        </select>
                        <!--                        <input type="text" class="form-control" id="category_id" name="category_id">-->
                        <span id="error-message-description" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="form_id" class="form-label">Kiểu dáng:</label>
                        <input type="text" class="form-control" id="form_id" name="form_id">
                        <span id="error-message-description" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="brand_id" class="form-label">Hãng giày:</label>
                        <input type="text" class="form-control" id="brand_id" name="brand_id">
                        <span id="error-message-description" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="material_id" class="form-label">Dòng sản phẩm:</label>
                        <input type="text" class="form-control" id="material_id" name="material_id">
                        <span id="error-message-description" style="color: red;"></span>
                    </div>
                    <div class="mb-3">
                        <label for="group_id" class="form-label">Trạng thái sản phẩm:</label>
                        <input type="text" class="form-control" id="group_id" name="group_id">
                        <span id="error-message-description" style="color: red;"></span>
                    </div>
                    <button type="submit" class="btn btn-primary" name="add">ADD</button>
                    <a href="products" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>

        <!-- Thêm Bootstrap JS (nếu cần) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                    function validateForm() {
                        var name = document.getElementById("name").value.trim();
                        var description = document.getElementById("description").value.trim();
                        var errorMessageName = document.getElementById("error-message-name");
                        var errorMessageDescription = document.getElementById("error-message-description");

                        // Đặt thông báo lỗi thành trống trước khi kiểm tra
                        errorMessageName.innerHTML = "";
                        errorMessageDescription.innerHTML = "";

                        if (name === "") {
                            errorMessageName.innerHTML = "Please enter a name";
                            return false;
                        }

                        if (description === "") {
                            errorMessageDescription.innerHTML = "Please enter a description";
                            return false;
                        }

                        return true;
                    }
        </script>
    </body>
</html>
