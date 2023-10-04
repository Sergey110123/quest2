
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Квесты от Сереги</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

<div class="d-flex justify-content-center"><h2>${sessionScope.playerName}, <%= "выберите квест из списка:" %></h2></div>
<br>
<div class="d-flex flex-column mb-3">
    <c:forEach var="i" items="${sessionScope.questsList}" varStatus="loopCounter">
        <div class="p-3"><h4><a href="${pageContext.request.contextPath}/game-servlet?questName=${i}">
        <c:out value="${loopCounter.count}. "/>
            <c:out value="${i}"/></a></h4></div>
    </c:forEach>
</div>
<br>
<table class="table"><tr class="table-primary"><td>Статистика:</td><td></td></tr>
    <tr class="table-light"><td>Имя игрока:</td><td>${sessionScope.playerName}</td></tr>
    <tr class="table-light"><td>Всего сыграно:</td><td>${sessionScope.numberOfWins + sessionScope.numberOfLoses}</td></tr>
    <tr class="table-success"><td>Всего побед:</td><td>${sessionScope.numberOfWins}</td></tr>
    <tr class="table-danger"><td>Всего поражений:</td><td>${sessionScope.numberOfLoses}</td></tr></table>

</body>
</html>