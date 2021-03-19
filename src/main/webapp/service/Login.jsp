<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 1/7/2021
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <!-- <title>Popup Login Form Design | CodingNepal</title> -->
    <link rel="stylesheet" href="/css/loginCss.css">

</head>
<body>
<div class="center">
    <div class="container">
        <div class="text">
            Login Form</div>
        <form action="/userServlet?action=login" method="post">
            <div class="data">
                <label>Email or Phone</label>
                <input type="text" name="username" >
            </div>
            <div class="data">
                <label>Password</label>
                <input type="password" name="password" >
            </div>
            <div class="forgot-pass">
                <a href="#">Forgot Password?</a></div>
            <div class="btn">
                <div class="inner">
                </div>
                <button type="submit">login</button>
            </div>
            <div class="signup-link">
                Not a member? <a href="#">Signup now</a></div>
        </form>
    </div>
</div>
</body>
</html>
