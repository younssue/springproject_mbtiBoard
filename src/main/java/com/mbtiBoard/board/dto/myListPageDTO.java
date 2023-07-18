package com.mbtiBoard.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class myListPageDTO {
    private int myListPage; // 현재 페이지
    private int myListMaxPage; //전체 필요한 페이지 갯수
    private int myListStartPage; //현재 페이지 기준 시작 페이지 값
    private int myListEndPage; // 현재 페이지 기준 마지막 페이지 값
    private String keyword="";//검색어 받아오기
    private String option ="";//검색 조건 선택
    private String boardId="";
}
