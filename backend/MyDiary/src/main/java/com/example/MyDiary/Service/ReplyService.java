package com.example.MyDiary.Service;

import com.example.MyDiary.DTO.ReplyDTO;
import com.example.MyDiary.Entity.ReplyEntity;
import com.example.MyDiary.Repository.ReplyRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReplyService {

    private final ReplyRepository replyRepository;

    // 답장 생성
    public ReplyDTO createReply(ReplyDTO replyDTO){
        ReplyEntity reply = ReplyEntity.builder()
                .diaryId(replyDTO.getDiaryId())
                .userId(replyDTO.getUserId())
                .content(replyDTO.getContent())
                .createdAt(LocalDateTime.now())
                .isAnonymous(replyDTO.getIsAnonymous())
                .isFiltered(replyDTO.getIsFiltered())
                .build();

        return replyRepository.save(reply).toDTO();
    }

    // 전체 조회
    public List<ReplyDTO> getAllReplies(){
        return replyRepository.findAll().stream()
                .map(ReplyEntity::toDTO)
                .toList();
    }

    // 삭제
    public void deleteReply(Long replyId){
        if(!replyRepository.existsById(replyId))
            throw new EntityNotFoundException("해당 답장을 찾을 수 없습니다.");

        replyRepository.deleteById(replyId);
    }


}
