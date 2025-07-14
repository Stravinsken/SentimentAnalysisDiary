package com.example.MyDiary.Repository;

import com.example.MyDiary.Entity.DiariesEntity;
import com.example.MyDiary.Entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DiariesRepository extends JpaRepository<DiariesEntity, Long> {
    List<DiariesEntity> findByUserId(UserEntity userId);
}
