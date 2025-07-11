package com.example.MyDiary.Service;

import com.example.MyDiary.Repository.DiariesRepository;
import com.example.MyDiary.Repository.UserRepliesRepository;
import com.example.MyDiary.Repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserRepliesService {

    private final UserRepliesRepository userRepliesRepository;
    private final UserRepository userRepository;
    private final DiariesRepository diariesRepository;
}
