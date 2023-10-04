package ru.javarush.satvaldiev.quest2.controller;

import java.io.*;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import ru.javarush.satvaldiev.quest2.repository.QuestRepository;
import ru.javarush.satvaldiev.quest2.repository.QuestionRepository;
import ru.javarush.satvaldiev.quest2.service.QuestService;
import ru.javarush.satvaldiev.quest2.service.QuestionService;

@WebServlet(name = "startServlet", value = "/start-servlet")
public class StartServlet extends HttpServlet {
    private QuestService questService;
    private QuestionService questionService;

    public void init() {
        questService = new QuestService(new QuestRepository());
        questionService = new QuestionService(new QuestionRepository());
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        processRequest(request, response);
    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String playerName = request.getParameter("name");
        HttpSession currentSession = request.getSession(true);
        if (playerName.isBlank()) playerName = "Гость";
        currentSession.setAttribute("playerName", playerName);

        Integer wins = 0;
        Integer loses = 0;
        List<String> questsList = questService.getAllQuestsNames();
        currentSession.setAttribute("numberOfWins", wins);
        currentSession.setAttribute("numberOfLoses", loses);
        currentSession.setAttribute("questService", questService);
        currentSession.setAttribute("questionService", questionService);
        currentSession.setAttribute("questsList", questsList);

        request.getRequestDispatcher("/listOfQuests.jsp").forward(request, response);
    }

    public void destroy() {
    }
}