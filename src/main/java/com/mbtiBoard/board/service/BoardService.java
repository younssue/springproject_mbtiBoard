package com.mbtiBoard.board.service;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {
    private  final BoardRepository boardRepository;
    //글 작성
    public int boardSave(BoardDTO boardDTO) {
        return boardRepository.boardSave(boardDTO);
    }

    //글 목록 불러오기
    public List<BoardDTO> findAll() {
        return boardRepository.findAll();
    }
}
