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
        <title>Forms Management</title>
        <!-- Include Bootstrap stylesheet -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Optional: Add custom styles here */
        </style>
    </head>
    <body>
        <jsp:include page="../Groups/header.jsp"></jsp:include>
        <div class="container mt-5">
            
            <h1>Forms Management</h1>
            <div><a href="Forms?mod=1" class="btn btn-primary mb-3">Create New Forms</a></div>
            
            <div class="btn-group mb-3">
                <a href="Forms" class="btn btn-secondary">All Forms</a>
                <a href="Forms?show=active" class="btn btn-success">Active Forms</a>
                <a href="Forms?show=updated" class="btn btn-warning">Updated Forms</a>
                <a href="Forms?show=deleted" class="btn btn-danger">Deleted Forms</a>
            </div>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Created_at</th>
                        <th>Updated_at</th>
                        <th>Deleted_at</th>
                        <th>Actions</th>
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
                                        <a href="Forms?mod=2&id=${group.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${group.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${group.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this form?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="Forms?mod=3&id=${group.getId()}" class="btn btn-danger">Delete</a>
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
                                        <a href="groups?mod=2&id=${group.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${group.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${group.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this form?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="Forms?mod=3&id=${group.getId()}" class="btn btn-danger">Delete</a>
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
                                        <a href="Forms?mod=2&id=${group.getId()}" class="btn btn-info btn-sm">Edit</a>
                                        <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${group.getId()}">
                                            Delete
                                        </button>
                                        <div class="modal fade" id="confirmDeleteModal${group.getId()}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete this group?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <a href="Forms?mod=3&id=${group.getId()}" class="btn btn-danger">Delete</a>
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
                                            Restore
                                        </button>
                                        <!-- Restore Confirmation Modal -->
                                        <div class="modal fade" id="confirmRestoreModal${group.id}" tabindex="-1" role="dialog" aria-labelledby="confirmRestoreModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="confirmRestoreModalLabel">Confirm Restore</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to restore this group?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <form method="POST" action="Forms">
                                                            <input type="hidden" name="id" value="${group.id}">
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