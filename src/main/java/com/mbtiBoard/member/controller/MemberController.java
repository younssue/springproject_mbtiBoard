package com.mbti.board.controller;

import com.mbti.board.dto.MemberDTO;
import com.mbti.board.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")//공통 주소
@RequiredArgsConstructor
public class MemberController {
    private  final MemberService memberService;
    @GetMapping("/save")
    public String saveForm(){
        return "save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){

        int saveResult = memberService.save(memberDTO);
        if(saveResult>0){
            return "login"; //가입성공: 회원가입이 되면 로그인 화면으로 이동
        }else {
            return "save"; //가입실패: 회원가입이 되지 않으면 다시 회원가입 페이지로 이동
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    @PostMapping("/login")
    public  String login(@ModelAttribute MemberDTO memberDTO,
                         HttpSession session){
        boolean loginResult = memberService.login(memberDTO);
        if(loginResult){
            session.setAttribute("loginId",memberDTO.getMemberId());
            return "index";
        }else {
            return "login";
        }
    }
}

