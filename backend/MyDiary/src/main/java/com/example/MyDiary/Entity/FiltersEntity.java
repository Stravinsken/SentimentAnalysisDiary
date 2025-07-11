package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.FilterDTO;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "Filters")
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class FiltersEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer filterId;

    @Column
    private String keyword;

    @Column
    private Integer severityLevel;

    public FilterDTO toDTO(){
        return FilterDTO.builder()
                .filterId(filterId)
                .keyword(keyword)
                .severityLevel(severityLevel)
                .build();
    }
}
