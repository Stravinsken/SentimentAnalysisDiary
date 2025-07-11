package com.example.MyDiary.DTO;

import com.example.MyDiary.Entity.Enum.Gender;
import com.example.MyDiary.Entity.Enum.Role;
import lombok.*;

import java.time.LocalDateTime;
import java.util.Date;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class DiariesDTO {
    private Integer diaryId;
    private String userId;
    private String content;
    private String emotionTag;
    private String emotionIcon;
    private String unconsciousKeywords;
    private LocalDateTime createdAt;
    private boolean isPublic;
}