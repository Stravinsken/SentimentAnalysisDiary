package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.ReplyDTO;
import jakarta.persistence.*;

import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "Reply")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long replyId;

    @ManyToOne
    @JoinColumn(name = "diaryId", referencedColumnName = "diaryId")
    private DiariesEntity diaryId;

    @ManyToOne
    @JoinColumn(name = "email", referencedColumnName = "email")
    private UserEntity userId;

    @Column
    private String content;

    @Column
    private LocalDateTime createdAt;

    @Column
    private Boolean isAnonymous;

    @Column
    private Boolean isFiltered;

    public ReplyDTO toDTO() {
        return ReplyDTO.builder()
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