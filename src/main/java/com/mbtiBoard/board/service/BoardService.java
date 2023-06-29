package com.mbtiBoard.board.service;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.dto.PageDTO;
import com.mbtiBoard.board.dto.mbtiPageDTO;
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

//    //글 목록 불러오기
//    public List<BoardDTO> findAll() {
//        return boardRepository.findAll();
//    }

    //상세글
    public BoardDTO findByBno(Integer bno) {
        return boardRepository.findByBno(bno);
    }

    //글 상세보기 클릭시 조회수 증가
    public void updateHits(Integer bno) {
        boardRepository.updateHits(bno);
    }

    //글수정
    public void boardUpdate(BoardDTO boardDTO) {
        boardRepository.boardUpdate(boardDTO);
    }
    //글삭제
    public void boardDelete(Integer bno) {
        boardRepository.boardDelete(bno);
    }

    //전체글 게시판 페이징
    int pageLimit = 3;// 한 페이지당 보여줄 글 갯수
    int blockLimit = 3;// 하단에 보여줄 페이지 번호 갯수
    public List<BoardDTO> pagingList(int page, String keyword, String option) {


        /*
        1페이지당 3개의 글
            1page => 0
            2page => 3
            3page => 6

            3 * (page-1)

         */

        int pageStart = ( page - 1 ) * pageLimit;
        System.out.println("pageStart = " + pageStart);
        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("start",pageStart);
        pagingParams.put("limit",pageLimit);
        pagingParams.put("keyword", keyword);
        pagingParams.put("option",option);

        List<BoardDTO> pagingList = boardRepository.pagingList(pagingParams);

        return pagingList;
    }

    public PageDTO pagingParam(int page, String keyword, String option) {
        //전체 글 갯수 조회
        Map<String, Object> countCondition = new HashMap<>();
        countCondition.put("keyword", keyword);
        countCondition.put("option", option);
        int boardCount = boardRepository.boardCount(countCondition);
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
        pageDTO.setKeyword(keyword);
        pageDTO.setOption(option);
        return pageDTO;
    }

    //카테고리 페이징
    int mbtiPageLimit = 3;// 한 페이지당 보여줄 글 갯수
    int mbtiBlockLimit = 3;// 하단에 보여줄 페이지 번호 갯수
    public List<BoardDTO> mbtiPagingList(int mbtiPage, String boardMbti, String keyword, String option) {
        int mbtiPageStart = ( mbtiPage - 1 ) * mbtiPageLimit;
        System.out.println("mbtiPageStart = " + mbtiPageStart);
        Map<String, Object> pagingParams = new HashMap<>();

        pagingParams.put("start",mbtiPageStart);
        pagingParams.put("limit",mbtiPageLimit);
        pagingParams.put("boardMbti", boardMbti);
        pagingParams.put("keyword", keyword);
        pagingParams.put("option", option);


        List<BoardDTO> mbtiPagingList = boardRepository.mbtiPagingList(pagingParams);
        System.out.println("mbtiPagingList = " + mbtiPagingList);
        return mbtiPagingList;
    }

   public mbtiPageDTO mbtiPagingParam(int mbtiPage, String boardMbti, String keyword, String option) {

        //전체 글 갯수 조회
       Map<String, Object> mbtiCountCondition = new HashMap<>();
       mbtiCountCondition.put("keyword", keyword);
       mbtiCountCondition.put("option", option);
       mbtiCountCondition.put("boardMbti", boardMbti);

        int mbtiBoardCount = boardRepository.mbtiBoardCount(mbtiCountCondition);
        System.out.println("mbtiCountCondition="+mbtiCountCondition);
        System.out.println("mbtiBoardCount="+mbtiBoardCount);
        System.out.println("SmbtiPage = " + mbtiPage + ", SboardMbti = " + boardMbti);
        // 전체 페이지 갯수 계산 (10/3 = 3.333 => 페이지 총 4
        int mbtiMaxPage = (int)(Math.ceil((double) mbtiBoardCount/ mbtiPageLimit));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)
        int mbtiStartPage = (((int)(Math.ceil((double) mbtiPage / mbtiBlockLimit))) - 1) * mbtiBlockLimit + 1;
        // 끝 페이지 값 계산(3,6,9,12, ~~~~)
        int mbtiEndPage = mbtiStartPage + mbtiBlockLimit - 1;
        if (mbtiEndPage > mbtiMaxPage) {
            mbtiEndPage = mbtiMaxPage;
        }
        mbtiPageDTO mbtiPageDTO = new mbtiPageDTO();
        mbtiPageDTO.setMbtiPage(mbtiPage);
        mbtiPageDTO.setMbtiMaxPage(mbtiMaxPage);
        mbtiPageDTO.setMbtiStartPage(mbtiStartPage);
        mbtiPageDTO.setMbtiEndPage(mbtiEndPage);
        mbtiPageDTO.setBoardMbti(boardMbti);
        mbtiPageDTO.setKeyword(keyword);
        mbtiPageDTO.setOption(option);

        return mbtiPageDTO;
    }


}
