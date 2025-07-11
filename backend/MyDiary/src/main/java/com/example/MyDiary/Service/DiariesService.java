package com.example.MyDiary.Service;

import com.example.MyDiary.DTO.DiaryWriteDTO;
import com.example.MyDiary.Entity.DiariesEntity;
import com.example.MyDiary.Entity.UserEntity;
import com.example.MyDiary.Repository.DiariesRepository;
import com.example.MyDiary.Repository.FiltersRepository;
import com.example.MyDiary.Repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class DiariesService {

    private final DiariesRepository diariesRepository;
    private final UserRepository userRepository;
    private FiltersRepository filtersRepository;
    //private final AIService aiService; #나중에 ai 적용시 사용

    public void saveDiary(DiaryWriteDTO dto) {
        UserEntity user = userRepository.findByUserId(dto.getUserId())
                .orElseThrow(() -> new IllegalArgumentException("사용자 없음"));
// ai 나중에 사용
//        String emotionTag = aiService.analyzeEmotion(dto.getContent());
//        String emotionIcon = aiService.getEmotionIcon(emotionTag);
//        String unconsciousKeywords = aiService.extractKeywords(dto.getContent());

        // ai 나중에 사용
        String emotionTag = ""; // ex) "슬픔"
        String emotionIcon = ""; // ex) "😢"
        String unconsciousKeywords = ""; // ex) "고독, 외로움"

        DiariesEntity diary = new DiariesEntity();
        diary.setUserId(user);
        diary.setContent(dto.getContent());
        diary.setEmotionTag(emotionTag);
        diary.setEmotionIcon(emotionIcon);
        diary.setUnconsciousKeywords(unconsciousKeywords);
        diary.setCreatedAt(java.time.LocalDateTime.now());
        diary.setIsPublic(dto.getIsPublic());

        diariesRepository.save(diary);
    }

    // 유해 필터링 검사
    public void validateContent(String content) {
        List<String> filters = filtersRepository.findAllKeywords();
        for (String word : filters) {
            if (content.contains(word)) {
                throw new IllegalArgumentException("유해 단어가 포함되어 있습니다: " + word);
            }
        }
    }
}