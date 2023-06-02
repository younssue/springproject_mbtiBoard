package com.mbtiBoard.board.service;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BoardService {
    private  final BoardRepository boardRepository;
    public int boardSave(BoardDTO boardDTO) {
        return boardRepository.boardSave(boardDTO);
    }
}
