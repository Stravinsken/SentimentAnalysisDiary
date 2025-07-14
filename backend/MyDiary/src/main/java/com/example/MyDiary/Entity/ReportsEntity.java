package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.ReportsDTO;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "Reports")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReportsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reportId;

    @ManyToOne
    @MapsId
    @JoinColumn(name = "reporterId", referencedColumnName = "id")
    private UserEntity reporterId;

    @Column(nullable =false)
    private String targetType;

    @Column(nullable = false)
    private Long targetId;

    @Column
    private String reason;

    @Column
    private LocalDateTime createdAt;

    public ReportsDTO toDTO(){
        return ReportsDTO.builder()
                .reportId(reportId)
                .reporterId(reporterId.getId())
                .targetType(targetType)
                .targetId(targetId)
                .reason(reason)
                .createdAt(createdAt)
                .build();
    }
}