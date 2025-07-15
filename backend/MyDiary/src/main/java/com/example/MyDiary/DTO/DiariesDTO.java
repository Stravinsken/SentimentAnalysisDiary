package com.example.MyDiary.DTO;

import lombok.*;
import java.time.LocalDateTime;
import java.util.Date;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DiariesDTO {
    private Long diaryId;
    private Long userId;
    private String title;
    private String content;
    private String emotionTag;
    private String emotionIcon;
    private String unconsciousKeywords;
    private Date datetime;
    private LocalDateTime createdAt;
    private Boolean isPublic;
}