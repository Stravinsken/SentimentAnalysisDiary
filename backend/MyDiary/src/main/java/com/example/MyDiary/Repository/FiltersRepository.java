package com.example.MyDiary.Repository;

import com.example.MyDiary.Entity.FiltersEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface FiltersRepository extends JpaRepository<FiltersEntity, Integer> {

    @Query("SELECT f.keyword FROM FiltersEntity f")
    List<String> findAllKeywords();
}