package com.example.MyDiary.Repository;

import com.example.MyDiary.Entity.User_RepliesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepliesRepository extends JpaRepository<User_RepliesEntity, Long> {
}
