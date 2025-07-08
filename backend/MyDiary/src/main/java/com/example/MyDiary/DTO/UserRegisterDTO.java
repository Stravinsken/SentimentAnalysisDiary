package com.example.MyDiary.DTO;

import com.example.MyDiary.Entity.Enum.Gender;
import com.example.MyDiary.Entity.Enum.Role;
import lombok.*;

import java.util.Date;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserRegisterDTO {
    private String userId;
    private String password;
    private String nickname;
    private Gender gender;
    private Date birth;
    private Role role;
}
