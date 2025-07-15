package com.example.MyDiary.Service;

import com.example.MyDiary.DTO.AI_RepliesDTO;
import com.example.MyDiary.DTO.DiaryWriteDTO;
import com.example.MyDiary.Entity.DiariesEntity;
import com.example.MyDiary.Entity.UserEntity;
import com.example.MyDiary.Repository.DiariesRepository;
import com.example.MyDiary.Repository.FiltersRepository;
import com.example.MyDiary.Repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@RequiredArgsConstructor
@Service
public class DiariesService {

    private final DiariesRepository diariesRepository;
    private final UserRepository userRepository;
    private final FiltersRepository filtersRepository;
    private final AIService aiService;

    public AI_RepliesDTO saveDiary(DiaryWriteDTO dto) {
        UserEntity user = userRepository.findById(dto.getUserId())
                .orElseThrow(() -> new IllegalArgumentException("사용자 없음"));

        validateContent(dto.getContent());

        DiariesEntity diary = new DiariesEntity();
        diary.setUserId(user);
        diary.setTitle(dto.getTitle());
        diary.setContent(dto.getContent());
        diary.setEmotionIcon(dto.getEmotionIcon());
        diary.setCreatedAt(LocalDateTime.now());
        diary.setIsPublic(dto.getIsPublic());

        diariesRepository.save(diary);

        // ✅ AI 자동 분석 요청
        return aiService.generateReply(diary);
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