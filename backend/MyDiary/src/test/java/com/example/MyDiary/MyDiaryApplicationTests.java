package com.example.MyDiary;

import com.example.MyDiary.DTO.UserDTO;
import com.example.MyDiary.DTO.UserRegisterDTO;
import com.example.MyDiary.Entity.Enum.Gender;
import com.example.MyDiary.Entity.Enum.Role;
import com.example.MyDiary.Repository.UserRepository;
import com.example.MyDiary.Service.UserService;
import jakarta.transaction.Transactional;
import org.aspectj.weaver.patterns.TypePatternQuestions;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@SpringBootTest
@Transactional
class MyDiaryApplicationTests {

	@Autowired
	private UserService userService;

	@Autowired
	private UserRepository userRepository;

	@BeforeEach
	void setUp() {
		userRepository.deleteAll();
	}

	@Test
	void 회원가입테스트() {
		UserRegisterDTO registerDTO = UserRegisterDTO.builder()
				.userId("test1")
				.password("1234")
				.nickname("user1")
				.gender(Gender.MALE)
				.birth(new Date())
				.role(Role.USER)
				.build();

		UserDTO registeredUser = userService.registerUser(registerDTO);
		Assertions.assertNotNull(registeredUser);
		Assertions.assertEquals("test1", registeredUser.getUserId());
	}

}
