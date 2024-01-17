<%-- 
    Document   : login
    Created on : Jan 15, 2024, 10:48:09 AM
    Author     : ifyou
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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

            input {
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
                <h2>Login</h2>
                <form>
                    <input type="text" id="username" name="username" placeholder="Email" required>
                    <input type="password" id="password" name="password" placeholder="Password" required>
                    <button type="submit">Login</button>
                    <br>
                    <div class="links">
                        <a href="fogotpassword.jsp">Forgot password?</a>
                        <a href="/SWP_391/register">Do not have an account?</a>
                    </div>
                </form>

            </div>

        </div>

    </body>
</html>
