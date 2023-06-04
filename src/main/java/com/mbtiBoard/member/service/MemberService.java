package com.mbtiBoard.member.service;

import com.mbtiBoard.member.dto.MemberDTO;
import com.mbtiBoard.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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
        if(memberDTO == null){
            return "ok";
        }else{
            return "no";
        }
    }
}
