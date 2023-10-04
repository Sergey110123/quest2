package ru.javarush.satvaldiev.quest2.service;

import ru.javarush.satvaldiev.quest2.entity.Question;
import ru.javarush.satvaldiev.quest2.repository.QuestionRepository;

import java.util.Optional;

public class QuestionService {
    private final QuestionRepository questionRepository;

    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    public Optional<Question> getNextQuestion(long questId, long questionId){
        return questionRepository.getNextQuestion(questId, questionId);
    }
}
