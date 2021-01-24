<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 1/12/2021
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>User Management</title>
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

<h1 style="padding-left: 40%"> Manager Customer</h1>
    <h3 >
        <a href="/userServlet/Create">Add New User</a>
    </h3>
    <h3>
        <div class="row" >
            <div class="col-2" style="margin-right: 5px"> Search for: </div>
                <div class="col-2" style="margin-right: 5px">
                    <input type="text" id="NamePlayer" onkeyup="searchFor()" placeholder="NamePlayer" >
                </div>
                <p class="col-1"></p>
                <div class="col-2" style="margin-right: 5px">
                    <input type="text" id="DisplayName" onkeyup="searchFor()" placeholder="DisplayName" >
                </div>
        </div>
    </h3>
<table class="table table-light col-11" id="management" align="center">
    <thead>
    <tr>
        <th scope="col">NamePlayer</th>
        <th scope="col">DisplayName </th>
        <th scope="col">Account</th>
        <th scope="col">PointGame</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.namePlayer}</td>
            <td>${user.displayName}</td>
            <td>${user.typeAccount}</td>
            <td>${user.pointGame}</td>
            <td><a href="/userServlet?action=edit${user.idUser}">Edit </a>
                |
                <a href="/userServlet?action=delete${user.idUser}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
<script>
    function searchFor() {
        let inputNamePlayer,inputDisplayName,inputAccount,inputPointGame ,table, tr;
        let txtNamePlayer,txtDisplayName,txtPointGame,txtAccount;
        let tdNamePlayer,tdDisplayName,tdPointGame,tdAccount;
        let check,check1;
        inputNamePlayer=document.getElementById("NamePlayer").value.toUpperCase();
        inputDisplayName=document.getElementById("DisplayName").value.toUpperCase();
        // inputPointGame=document.getElementById("PointGame").value.toUpperCase();
        // inputAccount=document.getElementById("TypeAccount").value.toUpperCase();
        table=document.getElementById("management");
        tr=table.getElementsByTagName("tr");
        for (let i = 0; i < tr.length; i++) {
            tdNamePlayer=tr[i].getElementsByTagName("td")[0];
            tdDisplayName=tr[i].getElementsByTagName("td")[1];
            // tdAccount=tr[i].getElementsByTagName("td")[2];
            // tdPointGame=tr[i].getElementsByTagName("td")[3];
            if ( tdNamePlayer) {
                txtNamePlayer = tdNamePlayer.textContent || tdNamePlayer.innerText;
                if (txtNamePlayer.toUpperCase().indexOf(inputNamePlayer)>-1){
                    check=true;
                }else {
                    check=false;
                }
            }else {
                check=true;
            }
            if (tdDisplayName){
                txtDisplayName = tdDisplayName.textContent || tdDisplayName.innerText;
                if (txtDisplayName.toUpperCase().indexOf(inputDisplayName)>-1){
                    check1=true;
                }else check1=false;
            }else check1=true;
            if (check1 && check){
                tr[i].style.display="";
            }else {
                tr[i].style.display="none";
            }
        }
    }
</script>
</html>
