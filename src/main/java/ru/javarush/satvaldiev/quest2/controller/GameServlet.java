package ru.javarush.satvaldiev.quest2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import ru.javarush.satvaldiev.quest2.entity.Quest;
import ru.javarush.satvaldiev.quest2.entity.Question;
import ru.javarush.satvaldiev.quest2.service.QuestService;
import ru.javarush.satvaldiev.quest2.service.QuestionService;
import java.io.IOException;


@WebServlet(name = "gameServlet", value = "/game-servlet")
public class GameServlet extends HttpServlet {

    public void init() {

    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession currentSession = request.getSession();
        QuestService questService = (QuestService) currentSession.getAttribute("questService");
        QuestionService questionService = (QuestionService) currentSession.getAttribute("questionService");
        String questName = request.getParameter("questName");
        String playerName = (String) currentSession.getAttribute("playerName");
        if (request.getParameter("questionId") == null){
            Quest quest = questService.getQuest(questName).orElse(null);
            assert quest != null;
            request.setAttribute("quest", quest);
            request.getRequestDispatcher("/startQuest.jsp").forward(request, response);
        }
        else {
            Quest quest = questService.getQuest(questName).orElse(null);
            assert quest != null;
            long questId = quest.getQuestId();
            long questionId = Long.parseLong(request.getParameter("questionId"));
            Question question = questionService.getNextQuestion(questId, questionId).orElse(null);
            assert question != null;
            if (question.getWinOrLose().equals("lose")) {
                Integer numberOfLoses = (Integer) currentSession.getAttribute("numberOfLoses");
                numberOfLoses += 1;
                currentSession.setAttribute("numberOfLoses", numberOfLoses);
            }
            if (question.getWinOrLose().equals("win")) {
                Integer numberOfWins = (Integer) currentSession.getAttribute("numberOfWins");
                numberOfWins += 1;
                currentSession.setAttribute("numberOfWins", numberOfWins);
            }
            request.setAttribute("quest", quest);
            request.setAttribute("question", question);
            request.getRequestDispatcher("/game.jsp").forward(request, response);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.getRequestDispatcher("/listOfQuests.jsp").forward(request, response);

    }


    public void destroy() {
    }
}