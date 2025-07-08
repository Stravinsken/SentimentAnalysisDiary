package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.UserDTO;
import com.example.MyDiary.Entity.Enum.Gender;
import com.example.MyDiary.Entity.Enum.Role;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Entity
@Table(name = "users")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor

public class UserEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String userId;

    @Column
    private String password;

    @Column(nullable = false, unique = true)
    private String nickname;

    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Column
    private Date birth;

    @Enumerated(EnumType.STRING)
    private Role role;

    public UserDTO toDTO(){
        return UserDTO.builder()
                .id(this.id)
                .userId(this.userId)
                .nickname(this.nickname)
                .gender(this.gender)
                .birth(this.birth)
                .role(this.role)
                .build();
    }
}
