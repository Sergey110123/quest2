<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="ru.javarush.satvaldiev.quest2.entity.Quest" %>
<%@ page import="java.io.*" %>
<%@ page import="ru.javarush.satvaldiev.quest2.entity.Question" %>

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
    Question question = (Question) request.getAttribute("question");
    String startMessage = question.getStartMessage();
    String[] splitStartMessage = startMessage.split("\n");
    PrintWriter outer = response.getWriter();
    outer.println("<html lang=\"en\"><head>\n" +
            "  <title>Квесты от Сереги</title>\n" +
            "  <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN\" crossorigin=\"anonymous\">\n" +
            "</head><body>");
    for (String s : splitStartMessage) {
        if (s.startsWith("<<<")) {
            String edited = s.replaceAll("<<<", "");
            outer.println("<div class=\"d-flex justify-content-center\"><h2>" + edited + "</h2></div>");
        } else outer.println("<p class=\"fs-4\">" + s + "</p>");
    }
    outer.println("<table><tr>");
    outer.println("<td><form><button type=\"button\" class=\"btn btn-primary\" id=\"button1\" onclick=\"window.location='/game-servlet?questionId=" + question.getNextQuestionIdFirst()+ "&questName=" + quest.getQuestName() + "'\">" + question.getFirstChoice() +"</button></form></td>");
    if (question.getNextQuestionIdSecond() != 0) {
        outer.println("<td><form><button type=\"button\" class=\"btn btn-secondary\" id=\"button2\" onclick=\"window.location='/game-servlet?questionId=" + question.getNextQuestionIdSecond()+ "&questName=" + quest.getQuestName() + "'\">" + question.getSecondChoice() +"</button></form></td>");
    }
    else {
        outer.println("<td><form action=\"/game-servlet\" method=\"post\"><button class=\"btn btn-secondary\" name=\"name\">" + question.getSecondChoice() +"</button></form></td>");
    }
    outer.println("</tr></table>");
%>
<br>
<table class="table"><tr class="table-primary"><td>Статистика:</td><td></td></tr>
    <tr class="table-light"><td>Имя игрока:</td><td>${sessionScope.playerName}</td></tr>
    <tr class="table-light"><td>Всего сыграно:</td><td>${sessionScope.numberOfWins + sessionScope.numberOfLoses}</td></tr>
    <tr class="table-success"><td>Всего побед:</td><td>${sessionScope.numberOfWins}</td></tr>
    <tr class="table-danger"><td>Всего поражений:</td><td>${sessionScope.numberOfLoses}</td></tr></table>
</body>
</html>
