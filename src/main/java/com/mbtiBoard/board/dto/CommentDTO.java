package com.mbtiBoard.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class CommentDTO {
    private Integer cno;
    private Integer bno;
    private String memberId;
    private Date commentCreatedTime;
    private String commentContents;
    private Integer pcno;
}
