package com.example.MyDiary.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "Reports")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class ReportsEntity {
    @Id
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "reporterId", referencedColumnName = "reporterId")
    private UserEntity reporterId;

}