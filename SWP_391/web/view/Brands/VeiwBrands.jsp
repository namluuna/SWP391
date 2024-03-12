<%-- 
    Document   : VeiwBrands
    Created on : Feb 2, 2024, 9:45:42 AM
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
        <jsp:include page="../Header and footer/HeaderSale.jsp"></jsp:include>
        
        <div class="container mt-5">
            
            <h1>Quản Lý Trạng Thái</h1>
            <div><a href="brands?mod=1" class="btn btn-primary mb-3">Tạo trạng thái mới</a></div>
            
            <div class="btn-group mb-3">
                <a href="brands" class="btn btn-secondary">Tất cả trạng thái</a>
                <a href="brands?show=active" class="btn btn-success">Trạng thái hoạt động</a>
                <a href="brands?show=updated" class="btn btn-warning">Trạng thái vừa cập nhật</a>
                <a href="brands?show=deleted" class="btn btn-danger">Trạng thái không hoạt động</a>
            </div>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>NO</th>
                        <th>Tên trạng thái</th>
                        <th>Mô tả trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Ngày cập nhật</th>
                        <th>Ngày xóa</th>
                        <th>Chức Năng</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through the groups and display their information -->
                    <c:forEach var="brand" items="${data}">
                        <!-- Check if the brand should be displayed based on the 'show' parameter -->
                        <c:choose>
                            <c:when test="${empty param.show || param.show eq 'all'}">
                                <!-- Display all brands -->
                                <tr>
                                    <td>${brand.id}</td>
                                    <td>${brand.name}</td>
                                    <td>${brand.description}</td>
                                    <td>${brand.created_at}</td>
                                    <td>${brand.updated_at}</td>
                                    <td>${brand.deleted_at}</td>
                                    <td>
                                        <a href="brands?mod=2&id=${brand.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${brand.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${brand.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this brand?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="brands?mod=3&id=${brand.getId()}" class="btn btn-danger">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'active' && empty brand.deleted_at}">
                                <!-- Display only active brands -->
                                <tr>
                                    <td>${brand.id}</td>
                                    <td>${brand.name}</td>
                                    <td>${brand.description}</td>
                                    <td>${brand.created_at}</td>
                                    <td>${brand.updated_at}</td>
                                    <td>${brand.deleted_at}</td>
                                    <td>
                                        <a href="brands?mod=2&id=${brand.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${brand.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${brand.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this brand?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="brands?mod=3&id=${brand.getId()}" class="btn btn-danger">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'updated' && not empty brand.updated_at}">
                                <!-- Display only updated brands -->
                                <tr>
                                    <td>${brand.id}</td>
                                    <td>${brand.name}</td>
                                    <td>${brand.description}</td>
                                    <td>${brand.created_at}</td>
                                    <td>${brand.updated_at}</td>
                                    <td>${brand.deleted_at}</td>
                                    <td>
                                        <a href="brands?mod=2&id=${brand.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${brand.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${brand.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this brand?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="brands?mod=3&id=${brand.getId()}" class="btn btn-danger">Delete</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'deleted' && not empty brand.deleted_at}">
                                <!-- Display only deleted brands -->
                                <tr>
                                    <td>${brand.id}</td>
                                    <td>${brand.name}</td>
                                    <td>${brand.description}</td>
                                    <td>${brand.created_at}</td>
                                    <td>${brand.updated_at}</td>
                                    <td>${brand.deleted_at}</td>
                                    <td>
                                        <!-- Add a button to restore the brand -->
                                        <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#confirmRestoreModal${brand.id}">
                                            Restore
                                        </button>
                                        <!-- Restore Confirmation Modal -->
                                        <div class="modal fade" id="confirmRestoreModal${brand.id}" tabindex="-1" role="dialog" aria-labelledby="confirmRestoreModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmRestoreModalLabel">Confirm Restore</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to restore this brand?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <form method="POST" action="brands">
                                                            <input type="hidden" name="id" value="${brand.id}">
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