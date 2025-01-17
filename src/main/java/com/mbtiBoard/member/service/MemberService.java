package com.mbtiBoard.member.service;

import com.mbtiBoard.admin.dto.AdminPageDTO;
import com.mbtiBoard.admin.dto.MemberPageDTO;
import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.member.dto.MemberDTO;
import com.mbtiBoard.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    //회원가입
    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }

    //로그인
    public boolean login(MemberDTO memberDTO) {
        MemberDTO loginMember = memberRepository.login(memberDTO);
        if(loginMember != null){
            return true;
        }else {
            return false;
        }
    }

    //회원목록 조회
    public List<MemberDTO> findAll() {

        return memberRepository.findAll();
    }

    //회원상세조회
    public MemberDTO findById(String memberId) {

        return memberRepository.findById(memberId);
    }

    //회원삭제
    public void delete(String memberId) {

        memberRepository.delete(memberId);
    }

    //수정하기 위해 로그인 아이디 가져오기
    public MemberDTO findByMemberId(String loginId) {
        System.out.println("loginId = " + loginId);
        return memberRepository.findByMemberId(loginId);
    }



    //회원수정
    public boolean update(MemberDTO memberDTO) {
        int result = memberRepository.update(memberDTO);
        System.out.println("Service memberDTO = " + memberDTO);
        System.out.println("Service result = " + result);
        if(result>0){
            return true;
        }else {
            return false;
        }

    }

    //회원가입 시 아이디 중복체크
    public String idCheck(String memberId) {
        MemberDTO memberDTO = memberRepository.findByMemberId(memberId);

        if (memberId.isEmpty()) {
            return "wait";
        }else if(memberDTO == null ){
            return "ok";
        }else{
            return "no";
        }
    }

    //관리자페이지- 회원관리 페이징

    int memberPageLimit = 3;// 한 페이지당 보여줄 글 갯수
    int memberBlockLimit = 3;// 하단에 보여줄 페이지 번호 갯수
    public List<MemberDTO> memberPagingList(int memberPage, String keyword, String option) {
        int memberPageStart = ( memberPage - 1 ) * memberPageLimit;
        System.out.println("memberPageStart = " + memberPageStart);

        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("start",memberPageStart);
        pagingParams.put("limit",memberBlockLimit);
        pagingParams.put("keyword", keyword);
        pagingParams.put("option",option);

        List<MemberDTO> memberPagingList = memberRepository.memberPagingList(pagingParams);

        return memberPagingList;
    }

    public MemberPageDTO memberPagingParam(int memberPage, String keyword, String option) {

        Map<String, Object> memberCountCondition = new HashMap<>();
        memberCountCondition.put("keyword", keyword);
        memberCountCondition.put("option", option);
        int memberCount = memberRepository.memberCount(memberCountCondition);
        // 전체 페이지 갯수 계산 (10/3 = 3.333 => 페이지 총 4
        int memberMaxPage = (int)(Math.ceil((double) memberCount/ memberPageLimit));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)
        int memberStartPage = (((int)(Math.ceil((double) memberPage / memberBlockLimit))) - 1) * memberBlockLimit + 1;
        // 끝 페이지 값 계산(3,6,9,12, ~~~~)
        int memberEndPage = memberStartPage + memberBlockLimit - 1;
        if (memberEndPage > memberMaxPage) {
            memberEndPage = memberMaxPage;
        }
        MemberPageDTO memberPageDTO = new MemberPageDTO();
        memberPageDTO.setMemberPage(memberPage);
        memberPageDTO.setMemberMaxPage(memberMaxPage);
        memberPageDTO.setMemberStartPage(memberStartPage);
        memberPageDTO.setMemberEndPage(memberEndPage);
        memberPageDTO.setKeyword(keyword);
        memberPageDTO.setOption(option);
        return memberPageDTO;

    }

    /*int adminPageLimit = 5;// 한 페이지당 보여줄 글 갯수
    int adminBlockLimit = 5;// 하단에 보여줄 페이지 번호 갯수
    public List<BoardDTO> adminPagingList(int adminPage, String keyword, String option) {
        int adminPageStart = ( adminPage - 1 ) * adminPageLimit;
        System.out.println("adminPageStart = " + adminPageStart);

        //댓글 갯수
        //int commentCnt =  boardRepository.updateCommentCnt(bno,cnt);

        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("start",adminPageStart);
        pagingParams.put("limit",adminBlockLimit);
        pagingParams.put("keyword", keyword);
        pagingParams.put("option",option);

        List<BoardDTO> adminPagingList = boardRepository.adminPagingList(pagingParams);

        return adminPagingList;
    }

    public AdminPageDTO adminPagingParam(int adminPage, String keyword, String option) {
        //전체 글 갯수 조회
        Map<String, Object> adminCountCondition = new HashMap<>();
        adminCountCondition.put("keyword", keyword);
        adminCountCondition.put("option", option);
        int adminBoardCount = boardRepository.adminBoardCount(adminCountCondition);
        // 전체 페이지 갯수 계산 (10/3 = 3.333 => 페이지 총 4
        int adminMaxPage = (int)(Math.ceil((double) adminBoardCount/ adminPageLimit));
        // 시작 페이지 값 계산(1, 4, 7, 10, ~~~~)
        int adminStartPage = (((int)(Math.ceil((double) adminPage / adminBlockLimit))) - 1) * adminBlockLimit + 1;
        // 끝 페이지 값 계산(3,6,9,12, ~~~~)
        int adminEndPage = adminStartPage + adminBlockLimit - 1;
        if (adminEndPage > adminMaxPage) {
            adminEndPage = adminMaxPage;
        }
        AdminPageDTO adminPageDTO = new AdminPageDTO();
        adminPageDTO.setAdminPage(adminPage);
        adminPageDTO.setAdminMaxPage(adminMaxPage);
        adminPageDTO.setAdminStartPage(adminStartPage);
        adminPageDTO.setAdminEndPage(adminEndPage);
        adminPageDTO.setKeyword(keyword);
        adminPageDTO.setOption(option);
        return adminPageDTO;
    }*/
}
