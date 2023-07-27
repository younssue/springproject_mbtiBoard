package com.mbtiBoard.member.controller;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.dto.PageDTO;
import com.mbtiBoard.board.dto.myListPageDTO;
import com.mbtiBoard.board.service.BoardService;
import com.mbtiBoard.board.service.CommentService;
import com.mbtiBoard.member.dto.MemberDTO;
import com.mbtiBoard.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")//공통 주소
@RequiredArgsConstructor
public class MemberController {
    private final MemberService memberService;
    //private final BoardDTO boardDTO;
    private final BoardService boardService;
    private final CommentService commentService;

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
    public String loginForm(Model model) {
        model.addAttribute("member", new MemberDTO());
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpServletRequest request,
                        HttpSession session) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {

            session.setAttribute("loginId", memberDTO.getMemberId());
                if("admin".equals(memberDTO.getMemberId()) && memberDTO.getMemberPassword().equals("1234")){
                    //관리자 계정-> 관리자 페이지로 이동

                    return "redirect:/admin/";

                }else {
                    request.setAttribute("msg","😊로그인이 되었습니다. mbtiBoard를 즐겁게 이용해주세요");
                    request.setAttribute("url","/member/myPage");
                   // return "member/myPage";
                    return "alert";
                }
        } else {
            request.setAttribute("msg","😭로그인이 실패하였습니다. 아이디와 비밀번호를 다시 확인해주세요");
            request.setAttribute("url","/member/login");

            return "alert";
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
//    @PostMapping("/update")
//    public String update(@ModelAttribute MemberDTO memberDTO) {
//        boolean result = memberService.update(memberDTO);
//        System.out.println("Controller memberDTO = " + memberDTO);
//        if (result) {
//            return "redirect:/member?id=" + memberDTO.getMemberId();
//        } else {
//            return "mainIndex";
//        }
//    }

    @PostMapping("/update")
    public String update(HttpSession session,@ModelAttribute MemberDTO memberDTO, @RequestParam("memberPassword") String memberPassword) {
        String loginId = (String) session.getAttribute("loginId");
        MemberDTO currentMember = memberService.findByMemberId(loginId);

        // 입력한 비밀번호와 데이터베이스의 비밀번호가 일치하지 않는 경우
        if (!memberPassword.equals(currentMember.getMemberPassword())) {

            return "redirect:/member/update"; // 비밀번호가 일치하지 않으므로 수정 페이지로 다시 이동
        }

        // 회원 정보를 수정하고 결과에 따라 이동할 페이지를 결정
        boolean result = memberService.update(memberDTO);
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


        List<BoardDTO> myListPagingList = boardService.myListPagingList(myListPage,keyword,option,boardId);
        System.out.println("myListPagingList="+myListPagingList);
        myListPageDTO myListPageDTO = boardService.myListPagingParam(myListPage,keyword,option,boardId);

        // 각 게시글에 대한 댓글 갯수를 조회하여 BoardDTO에 추가
        for (BoardDTO boardDTO : myListPagingList) {
            int commentCount = commentService.getCount(boardDTO.getBno());
            boardDTO.setComment_cnt(commentCount);
        }

        model.addAttribute("boardList",myListPagingList);
        model.addAttribute("myListPaging", myListPageDTO);
        model.addAttribute("boardId", boardId);
        model.addAttribute("condition", condition);
        return "member/myList";
    }


    //아이디 찾기
    @GetMapping("/searchId")
    public String searchId(){
        return "member/searchId";
    }



    @PostMapping("/searchId_result")
    public String searchId_result(Model model,
                                  @RequestParam(required = true, value = "memberName")String memberName,
                                  @RequestParam(required = true, value = "memberMobile")String memberMobile,
                                  MemberDTO memberDTO
    ){
        try {
            memberDTO.setMemberName(memberName);
            memberDTO.setMemberMobile(memberMobile);
            MemberDTO memberSearch = memberService.memberIdSearch(memberDTO);

            model.addAttribute("memberSearch",memberSearch);


        }catch (Exception e){
            System.out.println(e.toString());
            model.addAttribute("msg","오류가 발생되었습니다");
        }
        return "member/searchId_result";
    }

    //비밀번호 찾기(랜덤비밀번호생성)
    @GetMapping("/searchPwd")
    public String searchPw(){

        return "member/searchPwd";
    }

    @PostMapping("/searchPwd_result")
    public String searchPw_result(Model model,
                                  @RequestParam(required = true, value = "memberName")String memberName,
                                  @RequestParam(required = true, value = "memberMobile")String memberMobile,
                                  @RequestParam(required = true, value = "memberId")String memberId,
                                  MemberDTO memberDTO

    ){
        try {
            memberDTO.setMemberId(memberId);
            memberDTO.setMemberMobile(memberMobile);
            memberDTO.setMemberName(memberName);

            MemberDTO memberSearch = memberService.memberPwdSearch(memberDTO);

            if(memberSearch == null){
                model.addAttribute("msg","가입된 정보가 잘못되었습니다. 다시 입력해주세요");
                return "member/searchPwd";
            }


            //RandomStringUtils의 randomAlphanumeric메소드를 호출하면 알파벳(대소문자)+숫자 랜덤 값을 얻을 수 있다
            String newPwd = RandomStringUtils.randomAlphanumeric(10);
            memberDTO.setMemberPassword(newPwd);
            boolean result = memberService.passwordUpdate(memberDTO);

            if(result){
                model.addAttribute("newPwd", newPwd);
            }


        }catch (Exception e){
            System.out.println(e.toString());
            model.addAttribute("msg","오류가 발생되었습니다");
        }
        return "member/searchPwd_result";
    }





    //비밀번호 변경
    @GetMapping("/changePwd")
    public String changePwdForm(HttpSession session, Model model){
        String loginId = (String) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.findByMemberId(loginId);
        model.addAttribute("member", memberDTO);
        return "member/changePwd";
    }


    @PostMapping("/changePwd")
    public String checkPwd(HttpSession session,@ModelAttribute MemberDTO memberDTO,  RedirectAttributes rttr,
                           @RequestParam(required = true, value = "memberPassword") String memberPassword,
                           @RequestParam(required = true, value = "newMemberPwd") String newMemberPwd
    ) {
        String loginId = (String) session.getAttribute("loginId");
        MemberDTO currentMember = memberService.findByMemberId(loginId);

        // 입력한 비밀번호와 데이터베이스의 비밀번호가 일치하지 않는 경우
        if (!memberPassword.equals(currentMember.getMemberPassword())) {
            rttr.addFlashAttribute("msg", "현재 비밀번호와 일치하지 않습니다. 다시 변경해주세요");
            return "redirect:/member/changePwd"; // 비밀번호가 일치하지 않으므로 비밀번호 변경 페이지로 다시 이동

        } else {
            // newMemberPwd 필드를 사용하여 회원의 새로운 비밀번호 설정
            currentMember.setMemberPassword(memberDTO.getNewMemberPwd());
            System.out.println("memberDTO.getNewMemberPwd()"+memberDTO.getNewMemberPwd());
            // 회원 정보를 수정하고 결과에 따라 이동할 페이지를 결정
            boolean result = memberService.selfPwdUpdate(currentMember);
            if (result) {
                System.out.println("currentMember="+currentMember);
                rttr.addFlashAttribute("msg", "비밀번호변경이 완료 되었습니다. 다시 로그인해주세요");
                session.invalidate();
                return "redirect:/member/login";
            } else {
                rttr.addFlashAttribute("msg", "비밀번호변경이 실패 하였습니다, 다시 변경해주세요");
                return "/member/changePwd";
            }
        }


    }

}

