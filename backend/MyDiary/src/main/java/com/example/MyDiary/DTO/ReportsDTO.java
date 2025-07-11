package com.example.MyDiary.DTO;

import com.example.MyDiary.Entity.UserEntity;
import lombok.*;

import java.time.LocalDateTime;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class ReportsDTO {
    private Long reportId;
    private String reporterId;
    private String targetType;
    private String targetId;
    private String reason;
    private LocalDateTime createdAt;
}
