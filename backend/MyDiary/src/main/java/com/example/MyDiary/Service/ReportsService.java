package com.example.MyDiary.Service;

import com.example.MyDiary.DTO.ReportsDTO;
import com.example.MyDiary.Entity.ReportsEntity;
import com.example.MyDiary.Entity.UserEntity;
import com.example.MyDiary.Repository.ReportsRepository;
import com.example.MyDiary.Repository.UserRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReportsService {
    private final ReportsRepository reportsRepository;
    private final UserRepository userRepository;

    //신고 등록
    public ReportsDTO createReport(ReportsDTO dto) {
        UserEntity reporter = userRepository.findByUserId(dto.getReporterId())
                .orElseThrow(() -> new EntityNotFoundException("신고자를 찾을 수 없습니다."));

        ReportsEntity report = ReportsEntity.builder()
                .reporterId(reporter)
                .targetType(dto.getTargetType())
                .targetId(dto.getTargetId())
                .reason(dto.getReason())
                .createdAt(LocalDateTime.now())
                .build();

        return reportsRepository.save(report).toDTO();
    }

    //전체 신고 조회
    public List<ReportsDTO> getAllReports(){
        return reportsRepository.findAll().stream()
                .map(ReportsEntity::toDTO)
                .toList();
    }

    //특정 신고 조회
    public ReportsDTO getReport(Long reportId){
        return reportsRepository.findById(reportId)
                .orElseThrow(() -> new EntityNotFoundException("신고 내역이 없습니다."))
                .toDTO();
    }

    //신고 삭제
    public void deleteReport(Long reportId) {
        reportsRepository.deleteById(reportId);
    }
}
