package com.example.MyDiary.Controller;

import com.example.MyDiary.DTO.LoginDTO;
import com.example.MyDiary.DTO.UserDTO;
import com.example.MyDiary.DTO.UserRegisterDTO;
import com.example.MyDiary.Service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    //회원가입
    @PostMapping("/auth")
    public ResponseEntity<UserDTO> registerUser(@RequestBody UserRegisterDTO userDTO) {
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(userService.registerUser(userDTO));
    }

    //로그인
    @PostMapping("/auth/login")
    public ResponseEntity<UserDTO> loginUser(@RequestBody LoginDTO loginDTO) {
        UserDTO userDTO = userService.loginUser(loginDTO);
        return ResponseEntity.ok(userDTO);
    }

    //전체 유저 검색
    @GetMapping("/user/all")
    public ResponseEntity<List<UserDTO>> getAllUsers(){
        return ResponseEntity.ok(userService.getAllUsers());
    }

    //특정 유저 검색
    @GetMapping("/user/spec")
    public ResponseEntity<UserDTO> getUser(@RequestParam Long id){
        return ResponseEntity.ok(userService.getUser(id));
    }

    //사용자 정보 수정
    @PatchMapping("/user/update")
    public ResponseEntity<UserDTO> updateUser(@RequestBody UserDTO user) {
        return ResponseEntity.ok(userService.updateUser(user));
    }

    //유저 삭제
    @DeleteMapping
    public ResponseEntity<String> deleteUser(@RequestParam Long id){
        userService.deleteUser(id);
        return  ResponseEntity.ok("삭제 완료");
    }


}
