<%-- 
    Document   : TokenExpired
    Created on : Jan 21, 2024, 3:44:42 PM
    Author     : ifyou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
    <body>
        <div class="thank-container">
            <h1>Your password reset token have been expired</h1>
            <p>Please reset password again!</p>
            <div class="btn-container">
                <a href="#" class="btn">Go to Home Page</a>
            </div>
        </div>
    </body>
</html>
