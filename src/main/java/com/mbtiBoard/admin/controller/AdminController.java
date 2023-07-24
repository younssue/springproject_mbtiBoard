package com.mbtiBoard.admin.controller;

import com.mbtiBoard.admin.dto.AdminPageDTO;
import com.mbtiBoard.admin.dto.MemberPageDTO;
import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.service.BoardService;
import com.mbtiBoard.member.dto.MemberDTO;
import com.mbtiBoard.member.service.MemberService;
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
@RequestMapping("/admin")
public class AdminController {
    private final MemberService memberService;
    private final BoardService boardService;

    Integer memberCondition;
    @GetMapping("/")
    public String adminPage() {
        return "admin/adminPage";
    }


    //회원목록 리스트
//    @GetMapping("/memberList")
//    public String findAll(Model model) {
//        List<MemberDTO> memberDTOList = memberService.findAll();
//        model.addAttribute("memberList", memberDTOList);
//        return "admin/memberList";
//    }

    //회원목록 리스트 페이징 추가
    @GetMapping("/memberList")
    public String findAll (Model model, HttpSession session,
                                    @RequestParam(value = "memberPage", required = false , defaultValue = "1") int memberPage,
                                    @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
                                    @RequestParam (value = "option",required = false,defaultValue = "")String option
//                                    @RequestParam (value = "condition", required = false,defaultValue = "5")Integer memberCondition
    ){
        //글 상세보기에서 목록(listFn)버튼 실행시 조건
//        memberCondition =5;

        System.out.println(" memberPage = " + memberPage);
        System.out.println(" admin_keyword = " + keyword);
        System.out.println(" admin_option = " + option);

        //해당 페이지에서 보여줄 글 목록
        List<MemberDTO> memberPagingList = memberService.memberPagingList(memberPage,keyword,option);
        System.out.println("memberPagingList="+memberPagingList);
        MemberPageDTO memberPageDTO = memberService.memberPagingParam(memberPage,keyword,option);



        model.addAttribute("memberList",memberPagingList);
        model.addAttribute("paging", memberPageDTO);
//        model.addAttribute("condition", condition);
        return "admin/memberList";
    }




    //회원 상세조회
    // /admin?id=
//    @GetMapping
//    public String findById(@RequestParam("id") String memberId, Model model) {
//        MemberDTO memberDTO = memberService.findById(memberId);
//        model.addAttribute("member", memberDTO);
//        return "member/memberDetail";
//    }

    //회원삭제
    // /admin/delete?id=
    @GetMapping("/delete")
    public String delete(@RequestParam("id") String memberId) {
        memberService.delete(memberId);
        return "redirect:/admin/memberList"; //redirect방식은 jsp 이름이 아닌 url 주소값으로 줘야한다
    }



    //전체 게시글(최신순)
    @GetMapping("/boardList")
    public String adminBoardPaging (Model model, HttpSession session,
                          @RequestParam(value = "adminPage", required = false , defaultValue = "1") int adminPage,
                          @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
                          @RequestParam (value = "option",required = false,defaultValue = "")String option,
                          @RequestParam (value = "condition", required = false,defaultValue = "4")Integer condition
    ){
        //글 상세보기에서 목록(listFn)버튼 실행시 조건
        condition =4;
        String loginId = (String) session.getAttribute("loginId");
        System.out.println(" admin_page = " + adminPage);
        System.out.println(" admin_keyword = " + keyword);
        System.out.println(" admin_option = " + option);

        //해당 페이지에서 보여줄 글 목록
        List<BoardDTO> adminPagingList = boardService.adminPagingList(adminPage,keyword,option);
        System.out.println("adminPagingList="+adminPagingList);
        AdminPageDTO adminPageDTO = boardService.adminPagingParam(adminPage,keyword,option);



        model.addAttribute("boardList",adminPagingList);
        model.addAttribute("paging", adminPageDTO);
        model.addAttribute("condition", condition);
        model.addAttribute("loginId", loginId);
        return "admin/adminBoardList";
    }

}
