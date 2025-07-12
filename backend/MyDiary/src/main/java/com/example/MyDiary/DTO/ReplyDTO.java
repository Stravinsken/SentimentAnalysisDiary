package com.example.MyDiary.DTO;

import com.example.MyDiary.Entity.DiariesEntity;
import com.example.MyDiary.Entity.UserEntity;
import lombok.*;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class ReplyDTO {
    private Long replyId;
    private DiariesEntity diaryId;
    private UserEntity userId;
    private String content;
    private LocalDateTime createdAt;
    private Boolean isAnonymous;
    private Boolean isFiltered;
}
