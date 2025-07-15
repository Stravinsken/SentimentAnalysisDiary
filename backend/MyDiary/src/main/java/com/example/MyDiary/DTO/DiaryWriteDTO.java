package com.example.MyDiary.DTO;

import lombok.Data;

@Data
public class DiaryWriteDTO {
    private Long userId;
    private String title;
    private String content;
    private String emotionIcon;
    private Boolean isPublic;
}