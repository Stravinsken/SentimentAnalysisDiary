package com.example.MyDiary.Controller;

import com.example.MyDiary.DTO.ReplyDTO;
import com.example.MyDiary.Service.ReplyService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/reply")
@RequiredArgsConstructor
public class ReplyController {

    private final ReplyService replyService;


    //답장 작성
    @PostMapping
    public ResponseEntity<ReplyDTO> createReply(@RequestBody ReplyDTO replyDTO){
        return ResponseEntity.ok(replyService.createReply(replyDTO));
    }

    //전체 답장 조회
    @GetMapping
    public ResponseEntity<List<ReplyDTO>> getAllReplies(){
        return ResponseEntity.ok(replyService.getAllReplies());
    }

    //답장 삭제
    @DeleteMapping
    public ResponseEntity<String> deleteReply(@RequestParam Long replyId){
        replyService.deleteReply(replyId);
        return ResponseEntity.ok("익명 답장 삭제 완료");
    }
}
