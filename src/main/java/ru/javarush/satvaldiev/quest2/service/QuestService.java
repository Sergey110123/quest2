package ru.javarush.satvaldiev.quest2.service;

import ru.javarush.satvaldiev.quest2.entity.Quest;
import ru.javarush.satvaldiev.quest2.repository.QuestRepository;

import java.util.List;
import java.util.Optional;

public class QuestService {
    private final QuestRepository questRepository;

    public QuestService(QuestRepository questRepository) {
        this.questRepository = questRepository;
    }

    public List<String> getAllQuestsNames(){
        return questRepository.getAllQuestsNames();
    }
    public Optional<Quest> getQuest(String questName){
        return questRepository.getQuest(questName);
    }
    public Optional<Quest> getQuestById(long questId){
        return questRepository.getQuestById(questId);
    }
}
