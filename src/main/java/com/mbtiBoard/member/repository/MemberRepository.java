package com.mbtiBoard.member.repository;

import com.mbtiBoard.member.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class MemberRepository { //DB-mybatis 연결
    private final SqlSessionTemplate sql;
    //회원가입
    public int save(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        //Member-> mapper namespace 와 동일, save-> insert id와 동일
        return sql.insert("Member.save",memberDTO);
    }

    //로그인
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login",memberDTO);
    }

    //회원목록리스트
    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    //회원상세조회
    public MemberDTO findById(String memberId) {
        return sql.selectOne("Member.findById",memberId);
    }

    //회원 삭제
    public void delete(String memberId) {

        sql.delete("Member.delete",memberId);
    }

    //회원 수정할 회원 정보 불러오기
    public MemberDTO findByMemberId(String loginId) {
        return sql.selectOne("Member.findByMemberId", loginId);
    }

    //회원 정보 수정
    public int update(MemberDTO memberDTO) {
        return sql.update("Member.update", memberDTO);
    }

    public List<MemberDTO> memberPagingList(Map<String, Object> pagingParams) {
        return sql.selectList("Member.memberPagingList",pagingParams);
    }

    public int memberCount(Map<String, Object> memberCountCondition) {
        return sql.selectOne("Member.memberCount",memberCountCondition);
    }

    //아이디 찾기
    public MemberDTO memberIdSearch(MemberDTO memberDTO) {
        return sql.selectOne("Member.memberIdSearch", memberDTO);
    }
}
