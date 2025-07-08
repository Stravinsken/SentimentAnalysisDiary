package com.example.MyDiary.DTO;

import lombok.*;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class AI_RepliesDTO {
    private Integer replyId;
    private Integer diaryId;
    private String content;
    private String generatedAt;
    private boolean isFiltered;

}
