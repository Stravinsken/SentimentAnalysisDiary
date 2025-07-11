package com.example.MyDiary.Repository;

import com.example.MyDiary.Entity.ReportsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportsRepository extends JpaRepository<ReportsEntity, Long> {
}
