package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.DiariesDTO;
import com.example.MyDiary.DTO.UserDTO;
import com.example.MyDiary.Entity.Enum.Gender;
import com.example.MyDiary.Entity.Enum.Role;
import jakarta.persistence.*;
import jakarta.persistence.criteria.CriteriaBuilder;
import lombok.*;
import org.hibernate.annotations.Polymorphism;

import java.util.Date;
import java.util.stream.DoubleStream;

@Entity
@Table(name = "diaries")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class DiariesEntity {

    @Id
    @Column(name = "diaryId")
    private Integer diaryId;

    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "userId")
    private UserEntity userId;

    @Column
    private String content;

    @Column
    private String emotionTag;

    @Column
    private String emotionIcon;

    @Column
    private String unconsciousKeywords;

    @Column
    private String createdAt;

    @Column
    private String datetime;

    @Column
    private boolean isPublic;

    public DiariesDTO toDTO(){
        return DiariesDTO.builder()
                .diaryId(diaryId)
                .userId(userId.getUserId())
                .content(content)
                .emotionTag(emotionTag)
                .emotionIcon(emotionIcon)
                .unconsciousKeywords(unconsciousKeywords)
                .datetime(datetime)
                .isPublic(isPublic)
                .build();
    }
}

























