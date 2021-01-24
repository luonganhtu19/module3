<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 1/7/2021
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Magic Card</title>
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
      <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
      <link rel="stylesheet" href="bootstrap/icons/open-iconic-master/font/css/open-iconic.css">
      <link rel="stylesheet" href="css/index.css">

  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">

      <a class="navbar-brand" style="display: inline" href="/userServlet?action=home">
          <span class="oi" style="padding-right: 7px" data-glyph="sun"></span>
          Magic Card
      </a>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
              <li class="nav-item " >
                  <a class="nav-link" href="/userServlet?action=home" style="display: inline !important;position: fixed">
                      <span class="oi" data-glyph="home" title="icon name" aria-hidden="true"/>
                      New
                  </a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="/userServlet?action=playGame">PlayGame</a>
              </li>
              <c:if test="${user!=null}">
              <li class="nav-item dropdown" style="display: inline">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="display: inline !important;position: fixed">
                      Task
                  </a>
                  <div class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item text-white bg-dark"  href="#">Profile</a>
                      <c:if test="${user.typeAccount=='admin'}">
                      <a class="dropdown-item text-white bg-dark"  href="/userServlet?action=ManagerCustomer">Manager Customer</a>
                      </c:if>
                      <a class="dropdown-item text-white bg-dark"  href="#">Ranking</a>
                      <a class="dropdown-item text-white bg-dark"  href="#">History</a>
                      <a class="dropdown-item text-white bg-dark" href="#">Shop</a>
                  </div>
              </li>
              </c:if>
              <li class="nav-item">
                  <a class="nav-link" href="#"> Introduction</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#">Contact</a>
              </li>
              <li></li>
                <c:choose>
              <c:when test="${user==null}">
              <li class="nav-item">
                  <a class="nav-link" href="/userServlet?action=login">Login</a>
              </li>
              </c:when>
               <c:otherwise>
                   <li class="nav-item">
                       <a class="nav-link" href="/userServlet?action=logout">Logout</a>
                   </li>
               </c:otherwise>
                </c:choose>
          </ul>
      </div>
  </nav>
  <c:if test="${path==null}">
      <c:set var="path" scope="request" value="Game/News.jsp"/>
  </c:if>
  <iframe src="${path}" referrerpolicy="same-origin" frameborder="1" width="100%" height="500px">
  </iframe>
  </body>
</html>
