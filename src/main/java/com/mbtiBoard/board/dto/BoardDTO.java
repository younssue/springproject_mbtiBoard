package com.mbtiBoard.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class BoardDTO {
    //private String boardId; -> memberDTO memberId
    private String boardId;
    private String boardTitle;
    private String boardContents;
    private int boardHits;
    private Timestamp boardCreatedTime;
    private String boardMbti;
    private Integer bno;


}
