package com.mbtiBoard.board.repository;

import com.mbtiBoard.board.dto.BoardDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class BoardRepository {
    private final SqlSessionTemplate sql;
    // 글 작성
    public int boardSave(BoardDTO boardDTO){
        return sql.insert("Board.boardSave", boardDTO);
    }

//    //글 목록 불러오기
//    public List<BoardDTO> findAll() {
//        return sql.selectList("Board.findAll");
//    }

    //글 상세 보기
    public BoardDTO findByBno(Integer bno) {
        return sql.selectOne("Board.findByBno", bno);
    }

    //글 상세보기 클릭시 조회수 증가
    public void updateHits(Integer bno) {
        sql.update("Board.updateHits", bno);
    }
    //글수정
    public void boardUpdate(BoardDTO boardDTO) {
        sql.update("Board.boardUpdate", boardDTO);
    }
    //글삭제
    public void boardDelete(Integer bno) {
        sql.delete("Board.boardDelete",bno);
    }

    //전체 게시판 페이징
    public List<BoardDTO> pagingList(Map<String, Object> pagingParams) {
        return sql.selectList("Board.pagingList",pagingParams);
    }
    //전체글 갯수
/*    public int boardCount(String keyword, String option) {

        return sql.selectOne("Board.boardCount",);
    }*/

    public int boardCount(Map<String, Object> countCondition) {
        return sql.selectOne("Board.boardCount",countCondition);
    }

    //카테고리 별 글 갯수
    public int mbtiBoardCount(String boardMbti) {
        return sql.selectOne("Board.mbtiBoardCount",boardMbti);
    }

    //카테고리 게시판 페이징
    public List<BoardDTO> mbtiPagingList(Map<String, Object> pagingParams) {
        return sql.selectList("Board.mbtiPagingList",pagingParams);
    }



}
