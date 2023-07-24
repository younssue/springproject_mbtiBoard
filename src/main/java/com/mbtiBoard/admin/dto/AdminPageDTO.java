package com.mbtiBoard.admin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AdminPageDTO {
    private int adminPage; // 현재 페이지
    private int adminMaxPage; //전체 필요한 페이지 갯수
    private int adminStartPage; //현재 페이지 기준 시작 페이지 값
    private int adminEndPage; // 현재 페이지 기준 마지막 페이지 값
    private String keyword="";//검색어 받아오기
    private String option ="";//검색 조건 선택
}
