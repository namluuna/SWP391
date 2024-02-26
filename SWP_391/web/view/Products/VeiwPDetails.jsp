<%-- 
    Document   : VeiwPDetails
    Created on : Feb 25, 2024, 7:33:00 PM
    Author     : lucdu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Group Management</title>
        <!-- Include Bootstrap stylesheet -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Optional: Add custom styles here */
        </style>
    </head>
    <body>
        <jsp:include page="../Groups/header.jsp"></jsp:include>

            <div class="container mt-5">

                <h1>Quản Lý Sản Phẩm</h1>
                <div><a href="productdetails?mod=1" class="btn btn-primary mb-3">Tạo sản phẩm mới</a></div>

                <div class="btn-group mb-3">
                    <a href="productdetails" class="btn btn-secondary">Tất cả sản phẩm</a>
                    <a href="productdetails?show=active" class="btn btn-success">Sản phẩm hoạt động</a>
                    <a href="productdetails?show=updated" class="btn btn-warning">Sản phẩm vừa cập nhật</a>
                    <a href="productdetails?show=deleted" class="btn btn-danger">Sản phẩm không hoạt động</a>
                </div>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>Tên sản phẩm</th>
                            <th>Màu sắc</th>
                            <th>Kích thước</th>
                            <th>Số lượng hàng</th>
                            <th>Ảnh 1</th>
                            <th>Ảnh 2</th>
                            <th>Ảnh 3</th>
                            <th>Ảnh 4</th>
                            <th>Ngày Tạo</th>
                            <th>Ngày Chỉnh Sửa</th>
                            <th>Ngày xóa</th>
                            <th>Chức Năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Loop through the products and display their information -->
                    <c:forEach var="pd" items="${data}">
                        <!-- Check if the product should be displayed based on the 'show' parameter -->
                        <c:choose>
                            <c:when test="${empty param.show || param.show eq 'all'}">
                                <!-- Display all products -->
                                <tr>
                                    <td>${pd.id}</td>
                                    <td>${pd.getProduct().getName()}</td>
                                    <td>${pd.getColor().getName()}</td>
                                    <td>${pd.getSize().getName()}</td>
                                    <td>${pd.getInventory_number()}</td>
                                    <td>${pd.getImage_url_1()}</td>
                                    <td>${pd.getImage_url_2()}</td>
                                    <td>${pd.getImage_url_3()}</td>
                                    <td>${pd.getImage_url_4()}</td>
                                    <td>${pd.created_at}</td>
                                    <td>${pd.edited_at}</td>
                                    <td>${pd.deleted_at}</td>
                                    <td>
                                        <a href="productdetails?mod=2&id=${pd.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${pd.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${pd.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this product?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="productdetails?mod=3&id=${pd.getId()}" class="btn btn-danger">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'active' && empty pd.deleted_at}">
                                <!-- Display only active products -->
                                <tr>
                                    <td>${pd.id}</td>
                                    <td>${pd.getProduct().getName()}</td>
                                    <td>${pd.getColor().getName()}</td>
                                    <td>${pd.getSize().getName()}</td>
                                    <td>${pd.getInventory_number()}</td>
                                    <td>${pd.getImage_url_1()}</td>
                                    <td>${pd.getImage_url_2()}</td>
                                    <td>${pd.getImage_url_3()}</td>
                                    <td>${pd.getImage_url_4()}</td>
                                    <td>${pd.created_at}</td>
                                    <td>${pd.edited_at}</td>
                                    <td>${pd.deleted_at}</td>
                                    <td>
                                        <a href="productdetails?mod=2&id=${pd.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${pd.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${pd.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this product detail?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="productdetails?mod=3&id=${pd.getId()}" class="btn btn-danger">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'updated' && not empty pd.edited_at}">
                                <!-- Display only updated products -->
                                <tr>
                                    <td>${pd.id}</td>
                                    <td>${pd.getProduct().getName()}</td>
                                    <td>${pd.getColor().getName()}</td>
                                    <td>${pd.getSize().getName()}</td>
                                    <td>${pd.getInventory_number()}</td>
                                    <td>${pd.getImage_url_1()}</td>
                                    <td>${pd.getImage_url_2()}</td>
                                    <td>${pd.getImage_url_3()}</td>
                                    <td>${pd.getImage_url_4()}</td>
                                    <td>${pd.created_at}</td>
                                    <td>${pd.edited_at}</td>
                                    <td>${pd.deleted_at}</td>
                                    <td>
                                        <a href="productdetails?mod=2&id=${pd.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${pd.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${pd.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this product?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="productdetails?mod=3&id=${pd.getId()}" class="btn btn-danger">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'deleted' && not empty pd.deleted_at}">
                                <!-- Display only deleted products -->
                                <tr>
                                    <td>${pd.id}</td>
                                    <td>${pd.getProduct().getName()}</td>
                                    <td>${pd.getColor().getName()}</td>
                                    <td>${pd.getSize().getName()}</td>
                                    <td>${pd.getInventory_number()}</td>
                                    <td>${pd.getImage_url_1()}</td>
                                    <td>${pd.getImage_url_2()}</td>
                                    <td>${pd.getImage_url_3()}</td>
                                    <td>${pd.getImage_url_4()}</td>
                                    <td>${pd.created_at}</td>
                                    <td>${pd.edited_at}</td>
                                    <td>${pd.deleted_at}</td>
                                    <td>
                                        <!-- Add a button to restore the product -->
                                        <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#confirmRestoreModal${pd.id}">
                                            Restore
                                        </button>
                                        <!-- Restore Confirmation Modal -->
                                        <div class="modal fade" id="confirmRestoreModal${pd.id}" tabindex="-1" role="dialog" aria-labelledby="confirmRestoreModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmRestoreModalLabel">Confirm Restore</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to restore this product?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <form method="POST" action="productdetails">
                                                            <input type="hidden" name="id" value="${pd.id}">
                                                            <button type="submit" class="btn btn-warning btn-sm" name="restore">Restore</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                        </c:choose>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="../Groups/footer.jsp"></jsp:include>
        <!-- Include Bootstrap's JavaScript and Popper.js (optional) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
