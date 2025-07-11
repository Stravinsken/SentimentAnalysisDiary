package com.example.MyDiary.Repository;

import com.example.MyDiary.Entity.DiariesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DiariesRepository extends JpaRepository<DiariesEntity, Integer> {

}
