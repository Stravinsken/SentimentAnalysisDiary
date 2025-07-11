package com.example.MyDiary.DTO;

import com.example.MyDiary.Entity.UserEntity;
import lombok.*;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class ReportsDTO {
    private Long reportId;
    private String reporterId;
    private String targetType;
    private Long targetId;
    private String text;
    private String datetime;
}
