package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.AI_RepliesDTO;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "AI_Replies")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class AI_RepliesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long replyId;

    @OneToOne
    @MapsId
    @JoinColumn(name = "diaryId", referencedColumnName = "diaryId")
    private DiariesEntity diaryId;

    @Column
    private String content;

    @Column
    private String generatedAt;

    @Column
    private boolean isFiltered;

    public AI_RepliesDTO toDTO(){
        return AI_RepliesDTO.builder()
                .replyId(replyId)
                .diaryId(diaryId.getDiaryId())
                .content(content)
                .generatedAt(generatedAt)
                .isFiltered(isFiltered)
                .build();
    }
}
