package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.DiariesDTO;
import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "diaries")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class DiariesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "diaryId")
    private Long diaryId;

    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private UserEntity userId;

    @Column
    private String title;

    @Column
    private String content;

    @Column
    private String emotionTag;

    @Column
    private String emotionIcon;

    @Column
    private String unconsciousKeywords;

    @Column
    private LocalDateTime createdAt;

    @Column
    private Boolean isPublic;


    public DiariesDTO toDTO(){
        return DiariesDTO.builder()
                .diaryId(diaryId)
                .userId(userId.getId())
                .title(title)
                .content(content)
                .emotionTag(emotionTag)
                .emotionIcon(emotionIcon)
                .unconsciousKeywords(unconsciousKeywords)
                .createdAt(createdAt)
                .isPublic(isPublic)
                .build();
    }
}

























