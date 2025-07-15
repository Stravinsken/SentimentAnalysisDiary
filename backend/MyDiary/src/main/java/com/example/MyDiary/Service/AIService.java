package com.example.MyDiary.Service;

import com.example.MyDiary.DTO.AI_RepliesDTO;
import com.example.MyDiary.Entity.AI_RepliesEntity;
import com.example.MyDiary.Entity.DiariesEntity;
import com.example.MyDiary.Repository.AI_RepliesRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class AIService {

    private final AI_RepliesRepository aiRepliesRepository;

    public AI_RepliesDTO generateReply(DiariesEntity diary) {
        // 예시 분석 (향후 ChatGPT 등 연동)
        String aiText = "[AI 응답] " + diary.getContent().substring(0, Math.min(30, diary.getContent().length())) + "... 에 대한 공감 메시지입니다.";

        //유해어 검사 예시
        boolean isFiltered = aiText.contains("나쁜말"); // 필터링 로직은 원하는대로

        AI_RepliesEntity replyEntity = AI_RepliesEntity.builder()
                .diaryId(diary)
                .content(aiText)
                .generatedAt(LocalDateTime.now().toString())
                .isFiltered(isFiltered)
                .build();

        aiRepliesRepository.save(replyEntity);

        return AI_RepliesDTO.builder()
                .diaryId(diary.getDiaryId())
                .content(aiText)
                .generatedAt(replyEntity.getGeneratedAt())
                .isFiltered(isFiltered)
                .build();
    }
}
