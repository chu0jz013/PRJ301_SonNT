<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                background-color: #e2e2e2;
                font-family: Arial, Helvetica, sans-serif;
                line-height: 1.8;
                font-size: 14px;
                color: #444444;
            }
            .container {
                background-color: #ffffff;
                margin: 0 auto;
                padding: 60px;
                width: 500px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.3);
                text-align: center;
            }
            h2 {
                color: #FFA500;
                font-size: 30px;
                font-weight: 700;
                margin-bottom: 20px;
            }
            input[type=text], input[type=password] {
                padding: 15px;
                width: 100%;
                border: none;
                border-bottom: 2px solid #004c9e;
                border-radius: 0px;
                margin-bottom: 20px;
                font-size: 16px;
                color: #444444;
                font-weight: 600;
                background-color: #f2f2f2;
                outline: none;
                transition: all .3s ease-in-out;
            }
            input[type=text]:focus, input[type=password]:focus {
                border-bottom: 2px solid #ff6600;
            }
            input[type=submit] {
                background-color: #004c9e;
                color: #ffffff;
                padding: 15px;
                border: none;
                border-radius: 30px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 600;
                transition: all .3s ease-in-out;
            }
            input[type=submit]:hover {
                background-color: #ff6600;
            }
            .error {
                color: red;
                margin-bottom: 10px;
                text-align: left;
                font-size: 14px;
                font-weight: 600;
                text-align: center;
            }
            .success {
                color: green;
                margin-bottom: 10px;
                text-align: left;
                font-size: 14px;
                font-weight: 600;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <img width="300px" src="https://upload.wikimedia.org/wikipedia/vi/1/1d/Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_FPT.png" alt="FPT University logo">
            <h2>FPT University Academic Portal</h2>
            <%-- Display error/success message --%>
            <c:if test="${not empty errorMessage}">
                <p class="error">${errorMessage}</p>
            </c:if>
            <c:if test="${not empty successMessage}">
                <p class="success">${successMessage}</p>
            </c:if>
            <form action="login" method="post">
                <input type="text" id="username" name="username" placeholder="Username" required><br>

                <input type="password" id="password" name="password" placeholder="Password" required><br>

                <input type="submit" value="LOGIN">
            </form>
            <p>Power by <a href="https://www.facebook.com/namhaikieuu/">Nam Hai Kieu</a></p>
        </div>

    </body>
</html>
