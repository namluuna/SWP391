<%-- 
    Document   : colorList
    Created on : Jan 21, 2024, 2:46:45 AM
    Author     : Admin
--%>
<%@ page import="model.product.Color" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Color List</title>
     <script>
        function submitUpdateForm(id) {
             // Tạo một form
        var form = document.createElement("form");
        form.action = "updateColor.jsp";
        form.method = "post";

        // Tạo một input hidden để chứa giá trị id
        var inputId = document.createElement("input");
        inputId.type = "hidden";
        inputId.name = "id";
        inputId.value = id;

        // Thêm input hidden vào form
        form.appendChild(inputId);

        // Tạo input text để nhập thông tin cập nhật
        var inputName = document.createElement("input");
        inputName.type = "text";
        inputName.name = "name";
        inputName.placeholder = "Enter name";

        var inputDescription = document.createElement("input");
        inputDescription.type = "text";
        inputDescription.name = "description";
        inputDescription.placeholder = "Enter description";

        // Thêm input text vào form
        form.appendChild(inputName);
        form.appendChild(inputDescription);

        // Tạo nút submit
        var submitButton = document.createElement("button");
        submitButton.type = "submit";
        submitButton.innerText = "Submit";

        // Thêm nút submit vào form
        form.appendChild(submitButton);

        // Hiển thị form và chờ người dùng nhập thông tin
        var result = prompt("Enter color information:");
        if (result !== null) {
            // Nếu người dùng nhập thông tin, thêm form vào body và submit form
            document.body.appendChild(form);
            form.submit();
        }
        }
    </script>
</head>
<body>
    <h1>Color List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Created At</th>
                <th>Deleted At</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% List<Color> colorList = (List<Color>) request.getAttribute("colorList");
               for (Color color : colorList) { %>
                <tr>
                    <td><%= color.getId() %></td>
                    <td><%= color.getName() %></td>
                    <td><%= color.getDescription() %></td>
                    <td><%= color.getCreated_at() %></td>
                    <td><%= color.getDeleted_at() %></td>
                    <td>
                        <!-- Form to update a color -->
                        <form action="updateColor.jsp" method="post" style="display: inline;">
                            <input type="hidden" name="id" value="<%= color.getId() %>">
                            <button type="submit">Update</button>
                        </form>
                        
                        <!-- Form to delete a color -->
                        <form action="DeleteColorController" method="get" style="display: inline;">
                            <input type="hidden" name="id" value="<%= color.getId() %>">
                            <button type="submit">Delete</button>
                            <button type="button" onclick="submitUpdateForm('<%= color.getId() %>')">Update</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>