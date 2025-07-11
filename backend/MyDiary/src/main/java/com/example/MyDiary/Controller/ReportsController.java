package com.example.MyDiary.Controller;

import com.example.MyDiary.DTO.ReportsDTO;
import com.example.MyDiary.DTO.UserDTO;
import com.example.MyDiary.Service.ReportsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/reports")
@RequiredArgsConstructor
public class ReportsController {

    private final ReportsService reportsService;

    //신고등록
    @PostMapping
    public ResponseEntity<ReportsDTO> createReport(@RequestBody ReportsDTO dto){
        return ResponseEntity.ok(reportsService.createReport(dto));
    }

    //전체 신고조회
    @GetMapping("/all")
    public ResponseEntity<List<ReportsDTO>> getAllReports(){
        return ResponseEntity.ok(reportsService.getAllReports());
    }

    //특정 신고조회
    @GetMapping
    public ResponseEntity<ReportsDTO> getReport(@RequestParam Long id){
        return ResponseEntity.ok(reportsService.getReport(id));
    }

    //신고 삭제
    @DeleteMapping
    public ResponseEntity<String> deleteReport(@RequestParam Long reportId){
        reportsService.deleteReport(reportId);
        return ResponseEntity.ok("신고 삭제 완료");
    }

}
