package com.example.MyDiary.DTO;

import lombok.*;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class FilterDTO {
    private Integer filterId;
    private String keyword;
    private Integer severityLevel;
}
