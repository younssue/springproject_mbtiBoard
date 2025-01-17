package com.mbtiBoard.board.controller;

import com.mbtiBoard.board.dto.*;
import com.mbtiBoard.board.service.BoardService;
import com.mbtiBoard.board.service.CommentService;
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
    private final CommentService commentService;
    Integer condition;

    //글작성
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
//            return "redirect:/list";
            return "redirect:/";
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
                            HttpSession session,
                            @RequestParam(value = "mbtiPage", required = false , defaultValue = "1") int mbtiPage,
                            @RequestParam (value = "boardMbti",required = false,defaultValue = "")String boardMbti,
                            @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
                            @RequestParam (value = "option",required = false,defaultValue = "")String option,
                            @RequestParam(value = "myListPage", required = false , defaultValue = "1") int myListPage,
                            @RequestParam (value = "boardId", required = false,defaultValue = "")String boardId,
                            @RequestParam (value = "condition", required = false,defaultValue = "")Integer condition,
                            @RequestParam(value = "adminPage", required = false , defaultValue = "1") int adminPage
    ){

        System.out.println("condition = " + condition);
        System.out.println("boardBno = " + bno);
        System.out.println( "Detail_page = " + page );
        System.out.println( "mbti_Detail_page = " + mbtiPage );
        System.out.println( "Detail_ boardMbti = " + boardMbti);
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

        /* 댓글 목록 가져오기*/
//        List<CommentDTO> commentDTOList = commentService.getList(bno);
//        System.out.printf("commentDTOList="+ commentDTOList);

        List<CommentDTO> commentDTO =  commentService.getList(bno);

        model.addAttribute("condition", condition);
        model.addAttribute("board",boardDTO);
        //page값을 requestParam으로 받아와서 model에 담아 Jstl로 넘겨줌
        model.addAttribute("page",page);
        //카데고리 mbtiPage 담아 보내기
        model.addAttribute("mbtiPage",mbtiPage);
        model.addAttribute("boardMbti",boardMbti);
        model.addAttribute("keyword", keyword);
        model.addAttribute("option", option);
       // model.addAttribute("commentList",commentDTOList);
        model.addAttribute("comment", commentDTO);
        //마이페이지-내글목록 myListPage 담아보내기
        model.addAttribute("myListPage", myListPage);
        model.addAttribute("boardId", boardId);
        model.addAttribute("adminPage", adminPage);
        return "/board/boardListDetail";

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
        return "redirect:/";
    }

    //페이징 처리 방법 배우기
    //@RequestParam(value = "page", required = false , defaultValue = "1"
    //board/paging?page=1
    //page=1이 필수로 있어야 한다는 것은 아니다 (required = false)
    //하지만 page=1 로 default값을 가진다 ( defaultValue = "1")
//    @GetMapping("/list")
//    public String paging (Model model,
//                          @RequestParam(value = "page", required = false , defaultValue = "1") int page,
//                          @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
//                          @RequestParam (value = "option",required = false,defaultValue = "")String option
//                          ){
//        System.out.println(" page = " + page);
//        System.out.println(" keyword = " + keyword);
//        System.out.println(" option = " + option);
//        condition = false;
//        //해당 페이지에서 보여줄 글 목록
//        List<BoardDTO> pagingList = boardService.pagingList(page,keyword,option);
//        System.out.println("pagingList="+pagingList);
//        PageDTO pageDTO = boardService.pagingParam(page,keyword,option);
//        model.addAttribute("boardList",pagingList);
//        model.addAttribute("paging", pageDTO);
//        return "board/boardList";
//    }



    //mbti 카데고리 별 페이징
    @GetMapping("/mbtilist")
    public String mbtiPaging (Model model,
                              @RequestParam(value = "mbtiPage", required = false , defaultValue = "1") int mbtiPage,
                              @RequestParam (value = "boardMbti",required = false,defaultValue = "ENFJ")String boardMbti,
                              @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
                              @RequestParam (value = "option",required = false,defaultValue = "")String option,
                               @RequestParam (value = "condition", required = false,defaultValue = "2")Integer condition
                              ){
        //글 상세보기에서 목록(listFn)버튼 실행시 조건
        condition =2;
        System.out.println(" mbtipage = " + mbtiPage);
        System.out.println( " boardMbti = " + boardMbti);
        System.out.println(" keyword = " + keyword);
        System.out.println(" option = " + option);
        //해당 페이지에서 보여줄 글 목록
        List<BoardDTO> mbtiPagingList = boardService.mbtiPagingList(mbtiPage,boardMbti,keyword,option);
        System.out.println("mbtiPagingList="+mbtiPagingList);
        mbtiPageDTO mbtiPageDTO = boardService.mbtiPagingParam(mbtiPage,boardMbti,keyword,option);

        // 각 게시글에 대한 댓글 갯수를 조회하여 BoardDTO에 추가
        for (BoardDTO boardDTO : mbtiPagingList) {
            int commentCount = commentService.getCount(boardDTO.getBno());
            boardDTO.setComment_cnt(commentCount);
        }

        model.addAttribute("mbtiBoardList",mbtiPagingList);
        model.addAttribute("mbtiPaging", mbtiPageDTO);
        model.addAttribute("condition", condition);
        return "board/mbtiBoardList";
    }

}
