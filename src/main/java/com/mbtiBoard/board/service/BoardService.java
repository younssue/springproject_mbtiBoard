package com.mbtiBoard.board.service;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.dto.PageDTO;
import com.mbtiBoard.board.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    //상세글
    public BoardDTO findByBno(Integer bno) {
        return boardRepository.findByBno(bno);
    }

    //글 상세보기 클릭시 조회수 증가
    public void updateHits(Integer bno) {
        boardRepository.updateHits(bno);
    }

    public void boardUpdate(BoardDTO boardDTO) {
        boardRepository.boardUpdate(boardDTO);
    }

    public void boardDelete(Integer bno) {
        boardRepository.boardDelete(bno);
    }


    int pageLimit = 3;// 한 페이지당 보여줄 글 갯수
    int blockLimit = 3;// 하단에 보여줄 페이지 번호 갯수
    public List<BoardDTO> pagingList(int page) {


        /*
        1페이지당 5개의 글
            1page => 0
            2page => 3
            3page => 6

            3 * (page-1)

         */

        int pageStart = ( page - 1 ) * pageLimit;
        System.out.println("pageStart = " + pageStart);
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start",pageStart);
        pagingParams.put("limit",pageLimit);
        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParams);
        System.out.println("pagingList = " + pagingList);
        return pagingList;
    }

    public PageDTO pagingParam(int page) {
        //전체 글 갯수 조회
        int boardCount = boardRepository.boardCount();
        // 전체 페이지 갯수 계산 (10/3 = 3.333 => 페이지 총 4
        int maxPage = (int)(Math.ceil((double) boardCount/ pageLimit));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 끝 페이지 값 계산(3,6,9,12, ~~~~)
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setStartPage(startPage);
        pageDTO.setEndPage(endPage);
        return pageDTO;
    }
}
