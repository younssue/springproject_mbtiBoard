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

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequiredArgsConstructor
public class HomeController {


    private  final BoardService boardService;
//    @GetMapping("/")
//    public String index(){
//        return "mainIndex2";
//    }


    @GetMapping("/")
    public String paging (Model model, HttpSession session,
                          @RequestParam(value = "page", required = false , defaultValue = "1") int page,
                          @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
                          @RequestParam (value = "option",required = false,defaultValue = "")String option
    ){

        String loginId = (String) session.getAttribute("loginId");
        System.out.println(" page = " + page);
        System.out.println(" keyword = " + keyword);
        System.out.println(" option = " + option);
//        condition = false;
        //해당 페이지에서 보여줄 글 목록
        List<BoardDTO> pagingList = boardService.pagingList(page,keyword,option);
        System.out.println("pagingList="+pagingList);
        PageDTO pageDTO = boardService.pagingParam(page,keyword,option);
        model.addAttribute("boardList",pagingList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("loginId", loginId);
        return "mainIndex2";
    }


    //mbti 카데고리 별 페이징
//    @GetMapping("/mbtilist")
//    public String mbtiPaging (Model model,
//                              @RequestParam(value = "mbtiPage", required = false , defaultValue = "1") int mbtiPage,
//                              @RequestParam (value = "boardMbti",required = false,defaultValue = "")String boardMbti,
//                              @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
//                              @RequestParam (value = "option",required = false,defaultValue = "")String option
//    ){
//
//        System.out.println(" mbtipage = " + mbtiPage);
//        System.out.println( " boardMbti = " + boardMbti);
//        System.out.println(" keyword = " + keyword);
//        System.out.println(" option = " + option);
//        //해당 페이지에서 보여줄 글 목록
//        List<BoardDTO> mbtiPagingList = boardService.mbtiPagingList(mbtiPage,boardMbti,keyword,option);
//        System.out.println("mbtiPagingList="+mbtiPagingList);
//        mbtiPageDTO mbtiPageDTO = boardService.mbtiPagingParam(mbtiPage,boardMbti,keyword,option);
//        model.addAttribute("mbtiBoardList",mbtiPagingList);
//        model.addAttribute("mbtiPaging", mbtiPageDTO);
//        return "mainIndex2";
//    }
}
