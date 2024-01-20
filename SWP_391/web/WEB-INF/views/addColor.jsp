<%-- 
    Document   : addColor
    Created on : Jan 21, 2024, 3:45:50 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Color</title>
</head>
<body>
    <h2>Add Color</h2>
    <form action="AddColorController" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea><br>

        <button type="submit">Add Color</button>
    </form>

    <br>
    <a href="LoadColorController">Back to Color List</a>
</body>
</html>
