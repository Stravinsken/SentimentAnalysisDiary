package com.example.MyDiary.DTO;

import lombok.Data;

@Data
public class DiaryWriteDTO {
    private Long userId;
    private String content;
    private Boolean isPublic;
}