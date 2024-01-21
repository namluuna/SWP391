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
        <title>JSP Page</title>
        <!-- Include Bootstrap stylesheet -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Optional: Add custom styles here */
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <a href="groups?mod=1" class="btn btn-primary mb-3">Create New Group</a>
            <h1>Group Management</h1>

            <div class="btn-group mb-3">
                <a href="groups" class="btn btn-secondary">All Groups</a>
                <a href="groups?show=active" class="btn btn-success">Active Groups</a>
                <a href="groups?show=updated" class="btn btn-warning">Updated Groups</a>
                <a href="groups?show=deleted" class="btn btn-danger">Deleted Groups</a>
            </div>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Created_at</th>
                        <th>Deleted_at</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Loop through the groups and display their information -->
                    <c:forEach var="group" items="${data}">
                        <tr>
                            <td>${group.id}</td>
                            <td>${group.name}</td>
                            <td>${group.description}</td>
                            <td>${group.created_at}</td>
                            <td>${group.deleted_at}</td>
                            <td>
                                <a href="" class="btn btn-info btn-sm">Select</a>
                                <a href="" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Include Bootstrap's JavaScript and Popper.js (optional) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
