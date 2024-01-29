<%-- 
    Document   : register
    Created on : Jan 15, 2024, 10:48:17 AM
    Author     : ifyou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>
            body {
                font-family: "Comic Sans MS", cursive;
                margin: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                background: #f5f5f5;
                color: #333;
            }

            .container {
                width: 100%;
                max-width: 400px;
            }

            .card {
                width: 100%;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                color: #333;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            input, select, textarea{
                padding: 10px;
                margin-bottom: 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                transition: border-color 0.3s ease-in-out;
                outline: none;
                color: #333;
            }

            input:focus {
                border-color: #ff4500;
            }

            textarea:focus {
                border-color: #ff4500;
            }

            select:focus {
                border-color: #ff4500;
            }

            button {
                background-color: #ff4500;
                color: #fff;
                padding: 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease-in-out;
            }

            button:hover {
                background-color: #e63900;
            }
            .links {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }
            a:link,
            a:visited,
            a:hover,
            a:active {
                text-decoration: none;
            }

            a {
                color: #000;
                font-size: 0.88rem;
                font-weight: 600;
                letter-spacing: -1px;
                transition: all 0.4s ease;
            }

            a:hover {
                color: rgb(13, 133, 185);
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="card">
                <h2>Register</h2>
                <form action="/SWP_391/register" method="post">
                    <label for="fullName">Full Name:</label>
                    <input type="fullName" id="fullName" name="fullName" value="${name}" required >

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${email}" required>
                    <c:if test="${not empty errorEmailMessage}">
                        <p style="color: red;">${errorEmailMessage}</p> 
                    </c:if>
                    <!--<p style="color: red;">${errorEmailMessage}</p>--> 
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="${password}" required>

                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" value="${confirmPassword}" required>
                    <c:if test="${not empty errorConfirmPasswordMessage}">
                        <p style="color: red;">${errorConfirmPasswordMessage}</p> 
                    </c:if>
                    <label for="phone">Phone:</label>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" value="${phone}" required>


                    <label for="province">Province:</label>
                    <select id="province" name="province" required>
                        <c:choose>
                            <c:when test="${not empty selectedProvince}">
                                <option value="${selectedProvince.code}">${selectedProvince.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="1">Select Your Province</option>
                            </c:otherwise>
                        </c:choose>                     
                        <c:forEach items="${provinces}" var="c">
                            <option value="${c.code}">${c.name}</option>
                        </c:forEach>
                    </select>

                    <label for="district">District:</label>
                    <select id="district" name="district" required>
                        <c:choose>
                            <c:when test="${not empty selectedDistrict}">
                                <option value="${selectedDistrict.code}">${selectedDistrict.name}</option>
                            </c:when>
                            <c:otherwise>
                                    <option value=""></option>
                            </c:otherwise>
                        </c:choose>   
                    </select>

                    <label for="ward">Ward:</label>
                    <select id="ward" name="ward" required>
                        <c:choose>
                            <c:when test="${not empty selectedWard}">
                                <option value="${selectedWard.code}">${selectedWard.name}</option>
                            </c:when>
                            <c:otherwise>
                                    <option value=""></option>
                            </c:otherwise>
                        </c:choose> 
                    </select>
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" rows="4" value="${address}" required></textarea>
                    <button type="submit">Register</button>
                    <br>
                </form>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#province").change(function () {
                var selectedProvince = $(this).val();
                $.ajax({
                    url: "/SWP_391/DistrictServlet",
                    method: "POST",
                    data: {provinceCode: selectedProvince},
                    success: function (data) {
                        $("#district").html(data);
                        $("#ward").html("<option value=''>Select Ward</option>");
                    }
                });
            });
            $("#district").change(function () {
                var selectedDistrict = $(this).val();
                $.ajax({
                    url: "/SWP_391/WardServlet",
                    method: "POST",
                    data: {districtCode: selectedDistrict},
                    success: function (data) {
                        $("#ward").html(data);
                    }
                });
            });
        });
    </script>
</html>
