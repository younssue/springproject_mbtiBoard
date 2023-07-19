package com.mbtiBoard.board.service;

import com.mbtiBoard.board.dto.CommentDTO;
import com.mbtiBoard.board.repository.BoardRepository;
import com.mbtiBoard.board.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentRepository commentRepository;
    private final BoardRepository boardRepository;

    //댓글 작성
    public int commentSave (CommentDTO commentDTO){
       // boardRepository.findByBno(commentDTO.getBno());
//        boardRepository.updateCommentCnt(commentDTO.getBno(),1);
//
//        return commentRepository.commentSave(commentDTO);


        int result = commentRepository.commentSave(commentDTO);
        if (result == 1) {
            boardRepository.updateCommentCnt(commentDTO.getBno(), 1);
        }

        return result;
    }

    //댓글 목록
    public List<CommentDTO> getList(Integer bno){
        return commentRepository.commentSelectAll(bno);
    }

    public CommentDTO read(Integer cno){
        return commentRepository.select(cno);
    }

    //댓글 갯수
    public int getCount(Integer bno){
        return commentRepository.count(bno);
    }


    //댓글 수정
    public int commentModify(CommentDTO commentDTO) {
        return commentRepository.commentModify(commentDTO);
    }

    //댓글 삭제
    public int commentRemove(Integer cno, Integer bno, String memberId){
        int rowCnt = boardRepository.updateCommentCnt(bno,-1);
        System.out.println("updateCommentCnt-rowCnt = " + rowCnt );

        rowCnt = commentRepository.delete(cno, memberId);
        System.out.println("rowCnt=" +rowCnt);
        return rowCnt;
    }

}
