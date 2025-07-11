package com.example.MyDiary.Controller;
import com.example.MyDiary.DTO.DiaryWriteDTO;
import com.example.MyDiary.Service.DiariesService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/diary")

public class DiariesController {
    private final DiariesService diaryService;

    @PostMapping("/write")
    public ResponseEntity<?> writeDiary(@RequestBody DiaryWriteDTO dto) {
        diaryService.saveDiary(dto);
        return ResponseEntity.ok("일기 저장 완료");
    }
}
