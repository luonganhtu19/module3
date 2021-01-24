<%--
  Created by IntelliJ IDEA.
  User: luong
  Date: 1/12/2021
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="bg">
    <div class="container">
        <div class="nav">
            <div class="Player" id="player1">
                <div class="container1" style="width: 100%">
                    <img src="/img/sepci/player1.jpg" style="padding-left: 15%;padding-top: 10%" height="100%"
                         width="70%"/>
                    <p style="padding-left:  15%;line-height: 15%" id="name">Name &emsp;&nbsp;&nbsp; :Dung ty ty</p>
                    <p style="padding-left:  15%;line-height: 15%"> Properties&nbsp;: Me hoac </p>
                    <p style="padding-left:  15%;line-height: 15%"> Health&emsp;&nbsp;&nbsp;: 100 </p>
                    <hr>
                </div>
                <br>
                <div class="container2" style="width: 100%">
                    <div class="count" ><h1 id="count1" style="color: white">17</h1></div>
                    <img class="load-card" src="/img/sepci/doc.jpg" style="padding-left: 15%;padding-top: 5px"
                         height="100%" width="70%"/>
                </div>
                <div style="padding-left: 30%;padding-bottom:5%;padding-top:5%;width:50%">
                    <input class="pl1" id="pl11" onclick="gameStart(this.className)" type="button" value="Take Cards">
                </div>
            </div>
            <div class="Broad" style="" id="arena">
                <table  style="width: 100%;height: 10%">
                    <tr>
                        <td id="point1" style="padding-left: 5%">Point : 3000</td>
                        <td id="point2" style="text-align: right;padding-right: 5%">Point: 3000</td>
                    </tr>
                </table>
                <table style="width: 100%;height: 90%">
                    <tr>
                        <td class="card-table" style="width: 20%" id="broadCard1">
                        </td>
                        <td style="width: 60%">
                            <table  width="100%" height="100%">
                                <tr height="60%">
                                    <td id="cardBroadPl1" class="BroadArena1" style="width: 30%">
                                    </td>
                                    <td id="cardbroadPl2" class="BroadArena2" style="width: 30%">
                                    </td>
                                </tr>
                                <tr height="40%">
                                    <td id="info1">
                                        <p id="nameCard">Name : </p>
                                        <p id="pointAttack">Attack: </p>
                                        <p id="defen"> Defen: </p>
                                        <p id="status" style="color: red"> Status: </p>
                                    </td>
                                    <td id="info2">
                                        <p id="nameCard1">Name : </p>
                                        <p id="pointAttack1">Attack: </p>
                                        <p id="defen1"> Defen: </p>
                                        <p id="status1" style="color: red"> Status: </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 20%" id="broadCard2">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="Player"  id="player2">
                <div class="container1" style="width: 100%">
                    <img src="/img/sepci/default.png" style="padding-left: 15%;padding-top: 5%" height="70%"
                         width="70%"/>
                    <p style="padding-left:  15%;line-height: 15%" id="name2">Name &emsp;&nbsp;&nbsp; :Hoang co co</p>
                    <p style="padding-left:  15%;line-height: 15%"> Properties&nbsp;: Dau sung </p>
                    <p style="padding-left:  15%;line-height: 15%"> Health&emsp;&nbsp;&nbsp;: 100 </p>
                    <hr>
                </div>
                <br>
                <div class="container2" style="width: 100%">
                    <div class="count" ><h1 id="count2" style="color: white">17</h1></div>
                    <img class="load-card" src="/img/sepci/doc.jpg" style="padding-left: 15%;padding-top: 5px"
                         height="100%" width="70%"/>
                </div>
                <div style="padding-left: 30%;padding-bottom:5%; padding-top:5%; width:50%">
                    <input class="pl2" id="pl21" onclick="gameStart(this.className)" type="button" value="Take Cards">
                </div>
            </div>
        </div>
    </div>
</div>
<p id ="result" hidden></p>
<c:if test="${cookie.game.value!=null}">
    <c:redirect url="GameServlet" context="cookie.game.value"/>
</c:if>
</body>
<script src="/js/game.js"></script>
<link rel="stylesheet" href="/css/cssBroadGame.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</html>
