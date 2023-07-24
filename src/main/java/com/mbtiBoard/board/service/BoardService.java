package com.mbtiBoard.board.service;

import com.mbtiBoard.admin.dto.AdminPageDTO;
import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.dto.PageDTO;
import com.mbtiBoard.board.dto.mbtiPageDTO;
import com.mbtiBoard.board.dto.myListPageDTO;
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

        //댓글 갯수
        //int commentCnt =  boardRepository.updateCommentCnt(bno,cnt);

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


    //마이페이지 - 내 글 보기(페이징)
    int myListPageLimit = 3;// 한 페이지당 보여줄 글 갯수
    int myListBlockLimit = 3;// 하단에 보여줄 페이지 번호 갯수
    public List<BoardDTO> myListPagingList(int myListPage, String keyword, String option, String boardId ) {
        int myListPageStart = ( myListPage - 1 ) * myListPageLimit;
        System.out.println("myListPageStart = " + myListPageStart);
        System.out.println("myListPageLimit = " + myListPageLimit);

        Map<String, Object> pagingParams = new HashMap<>();

        pagingParams.put("start",myListPageStart);
        pagingParams.put("limit",myListPageLimit);

        pagingParams.put("keyword", keyword);
        pagingParams.put("option", option);
        pagingParams.put("boardId",boardId);


        List<BoardDTO> myListPagingList = boardRepository.myListPagingList(pagingParams);
        System.out.println("myListPagingList = " + myListPagingList);
        return myListPagingList;
    }

    public myListPageDTO myListPagingParam(int myListPage, String keyword, String option, String boardId) {
        Map<String, Object> myListCountCondition = new HashMap<>();
        myListCountCondition.put("keyword", keyword);
        myListCountCondition.put("option", option);
        myListCountCondition.put("boardId",boardId);

        int myListBoardCount = boardRepository.myListBoardCount(myListCountCondition);
        System.out.println("myListCountCondition="+myListCountCondition);
        System.out.println("myListBoardCount="+myListBoardCount);
        System.out.println("myListPage = " + myListPage );
        // 전체 페이지 갯수 계산 (10/3 = 3.333 => 페이지 총 4
        int myListMaxPage = (int)(Math.ceil((double) myListBoardCount/ myListPageLimit));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)
        int myListStartPage = (((int)(Math.ceil((double) myListPage / myListBlockLimit))) - 1) * myListBlockLimit + 1;
        // 끝 페이지 값 계산(3,6,9,12, ~~~~)
        int myListEndPage = myListStartPage + myListBlockLimit - 1;
        if (myListEndPage > myListMaxPage) {
            myListEndPage = myListMaxPage;
        }
        myListPageDTO myListPageDTO = new myListPageDTO();
        myListPageDTO.setMyListPage(myListPage);
        myListPageDTO.setMyListMaxPage(myListMaxPage);
        myListPageDTO.setMyListStartPage(myListStartPage);
        myListPageDTO.setMyListEndPage(myListEndPage);
        myListPageDTO.setKeyword(keyword);
        myListPageDTO.setOption(option);
        myListPageDTO.setBoardId(boardId);

        return myListPageDTO;
    }


    //관리자페이지- 전체글 관리
    int adminPageLimit = 5;// 한 페이지당 보여줄 글 갯수
    int adminBlockLimit = 5;// 하단에 보여줄 페이지 번호 갯수
    public List<BoardDTO> adminPagingList(int adminPage, String keyword, String option) {
        int adminPageStart = ( adminPage - 1 ) * adminPageLimit;
        System.out.println("adminPageStart = " + adminPageStart);

        //댓글 갯수
        //int commentCnt =  boardRepository.updateCommentCnt(bno,cnt);

        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("start",adminPageStart);
        pagingParams.put("limit",adminBlockLimit);
        pagingParams.put("keyword", keyword);
        pagingParams.put("option",option);

        List<BoardDTO> adminPagingList = boardRepository.adminPagingList(pagingParams);

        return adminPagingList;
    }

    public AdminPageDTO adminPagingParam(int adminPage, String keyword, String option) {
        //전체 글 갯수 조회
        Map<String, Object> adminCountCondition = new HashMap<>();
        adminCountCondition.put("keyword", keyword);
        adminCountCondition.put("option", option);
        int adminBoardCount = boardRepository.adminBoardCount(adminCountCondition);
        // 전체 페이지 갯수 계산 (10/3 = 3.333 => 페이지 총 4
        int adminMaxPage = (int)(Math.ceil((double) adminBoardCount/ adminPageLimit));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)
        int adminStartPage = (((int)(Math.ceil((double) adminPage / adminBlockLimit))) - 1) * adminBlockLimit + 1;
        // 끝 페이지 값 계산(3,6,9,12, ~~~~)
        int adminEndPage = adminStartPage + adminBlockLimit - 1;
        if (adminEndPage > adminMaxPage) {
            adminEndPage = adminMaxPage;
        }
        AdminPageDTO adminPageDTO = new AdminPageDTO();
        adminPageDTO.setAdminPage(adminPage);
        adminPageDTO.setAdminMaxPage(adminMaxPage);
        adminPageDTO.setAdminStartPage(adminStartPage);
        adminPageDTO.setAdminEndPage(adminEndPage);
        adminPageDTO.setKeyword(keyword);
        adminPageDTO.setOption(option);
        return adminPageDTO;
    }
}
