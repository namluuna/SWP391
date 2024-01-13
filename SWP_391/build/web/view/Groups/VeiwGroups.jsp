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
    </head>
    <body>
         <a href="employees?mod=1">create new Groups</a>
        <h1>List of Groups</h1>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Created_at</th>
            <th>Deleted_at</th>
        </tr>
        
        <!-- Loop through the employees and display their information -->
        <c:forEach var="groups" items="${data}">
            <tr>
                <td>${groups.id}</td>
                <td>${groups.name}</td>
                <td>${groups.description}</td>
                <td>${groups.created_at}</td>
                <td>${groups.deleted_at}</td>
                <td><a href="">select</a></td>
                <td><a href="">delete</a></td>
            </tr>
        </c:forEach>
    </table>
    </body>
</html>
