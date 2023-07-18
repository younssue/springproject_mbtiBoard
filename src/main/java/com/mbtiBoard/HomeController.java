package com.mbtiBoard;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.dto.PageDTO;
import com.mbtiBoard.board.dto.mbtiPageDTO;
import com.mbtiBoard.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor

public class HomeController {

    //Integer condition;
    private  final BoardService boardService;
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
        condition =1;
        String loginId = (String) session.getAttribute("loginId");
        System.out.println(" page = " + page);
        System.out.println(" keyword = " + keyword);
        System.out.println(" option = " + option);

        //해당 페이지에서 보여줄 글 목록
        List<BoardDTO> pagingList = boardService.pagingList(page,keyword,option);
        System.out.println("pagingList="+pagingList);
        PageDTO pageDTO = boardService.pagingParam(page,keyword,option);



        model.addAttribute("boardList",pagingList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("loginId", loginId);
        model.addAttribute("condition", condition);
        return "mainIndex2";
    }


}
