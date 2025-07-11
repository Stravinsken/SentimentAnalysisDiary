package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.UserRepliesDTO;
import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "User_RepliesEntity")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class User_RepliesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    private LocalDateTime createdAt;

    @Column
    private Boolean isAnonymous;

    @Column
    private Boolean isFiltered;

    public UserRepliesDTO toDTO() {
        return UserRepliesDTO.builder()
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