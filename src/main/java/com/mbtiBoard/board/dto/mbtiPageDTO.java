package com.mbtiBoard.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
public class mbtiPageDTO {
    private int mbtiPage; // 현재 페이지
    private int mbtiMaxPage; //전체 필요한 페이지 갯수
    private int mbtiStartPage; //현재 페이지 기준 시작 페이지 값
    private int mbtiEndPage; // 현재 페이지 기준 마지막 페이지 값
    private String boardMbti="";
}
