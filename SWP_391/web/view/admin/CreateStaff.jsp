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
                        <label for="gender">Giới tính:</label>
                        <select name="gender" id="gender" class="form-control" required>
                            <c:choose>
                            <option value="1" ${gender == '1' ? 'selected' : ''}>Nam</option>
                            <option value="2" ${gender == '2' ? 'selected' : ''}>Nữ</option>
                            </c:choose>
                        </select> 
                    </div>
                    <div class="mb-3">
                        Nhập Email: <input type="text" name="email"  value="${email} " id="email" class="form-control" required /><br>
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
                                <option value="2" ${role == '2' ? 'selected' : ''}>Nhân viên bán hàng</option>
                            </c:choose>
                        </select>
                    </div>                  
                    <div class="mb-3">   
                        <label for="slot">Ca làm:</label>
                        <select name="slot" id="slot" class="form-control" required>
                            <c:choose>
                            <option value="1"  ${slot == '1' ? 'selected' : ''} >Ca sáng (7h30-11h30)</option>
                            <option value="2"  ${slot == '2' ? 'selected' : ''}>Ca chiều (13h30-17h30)</option>
                            <option value="3"  ${slot == '3' ? 'selected' : ''}>Ca tối (18h-21h30)</option>
                            </c:choose>
                        </select>
                    </div>

                    <div class="mb-3">
                        Nhập tiền lương: <input type="number" name="salary" value="${salary}" class="form-control" required /><br>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-primary" >Tạo mới </button>
                    <a href="/SWP_391/staff" class="btn btn-secondary">Hủy bỏ</a>
                </form>
            </div>
        </div>
        <script>
            function validateEmail() {
                var emailInput = document.getElementById("email");
                var emailValue = emailInput.value.trim(); // Remove leading and trailing spaces

                // Check if the email is not empty and matches the required format
                if (emailValue === "" || !/(^|\s)[a-zA-Z0-9._%+-]+@(gmail\.com|fpt\.edu\.vn)\s*$/.test(emailValue)) {
                    alert("Định dạng email không đúng! Vui lòng nhập lại");
                    emailInput.focus();
                    return false;
                }

                return true;
            }
        </script>
        <script>
            document.getElementById('email').addEventListener('input', function (event) {
                var inputValue = event.target.value;

                // Kiểm tra nếu kí tự cuối cùng là khoảng trắng
                if (inputValue.charAt(inputValue.length - 1) === ' ') {
                    // Loại bỏ khoảng trắng cuối cùng
                    event.target.value = inputValue.slice(0, -1);
                }
            });

            document.getElementById('email').addEventListener('input', function (event) {
                var inputValue = event.target.value;

                // Kiểm tra nếu kí tự đầu tiên là khoảng trắng
                if (inputValue.charAt(0) === ' ') {
                    // Loại bỏ khoảng trắng đầu tiên
                    event.target.value = inputValue.trimStart();
                }
            });

            document.getElementById('email').addEventListener('input', function (event) {
                var inputValue = event.target.value;

                // Loại bỏ khoảng trắng giữa các kí tự
                event.target.value = inputValue.replace(/\s+/g, '');
            });
        </script>

    </body>
</html>
