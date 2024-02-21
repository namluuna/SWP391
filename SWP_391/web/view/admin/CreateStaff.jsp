<%-- 
    Document   : newjsp
    Created on : Feb 6, 2024, 10:14:24 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tạo mới nhân viên</title>
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
            .btn-secondary {
                background-color: #6c757d;
                border-color: #6c757d;
            }
            .btn-secondary:hover {
                background-color: #545b62;
                border-color: #4e555b;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card mx-auto p-4">
                <h1 class="text-center mb-4">Tạo nhân viên mới</h1>
                <form  action="/SWP_391/createStaff" method="POST" onsubmit="return validateEmail();" >
                    <div class="mb-3">
                        Nhập tên: <input type="text" name="name" value="${name}"  class="form-control" required/><br>
                    </div>
                    <div class="mb-3">
                        Nhập Email <input type="text" name="email"  value="${email} " id="email" class="form-control" required /><br>
                        <c:if test="${not empty errorEmailMessage}">
                            <p style="color: red;">${errorEmailMessage}</p> 
                        </c:if>
                    </div>
                    <div class="mb-3">
                        Nhập mật khẩu: <input type="text" name="password"  value="${password}" class="form-control" required/><br>
                    </div>
                    <div class="mb-3">
                        Nhập số điện thoại: <input type="number" name="phone" value="${phone}" class="form-control" required /><br>
                    </div>
                    <div class="mb-3">
                        <label for="role">Vai trò:</label>
                        <select id="role" name="role" class="form-control" required>
                            <c:choose>
                                <option value="" disabled selected>Chọn vai trò</option>
                                <option value="2" ${role == '2' ? 'selected' : ''}>Saler</option>
                                <option value="3" ${role == '3' ? 'selected' : ''}>Shipper</option>
                            </c:choose>
                        </select>

                    </div>

                    <button type="submit" class="btn btn-primary" >ADD</button>
                    <a href="/SWP_391/staff" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
        <script>
            function validateEmail() {
                var emailInput = document.getElementById("email");
                var emailValue = emailInput.value.trim(); // Remove leading and trailing spaces

                // Check if the email is not empty and matches the required format
                if (emailValue === "" || !/(^|\s)[a-zA-Z0-9._%+-]+@(gmail\.com|fpt\.edu\.vn)\s*$/.test(emailValue)) {
                    alert("Email phải được định dạng có'@gmail.com' hoặc '@fpt.edu.vn'.");
                    emailInput.focus();
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
