package com.mbtiBoard.board.repository;

import com.mbtiBoard.board.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BoardRepository {
    private final SqlSessionTemplate sql;
    public int boardSave(BoardDTO boardDTO){
        return sql.insert("Board.boardSave", boardDTO);
    }
}
