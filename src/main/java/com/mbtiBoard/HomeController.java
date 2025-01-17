package com.mbtiBoard;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.dto.PageDTO;
import com.mbtiBoard.board.service.BoardService;
import com.mbtiBoard.board.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor

public class HomeController {

    //Integer condition;
    private  final BoardService boardService;
    private  final CommentService commentService;
//    @GetMapping("/")
//    public String index(){
//        return "mainIndex2";
//    }


    @GetMapping("/")
    public String paging (Model model, HttpSession session,
                          @RequestParam(value = "page", required = false , defaultValue = "1") int page,
                          @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
                          @RequestParam (value = "option",required = false,defaultValue = "")String option,
                          @RequestParam (value = "condition", required = false,defaultValue = "1")Integer condition
    ){
        //글 상세보기에서 목록(listFn)버튼 실행시 조건
        condition =1;
        String loginId = (String) session.getAttribute("loginId");
        System.out.println(" page = " + page);
        System.out.println(" keyword = " + keyword);
        System.out.println(" option = " + option);

        //해당 페이지에서 보여줄 글 목록
        List<BoardDTO> pagingList = boardService.pagingList(page,keyword,option);
        System.out.println("pagingList="+pagingList);
        PageDTO pageDTO = boardService.pagingParam(page,keyword,option);

        // 각 게시글에 대한 댓글 갯수를 조회하여 BoardDTO에 추가
        for (BoardDTO boardDTO : pagingList) {
            int commentCount = commentService.getCount(boardDTO.getBno());
            boardDTO.setComment_cnt(commentCount);
        }



        model.addAttribute("boardList",pagingList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("loginId", loginId);
        model.addAttribute("condition", condition);
        return "mainIndex";
    }


}
