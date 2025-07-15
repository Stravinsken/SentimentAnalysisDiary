package com.example.MyDiary.Repository;

import com.example.MyDiary.Entity.AI_RepliesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AI_RepliesRepository extends JpaRepository<AI_RepliesEntity, Long> {

    // 일기 ID를 기준으로 AI 응답 조회
    AI_RepliesEntity findByDiaryId_DiaryId(Long diaryId);
}