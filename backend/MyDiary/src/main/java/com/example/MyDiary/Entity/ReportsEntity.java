package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.ReportsDTO;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Reports")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class ReportsEntity {
    @Id
    private Integer reportId;

    @ManyToOne
    @MapsId
    @JoinColumn(name = "reporterId", referencedColumnName = "userId")
    private UserEntity reporterId;

    @Column
    private String targetType;

    @Column
    private Integer targetId;

    @Column
    private String text;

    @Column
    private String datetime;

    public ReportsDTO toDTO(){
        return ReportsDTO.builder()
                .reportId(reportId)
                .reporterId(reporterId.getUserId())
                .targetType(targetType)
                .targetId(targetId)
                .text(text)
                .datetime(datetime)
                .build();
    }
}