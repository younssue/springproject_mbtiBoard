package com.mbtiBoard.board.controller;

import com.mbtiBoard.board.dto.*;
import com.mbtiBoard.board.service.BoardService;
import com.mbtiBoard.member.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    //게시판 글작성
/*    @GetMapping("/list")
    public String boardIndex(){
        return "board/boardList4";
    }*/
    @GetMapping("/save")
    public  String boardSaveForm(){
        return "board/boardSave";
    }
    @PostMapping("/save")
    public String boardSave(@ModelAttribute BoardDTO boardDTO, HttpSession session){
//        HttpSession session = request.getSession();
        String loginId = (String) session.getAttribute("loginId");

        boardDTO.setBoardId(loginId); //로그인 session값을 가져와서 boardId 값에 넣기

        int boardSaveResult = boardService.boardSave(boardDTO);
        if(boardSaveResult > 0){
            return "redirect:/board/list";
        }else{
            return "board/boardSave";
        }
    }

    // 게시판 글 목록 출력
//    @GetMapping("/list")
//    public String findAll(Model model){
//        List<BoardDTO> boardDTOList = boardService.findAll();
//        model.addAttribute("boardList",boardDTOList);
//        return "board/boardList";
//    }
    //글 상세조회
    @GetMapping
    public String findByBno(@RequestParam("bno") Integer bno,
                            @RequestParam(value = "page", required = false , defaultValue = "1") int page,
                            Model model,
                            HttpSession session){
        System.out.println("boardBno = " + bno);
        System.out.println( "Detail_page = " + page );

        //글 상세보기 클릭시 조회수 증가
        boardService.updateHits(bno);
        BoardDTO boardDTO = boardService.findByBno(bno);
        //글 작성한 사람과 동일인일 때 수정가능
        String loginId = (String) session.getAttribute("loginId");
        if (loginId != null && loginId.equals(boardDTO.getBoardId())) {
            model.addAttribute("editable", true);
        } else {
            model.addAttribute("editable", false);
        }


        model.addAttribute("board",boardDTO);
        //page값을 requestParam으로 받아와서 model에 담아 Jstl로 넘겨줌
        model.addAttribute("page",page);
        return "board/boardListDetail";

    }

    //글 수정
    @GetMapping("/update")
    public String updateForm(@RequestParam("bno") Integer bno,Model model,HttpSession session){
        BoardDTO boardDTO = boardService.findByBno(bno);
        model.addAttribute("board", boardDTO);

        return "board/boardUpdate";
    }

    @PostMapping("/update")
    public String boardUpdate(@ModelAttribute BoardDTO boardDTO , Model model,HttpSession session){
        boardService.boardUpdate(boardDTO);
        BoardDTO dto = boardService.findByBno(boardDTO.getBno());
        System.out.println("bno="+ boardDTO.getBno());
        System.out.println("dto="+ dto);

        return "board/boardListDetail";
        //redirect를 할 경우 글 상세보기 메서드를 다시 실행하게 된다
        //그렇게 되면 글 수정 후 다시 글 상세창으로 돌아갔을 때 조회수가 올라가게 된다
        //return "redirect:/board?bno="+boardDTO.getBno();
    }

    //글삭제
    @GetMapping("/delete")
    public String boardDelete(@RequestParam("bno") Integer bno){
        System.out.println("bno = " + bno);
        boardService.boardDelete(bno);
        return "redirect:/board/list";
    }

    //페이징 처리 방법 배우기
    //@RequestParam(value = "page", required = false , defaultValue = "1"
    //board/paging?page=1
    //page=1이 필수로 있어야 한다는 것은 아니다 (required = false)
    //하지만 page=1 로 default값을 가진다 ( defaultValue = "1")
    @GetMapping("/list")
    public String paging (Model model,
                          @RequestParam(value = "page", required = false , defaultValue = "1") int page){
        System.out.println(" page = " + page);
        //해당 페이지에서 보여줄 글 목록
        List<BoardDTO> pagingList = boardService.pagingList(page);
        System.out.println("pagingList="+pagingList);
        PageDTO pageDTO = boardService.pagingParam(page);
        model.addAttribute("boardList",pagingList);
        model.addAttribute("paging", pageDTO);
        return "board/boardList";
    }

/*    @GetMapping("/list")
    public String searchPaging (Model model, SearchCondition searchCondition){
        int boardCount = boardService.getSearchCount(searchCondition);
        model.addAttribute("boardCount", boardCount);
        System.out.println("SearchBoardCount="+ boardCount);
        System.out.println("searchCondition = " + searchCondition);
        searchCondition.setStart();
        searchCondition.setEnd();
        System.out.println("page = " + searchCondition.getPage() + ", Start = " + searchCondition.getStart() + ",end = "+ searchCondition.getEnd());
        SearchPageHandler searchPageHandler = new SearchPageHandler(boardCount,searchCondition);

        List<BoardDTO> boardList = boardService.getSearchSelectPage(searchCondition);
        model.addAttribute("boardList", boardList);
        model.addAttribute("searchPageHandler", searchPageHandler);

        return "board/boardList2";
    }*/


    //mbti 카데고리 별 페이징
    @GetMapping("/mbtilist")
    public String mbtiPaging (Model model,
                              @RequestParam(value = "mbtiPage", required = false , defaultValue = "1") int mbtiPage,
                              @RequestParam String boardMbti){
        System.out.println(" mbtipage = " + mbtiPage);
        System.out.println( " boardMbti = " + boardMbti);
        //해당 페이지에서 보여줄 글 목록
        List<BoardDTO> mbtiPagingList = boardService.mbtiPagingList(mbtiPage,boardMbti);
        System.out.println("mbtiPagingList="+mbtiPagingList);
        mbtiPageDTO mbtiPageDTO = boardService.mbtiPagingParam(mbtiPage,boardMbti);
        model.addAttribute("mbtiBoardList",mbtiPagingList);
        model.addAttribute("mbtiPaging", mbtiPageDTO);
        return "board/mbtiBoardList";
    }

}
