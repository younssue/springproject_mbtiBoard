package com.mbtiBoard.board.controller;

import com.mbtiBoard.board.dto.CommentDTO;
import com.mbtiBoard.board.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

//@Controller
@RestController
@RequiredArgsConstructor
//@RequestMapping("/comment")
public class CommentController {
    private final CommentService commentService;

    //댓글 작성

    @PostMapping("/comment") // /comment?bno=1 POST
    public ResponseEntity<String>  commentSave(@RequestBody CommentDTO commentDTO, HttpSession session,
                                     @RequestParam("bno") Integer bno){
        //댓글 작성자 = 로그인한 유저
        //String memberId = (String) session.getAttribute("loginId");
        String memberId = "yy";
        commentDTO.setMemberId(memberId);
        commentDTO.setBno(bno);
        System.out.printf("commentDTO =", commentDTO);

        try{
            if(commentService.commentSave(commentDTO)!=1){
                throw new Exception("Write failed");
            }
            return new ResponseEntity<String>("write success", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("write failed", HttpStatus.BAD_REQUEST);
        }
/*        long saveResult = commentService.commentSave(commentDTO);

        if( saveResult != null){
            //작성 성공하면 댓글목록을 가져와서 리턴
            //댓글 목록: 해당 게시글의 댓글 전체
           List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBno());
        }else{
            return "작성 실패";
        }*/


    }


    //bno에 해당되는 모든 댓글 가져오기
    @GetMapping("/comment") //comment?bno=21 GET
    public  ResponseEntity<List<CommentDTO>> list(Integer bno){
        List<CommentDTO> list = null;
        try {
            list = commentService.getList(bno);
            return new ResponseEntity<List<CommentDTO>>(list, HttpStatus.OK); //200
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<List<CommentDTO>>(list, HttpStatus.BAD_REQUEST);
        }
    }

    //댓글 수정
    @PatchMapping("/comment/{cno}") // /comment/20
    public ResponseEntity<String> commentModify(@PathVariable Integer cno, @RequestBody CommentDTO commentDTO,
                                                HttpSession session){
        //String memberId = (String) session.getAttribute("loginId");
        String memberId = "yy";
        commentDTO.setMemberId(memberId);
        commentDTO.setCno(cno);
        System.out.printf("m_commentDTO="+ commentDTO);

        try {
            if(commentService.commentModify(commentDTO)!=1)
                throw new Exception("Write failed");
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }

    }

    //댓글 삭제
    @DeleteMapping("/comment/{cno}")
    public ResponseEntity<String> commentRemove(@PathVariable Integer cno, Integer bno, HttpSession session
                                                //@RequestParam("bno") Integer bno
    ){
        //String memberId = (String) session.getAttribute("loginId");
        String memberId = "yy";
        try {
            int rowCnt = commentService.commentRemove(cno,bno,memberId);
            if(rowCnt != 1)
                throw new Exception("Delete Failed");
            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);

        }catch (Exception e){
            e.printStackTrace();
            return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }


}
