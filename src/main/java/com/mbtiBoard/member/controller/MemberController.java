package com.mbtiBoard.member.controller;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.dto.PageDTO;
import com.mbtiBoard.board.dto.myListPageDTO;
import com.mbtiBoard.board.service.BoardService;
import com.mbtiBoard.member.dto.MemberDTO;
import com.mbtiBoard.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")//공통 주소
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;
    //private final BoardDTO boardDTO;
    private final BoardService boardService;

    Integer condition;

    //회원가입
    @GetMapping("/save")
    public String saveForm() {
        return "member/memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {

        int saveResult = memberService.save(memberDTO);
        if (saveResult > 0) {
            return "member/login"; //가입성공: 회원가입이 되면 로그인 화면으로 이동
        } else {
            return "member/memberSave"; //가입실패: 회원가입이 되지 않으면 다시 회원가입 페이지로 이동
        }
    }

    //로그인
    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO,
                        HttpSession session) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {

            session.setAttribute("loginId", memberDTO.getMemberId());
            if("admin".equals(memberDTO.getMemberId()) && memberDTO.getMemberPassword().equals("1234")){
                //관리자 계정-> 관리자 페이지로 이동

                return "redirect:/admin/";

            }else {

                return "member/myPage";
            }
        } else {
            return "member/login";
        }
    }

    //로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        System.out.println("test = " + 1101);
        session.removeAttribute("loginId"); // "loginId" 속성 제거
        System.out.println("loginId = " + session);
        session.invalidate();
        return "redirect:/";
    }


    //수정화면 요청
    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        //세션에 저장된 나의 아이디 가져오기
        String loginId = (String) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.findByMemberId(loginId);
        model.addAttribute("member", memberDTO);
        return "member/memberUpdate";
    }

    //회원 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        boolean result = memberService.update(memberDTO);
        System.out.println("Controller memberDTO = " + memberDTO);
        if (result) {
            return "redirect:/member?id=" + memberDTO.getMemberId();
        } else {
            return "mainIndex";
        }
    }


    @GetMapping
    public String findById(@RequestParam("id") String memberId, Model model) {
        MemberDTO memberDTO = memberService.findById(memberId);
        model.addAttribute("member", memberDTO);
        return "member/memberDetail";
    }

    //아이디 중복체크
    @PostMapping("/id-check")
    public @ResponseBody String idCheck(@RequestParam("memberId") String memberId) {
        System.out.println("Idcheck_memberId = " + memberId);
        String checkResult = memberService.idCheck(memberId);
        return checkResult; //String checkResult는 memberSave.jsp ajax success: function(res) 의 res값으로 들어온다
    }


    // 마이페이지
    @GetMapping("/myPage")
    public String myPage(HttpSession session) {
        String loginId = (String) session.getAttribute("loginId");
        return "member/myPage";
    }



   //내 글 리스트
    @GetMapping("/myList")
    public String myListPaging (Model model, HttpSession session,
                          @RequestParam(value = "myListPage", required = false , defaultValue = "1") int myListPage,
                          @RequestParam (value = "keyword",required = false,defaultValue = "")String keyword,
                          @RequestParam (value = "option",required = false,defaultValue = "")String option,
                          @RequestParam (value = "boardId", required = false,defaultValue = "")String boardId,
                          @RequestParam (value = "condition", required = false,defaultValue = "3")Integer condition
    ){

        boardId = (String) session.getAttribute("loginId");


        //글 상세보기에서 목록(listFn)버튼 실행시 조건
        condition =3;

        System.out.println(" myListPage = " + myListPage);
        System.out.println(" keyword = " + keyword);
        System.out.println(" option = " + option);
        System.out.println(" boardId = " + boardId);
//        condition = false;
        //해당 페이지에서 보여줄 글 목록


        List<BoardDTO> pagingList = boardService.myListPagingList(myListPage,keyword,option,boardId);
        System.out.println("mylIst_pagingList="+pagingList);
        myListPageDTO myListPageDTO = boardService.myListPagingParam(myListPage,keyword,option,boardId);



        model.addAttribute("boardList",pagingList);
        model.addAttribute("myListPaging", myListPageDTO);
        model.addAttribute("boardId", boardId);
        model.addAttribute("condition", condition);
        return "member/myList";
    }
}

