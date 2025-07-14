package com.example.MyDiary.Service;

import com.example.MyDiary.DTO.LoginDTO;
import com.example.MyDiary.DTO.UserDTO;
import com.example.MyDiary.DTO.UserRegisterDTO;
import com.example.MyDiary.Entity.UserEntity;
import com.example.MyDiary.Repository.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    //회원가입필요
    public UserDTO registerUser(UserRegisterDTO dto){
        if(userRepository.findByEmail(dto.getEmail()).isPresent()){
            throw new IllegalArgumentException("이미 사용 중인 사용자의 이메일입니다.");
        }

        UserEntity user = UserEntity.builder()
                .email(dto.getEmail())
                .password(dto.getPassword())
                .nickname(dto.getNickname())
                .gender(dto.getGender())
                .birth(dto.getBirth())
                .role(dto.getRole())
                .build();

        return userRepository.save(user).toDTO();
    }

    //로그인기능
    public UserDTO loginUser(LoginDTO dto){
        UserEntity user = userRepository.findByEmail(dto.getEmail())
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 사용자입니다."));

        if(!user.getPassword().equals(dto.getPassword())){
            throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
        }

        return user.toDTO();
    }

    //전체 사용자 조회
    public List<UserDTO> getAllUsers(){
        return userRepository.findAll().stream()
                .map(UserEntity::toDTO)
                .toList();
    }

    //특정 사용자 조회
    public UserDTO getUser(Long id){
        return userRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("해당 유저를 찾을 수 없습니다."))
                .toDTO();
    }

    //사용자 정보 수정
    public UserDTO updateUser(UserDTO userDTO){
        UserEntity user = userRepository.findById(userDTO.getId())
                .orElseThrow(() -> new EntityNotFoundException("해당유저를 찾을 수 없습니다."));
        user.setNickname(userDTO.getNickname());
        user.setGender(userDTO.getGender());
        user.setBirth(userDTO.getBirth());

        return userRepository.save(user).toDTO();
    }

    //유저 정보 삭제
    public void deleteUser(Long Id){
        userRepository.deleteById(Id);
    }
}
