package com.mbtiBoard.member.controller;

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
    private  final MemberService memberService;

    //회원가입
    @GetMapping("/save")
    public String saveForm(){
        return "member/memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO){

        int saveResult = memberService.save(memberDTO);
        if(saveResult>0){
            return "member/login"; //가입성공: 회원가입이 되면 로그인 화면으로 이동
        }else {
            return "member/memberSave"; //가입실패: 회원가입이 되지 않으면 다시 회원가입 페이지로 이동
        }
    }

    //로그인
    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public  String login(@ModelAttribute MemberDTO memberDTO,
                         HttpSession session){
        boolean loginResult = memberService.login(memberDTO);
        if(loginResult){
            session.setAttribute("loginId",memberDTO.getMemberId());
            return "member/myPage";
        }else {
            return "member/login";
        }
    }

    //회원목록 리스트
    @GetMapping("/list")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList",memberDTOList);
        return "member/memberList";
    }
    //회원 상세조회
    // /member?id=
    @GetMapping
    public String findById(@RequestParam("id") String memberId, Model model){
        MemberDTO memberDTO = memberService.findById(memberId);
        model.addAttribute("member",memberDTO);
        return "member/memberDetail";
    }

    //회원삭제
    // /member/delete?id=
    @GetMapping("/delete")
    public String delete(@RequestParam("id") String memberId){
        memberService.delete(memberId);
        return "redirect:/member/list"; //redirect방식은 jsp 이름이 아닌 url 주소값으로 줘야한다
    }

    //수정화면 요청
    @GetMapping("/update")
    public String updateForm(HttpSession session,Model model){
        //세션에 저장된 나의 아이디 가져오기
        String loginId = (String) session.getAttribute("loginId");
        MemberDTO memberDTO= memberService.findByMemberId(loginId);
        model.addAttribute("member", memberDTO);
        return "member/memberUpdate";
    }

    //회원 수정 처리
    @PostMapping ("/update")
    public String update(@ModelAttribute MemberDTO memberDTO){
        boolean result = memberService.update(memberDTO);
        System.out.println("Controller memberDTO = " + memberDTO);
        if(result){
            return "redirect:/member?id=" + memberDTO.getMemberId();
        }else {
            return "mainIndex";
        }
    }


    //아이디 중복체크
    @PostMapping("/id-check")
    public @ResponseBody String idCheck(@RequestParam("memberId") String memberId){
        System.out.println("Idcheck_memberId = " + memberId);
        String checkResult = memberService.idCheck(memberId);
        return  checkResult; //String checkResult는 memberSave.jsp ajax success: function(res) 의 res값으로 들어온다
    }
}

