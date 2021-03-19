<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 3/13/2021
  Time: 10:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</head>
<body>
<form action="createUser" method="post" enctype="multipart/form-data">
    <div class="form-row">
        <div class="form-group">
            <label for="namePlayer">Full Name: </label>
            <input type="text" class="form-control" id="namePlayer" name="namePlayer" placeholder="Name">
        </div>
        <div class="form-group col-md-6">
            <label for="nameAccount">Account</label>
            <input type="text" name="nameAccount" class="form-control" id="nameAccount" placeholder="Password">
        </div>
    </div>
    <div class="form-group col-md-6">
        <label for="passAccount">Password</label>
        <input type="text" name="passAccount" class="form-control" id="passAccount" placeholder="1234 Main St">
    </div>
    <div class="form-group">
        <label for="avatar">Avatar</label>
        <input type="file" name="avatar" class="form-control" id="avatar" placeholder="Avatar">
    </div>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="displayName">Display Name</label>
            <input type="text" name="displayName" class="form-control" id="displayName">
        </div>
        <c:if test="${user!=null}">
        <div class="form-group col-md-4">
            <label for="typeAccount">Type Account</label>
            <select id="typeAccount" name="typeAccount" class="form-control">
                <option selected>Choose...</option>
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
            </select>
        </div>
        <div class="form-group col-md-2">
            <label for="active_account">State</label>
            <select id="active_account" name="active_account" class="form-control">
                <option selected>Choose...</option>
                <option value="active">Active</option>
                <option value="block">Block</option>
            </select>
        </div>
        </c:if>
    </div>
    <div class="form-group">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
                Check me out
            </label>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Sign in</button>
</form>
</body>
</html>
