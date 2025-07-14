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
    private Long reporterId;
    private String targetType;
    private Long targetId;
    private String reason;
    private LocalDateTime createdAt;
}
