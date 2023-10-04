package ru.javarush.satvaldiev.quest2.entity;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import static org.junit.jupiter.api.Assertions.*;

class QuestTest {
    @Test
    void questIdIsZeroInQuestConstructor(){
        Throwable exception = assertThrows(IllegalArgumentException.class, () -> new Quest(0, "Test", "Test"));
        assertEquals("Quest ID cannot be 0 or negative.", exception.getMessage());
    }
    @Test
    void questIdIsNegativeInQuestConstructor(){
        Throwable exception = assertThrows(IllegalArgumentException.class, () -> new Quest(-1, "Test", "Test"));
        assertEquals("Quest ID cannot be 0 or negative.", exception.getMessage());
    }
    @Test
    void questNameIsNullInQuestConstructor(){
        Throwable exception = assertThrows(IllegalArgumentException.class, () -> new Quest(1, null, "Test"));
        assertEquals("Quest name cannot be null.", exception.getMessage());
    }
    @ParameterizedTest
    @ValueSource(strings = {"", "\t", "\r", "\n", "\f", "\u000B"})
    void questNameIsBlankInQuestConstructor(String strings){
        Throwable exception = assertThrows(IllegalArgumentException.class, () -> new Quest(1, strings, "Test"));
        assertEquals("Quest name cannot be blank.", exception.getMessage());
    }
    @Test
    void questDescriptionIsNullInQuestConstructor(){
        Throwable exception = assertThrows(IllegalArgumentException.class, () -> new Quest(1, "Test", null));
        assertEquals("Quest description cannot be null.", exception.getMessage());
    }
    @ParameterizedTest
    @ValueSource(strings = {"", "\t", "\r", "\n", "\f", "\u000B"})
    void questDescriptionIsBlankInQuestConstructor(String strings){
        Throwable exception = assertThrows(IllegalArgumentException.class, () -> new Quest(1, "Test", strings));
        assertEquals("Quest description cannot be blank.", exception.getMessage());
    }

}