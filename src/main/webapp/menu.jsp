<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC
"-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd" >

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=ISO-8859-1">
    <style type="">
        <%@include file="/style.css" %>
    </style>
    <title>Паззл</title>
</head>
<body>
<div class="canvas-like-div">
    <h1>Паззл</h1>

    <div class="centered-group">
        <form action="${pageContext.request.contextPath}/settings">
            <input type="submit"
                   value="Начать игру"
                   class="menu-button"/>
        </form>
        <form action="${pageContext.request.contextPath}/about">
            <input type="submit"
                   value="Справка"
                   class="menu-button"/>
        </form>
    </div>
</div>
</body>
</html>