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
        <title>JSP Page</title>
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
                <form action="#" method="post">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>

                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>

                    <label for="phone">Phone:</label>
                    <input type="tel" id="phone" name="phone" pattern="[0-9]{10}" required>


                    <label for="province">Province:</label>
                    <select id="province" name="province" required>
                        <c:forEach items="${provinces}" var="c">
                            <option value="${c.code}">${c.name}</option>
                        </c:forEach>
                    </select>

                    <label for="district">District:</label>
                    <select id="district" name="district" required>
                        <c:forEach items="${districts}" var="c">
                            <option value="${c.code}">${c.name}</option>
                        </c:forEach>
                    </select>

                    <label for="ward">Ward:</label>
                    <select id="ward" name="ward" required>
                        <c:forEach items="${wards}" var="c">
                            <option value="${c.code}">${c.name}</option>
                        </c:forEach>
                    </select>
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" rows="4" required></textarea>
                    <button type="submit">Register</button>
                    <br>
                    <div class="input-image">
                        <div>
                            <label for="input">
                                Choose Image <br />
                                <i class="fa-solid fa-camera"></i>
                                <input class="field image-name" id="input" type="file" name="image" style="display: none"
                                       required />
                            </label>
                        </div>
                        <h6 class="empty-alert">
                            Don't forget to upload an image of your product!
                        </h6>
                        <img src="./img/imgPreview.jpg" alt="" class="input-image__display" />
                    </div>
                </form>

            </div>

        </div>
    </body>
</html>
