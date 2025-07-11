package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.UserDTO;
import com.example.MyDiary.DTO.User_RepliesDTO;
import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "User_RepliesEntity")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class User_RepliesEntity {
    @Id
    private Long replyId;

    @ManyToOne
    @JoinColumn(name = "diaryId", referencedColumnName = "diaryId")
    private DiariesEntity diaryId;

    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "userId")
    private UserEntity userId;

    @Column
    private String content;

    @Column
    private String createdAt;

    @Column
    private boolean isAnonymous;

    @Column
    private boolean isFiltered;

    public User_RepliesDTO toDTO() {
        return User_RepliesDTO.builder()
                .replyId(replyId)
                .diaryId(diaryId)
                .userId(userId)
                .content(content)
                .createdAt(createdAt)
                .isAnonymous(isAnonymous)
                .isFiltered(isFiltered)
                .build();
    }
}