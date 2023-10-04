<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ru.javarush.satvaldiev.quest2.entity.Quest" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Квесты от Сереги</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<%
    Quest quest = (Quest) request.getAttribute("quest");
    String questDescription = quest.getQuestDescription();
    String[] splitQuestDescription = questDescription.split("\n");
    PrintWriter outer = response.getWriter();

    for (String s : splitQuestDescription) {
        if (s.startsWith("<<<")) {
            String edited = s.replaceAll("<<<", "");
            outer.println("<div class=\"d-flex justify-content-center\"><h2>" + edited + "</h2></div>");
        } else outer.println("<p class=\"fs-4\">" + s + "</p>");
    }
    outer.println("<br><div class=\"d-flex justify-content-center\">");
    outer.println("<button type=\"button\" class=\"btn btn-primary\" id=\"button1\" onclick=\"window.location='/game-servlet?questionId=1&questName=" + quest.getQuestName() + "'\">Начать</button>");
    outer.println("</div>");
%>
<br>
<table class="table"><tr class="table-primary"><td>Статистика:</td><td></td></tr>
    <tr class="table-light"><td>Имя игрока:</td><td>${sessionScope.playerName}</td></tr>
    <tr class="table-light"><td>Всего сыграно:</td><td>${sessionScope.numberOfWins + sessionScope.numberOfLoses}</td></tr>
    <tr class="table-success"><td>Всего побед:</td><td>${sessionScope.numberOfWins}</td></tr>
    <tr class="table-danger"><td>Всего поражений:</td><td>${sessionScope.numberOfLoses}</td></tr></table>
</body>
</html>