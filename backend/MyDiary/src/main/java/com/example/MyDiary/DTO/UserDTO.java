package com.example.MyDiary.DTO;

import com.example.MyDiary.Entity.Enum.Gender;
import com.example.MyDiary.Entity.Enum.Role;
import jdk.jshell.Snippet;
import lombok.*;

import java.util.Date;

@Builder
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class UserDTO {
    private Long id;
    private String email;
    private String nickname;
    private Gender gender;
    private Date birth;
    private Role role;

}