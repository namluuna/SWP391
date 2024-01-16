<%-- 
    Document   : UpdateGroups
    Created on : Jan 16, 2024, 3:00:02 PM
    Author     : lucdu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Upadate Groups</title>
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
    </style>
</head>
<body>

<div class="container">
    <div class="card mx-auto p-4">
        <h1 class="text-center mb-4">Update Groups</h1>
        <form name="form" action="groups" method="POST">
            <div class="mb-3">
                <label for="id" class="form-label">GroupsID:</label>
                <input type="text" class="form-control" id="id" name="id" value="${ga.getId()}">
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name" value="${ga.getName()}">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <input type="text" class="form-control" id="description" name="description" value="">
            </div>
            <button type="submit" class="btn btn-primary" name="update">UPDATE</button>
        </form>
    </div>
</div>

<!-- Thêm Bootstrap JS (nếu cần) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
