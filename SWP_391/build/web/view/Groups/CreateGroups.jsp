<%-- 
    Document   : CreateGroups
    Created on : Jan 15, 2024, 9:25:58 AM
    Author     : lucdu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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
        <h1 class="text-center mb-4">Create New Groups</h1>
        <form>
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description:</label>
                <input type="text" class="form-control" id="description" name="description">
            </div>
            <div class="mb-3">
                <label for="created_at" class="form-label">Created_at:</label>
                <input type="datetime" class="form-control" id="created_at" name="created_at">
            </div>
            <div class="mb-3">
                <label for="deleted_at" class="form-label">Deleted_at:</label>
                <input type="datetime" class="form-control" id="deleted_at" name="deleted_at">
            </div>
            <button type="submit" class="btn btn-primary" name="add">ADD</button>
        </form>
    </div>
</div>

<!-- Thêm Bootstrap JS (nếu cần) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
