package com.example.MyDiary.Controller;
import com.example.MyDiary.DTO.AI_RepliesDTO;
import com.example.MyDiary.DTO.DiaryWriteDTO;
import com.example.MyDiary.Service.DiariesService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/diary")

public class DiariesController {
    private final DiariesService diariesService;

    @PostMapping("/write")
    public ResponseEntity<?> writeDiary(@RequestBody DiaryWriteDTO dto) {
        AI_RepliesDTO aiReply = diariesService.saveDiary(dto);
        return ResponseEntity.ok(aiReply);
    }
}
