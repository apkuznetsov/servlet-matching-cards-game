<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC
"-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd" >

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8"
          content="text/html"
          http-equiv="Content-Type">
    <style type="">
        <%@include file="/style.css" %>
    </style>
    <title>Игра</title>
</head>
<body>

<div class="game-status">
    <span class="moves-counter">Ходы: </span>
    <span class="moves-counter" id="movesCounter"></span>
    <span class="time-counter">Время: </span>
    <span class="time-counter" id="timeCounter">0 мин. 0 сек.</span>
</div>

<table class="game-board">
    <tbody class="game-grid">
    <tr class="game-grid-row">
        <td class="game-card">
            <img alt="cake1" class="game-card-img" src="images/1.jpg">
        </td>
        <td class="game-card">
            <img alt="cake2" class="game-card-img" src="images/2.jpg">
        </td>
        <td class="game-card">
            <img alt="cake3" class="game-card-img" src="images/3.jpg">
        </td>
        <td class="game-card">
            <img alt="cake4" class="game-card-img" src="images/4.jpg">
        </td>
    </tr>
    <tr class="game-grid-row">
        <td class="game-card">
            <img alt="cake5" class="game-card-img" src="images/5.jpg">
        </td>
        <td class="game-card">
            <img alt="cake6" class="game-card-img" src="images/6.jpg">
        </td>
        <td class="game-card">
            <img alt="cake7" class="game-card-img" src="images/7.jpg">
        </td>
        <td class="game-card">
            <img alt="cake8" class="game-card-img" src="images/8.jpg">
        </td>
    </tr>
    <tr class="game-grid-row">
        <td class="game-card">
            <img alt="cake1" class="game-card-img" src="images/1.jpg">
        </td>
        <td class="game-card">
            <img alt="cake2" class="game-card-img" src="images/2.jpg">
        </td>
        <td class="game-card">
            <img alt="cake3" class="game-card-img" src="images/3.jpg">
        </td>
        <td class="game-card">
            <img alt="cake4" class="game-card-img" src="images/4.jpg">
        </td>
    </tr>
    <tr class="game-grid-row">
        <td class="game-card">
            <img alt="cake5" class="game-card-img" src="images/5.jpg">
        </td>
        <td class="game-card">
            <img alt="cake6" class="game-card-img" src="images/6.jpg">
        </td>
        <td class="game-card">
            <img alt="cake7" class="game-card-img" src="images/7.jpg">
        </td>
        <td class="game-card">
            <img alt="cake8" class="game-card-img" src="images/8.jpg">
        </td>
    </tr>
    </tbody>
</table>

<script src="game.js" type=""></script>

</body>
</html>