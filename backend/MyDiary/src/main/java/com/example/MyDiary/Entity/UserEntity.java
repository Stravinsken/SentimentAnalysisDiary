package com.example.MyDiary.Entity;

import com.example.MyDiary.DTO.UserDTO;
import com.example.MyDiary.Entity.Enum.Gender;
import com.example.MyDiary.Entity.Enum.Role;
import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Table(name = "users")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
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
                .id(id)
                .userId(userId)
                .nickname(nickname)
                .gender(gender)
                .birth(birth)
                .role(role)
                .build();
    }

}
