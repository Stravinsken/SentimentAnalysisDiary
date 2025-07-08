package com.example.MyDiary.DTO;

import com.example.MyDiary.Entity.DiariesEntity;
import com.example.MyDiary.Entity.UserEntity;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.*;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class User_RepliesDTO {
    private Integer replyId;
    private DiariesEntity diaryId;
    private UserEntity userId;
    private String content;
    private String createdAt;
    private boolean isAnonymous;
    private boolean isFiltered;
}
