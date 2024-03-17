<%-- 
    Document   : VeiwGroups
    Created on : Jan 13, 2024, 10:30:17 AM
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
            .modal-title {
                color: #000 !important; /* Đặt màu chữ */
                font-size: 1.25rem !important; /* Đặt font size */
            }
        </style>
    </head>
    <body>
        <jsp:include page="../Header and footer/HeaderSale.jsp"></jsp:include>
            <div class="container mt-5">

                <h1>Quản Lý Trạng Thái</h1>
                <div><a href="groups?mod=1" class="btn btn-primary mb-3">Tạo trạng thái mới</a></div>

                <div class="btn-group mb-3">
                    <a href="groups" class="btn btn-secondary">Tất cả trạng thái</a>
                    <a href="groups?show=active" class="btn btn-success">Trạng thái hoạt động</a>
                    <a href="groups?show=updated" class="btn btn-warning">Trạng thái vừa cập nhật</a>
                    <a href="groups?show=deleted" class="btn btn-danger">Trạng thái không hoạt động</a>
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
                    <c:forEach var="group" items="${data}">
                        <!-- Check if the group should be displayed based on the 'show' parameter -->
                        <c:choose>
                            <c:when test="${empty param.show || param.show eq 'all'}">
                                <!-- Display all groups -->
                                <tr>
                                    <td>${group.id}</td>
                                    <td>${group.name}</td>
                                    <td>${group.description}</td>
                                    <td>${group.created_at}</td>
                                    <td>${group.updated_at}</td>
                                    <td>${group.deleted_at}</td>
                                    <td>
                                        <a href="groups?mod=2&id=${group.getId()}" class="btn btn-info btn-sm">Cập nhật</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${group.getId()}">
                                            Xóa
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${group.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Bạn có chắc chắn muốn ngừng hoạt động ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                                        <a href="groups?mod=3&id=${group.getId()}" class="btn btn-danger">Xóa</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'active' && empty group.deleted_at}">
                                <!-- Display only active groups -->
                                <tr>
                                    <td>${group.id}</td>
                                    <td>${group.name}</td>
                                    <td>${group.description}</td>
                                    <td>${group.created_at}</td>
                                    <td>${group.updated_at}</td>
                                    <td>${group.deleted_at}</td>
                                    <td>
                                        <a href="groups?mod=2&id=${group.getId()}" class="btn btn-info btn-sm">Cập nhật</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${group.getId()}">
                                            Xóa
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${group.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Bạn có chắc chắn muốn ngừng hoạt động ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                                        <a href="groups?mod=3&id=${group.getId()}" class="btn btn-danger">Xóa</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'updated' && not empty group.updated_at}">
                                <!-- Display only updated groups -->
                                <tr>
                                    <td>${group.id}</td>
                                    <td>${group.name}</td>
                                    <td>${group.description}</td>
                                    <td>${group.created_at}</td>
                                    <td>${group.updated_at}</td>
                                    <td>${group.deleted_at}</td>
                                    <td>
                                        <a href="groups?mod=2&id=${group.getId()}" class="btn btn-info btn-sm">Cập nhật</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${group.getId()}">
                                            Xóa
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${group.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Xác nhận xóa</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Bạn có chắc chắn muốn ngừng hoạt động ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                                        <a href="groups?mod=3&id=${group.getId()}" class="btn btn-danger">Xóa</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:when>
                            <c:when test="${param.show eq 'deleted' && not empty group.deleted_at}">
                                <!-- Display only deleted groups -->
                                <tr>
                                    <td>${group.id}</td>
                                    <td>${group.name}</td>
                                    <td>${group.description}</td>
                                    <td>${group.created_at}</td>
                                    <td>${group.updated_at}</td>
                                    <td>${group.deleted_at}</td>
                                    <td>
                                        <!-- Add a button to restore the group -->
                                        <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#confirmRestoreModal${group.id}">
                                            Khôi phục
                                        </button>
                                        <!-- Restore Confirmation Modal -->
                                        <div class="modal fade" id="confirmRestoreModal${group.id}" tabindex="-1" role="dialog" aria-labelledby="confirmRestoreModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmRestoreModalLabel">Xác nhận khôi phục</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Bạn có chắc chắn muốn khôi phục hoạt động ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                                        <form method="POST" action="groups">
                                                            <input type="hidden" name="id" value="${group.id}">
                                                            <button type="submit" class="btn btn-warning btn-sm" name="restore">Khôi phục</button>
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
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Include Bootstrap's JavaScript and Popper.js (optional) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>