package com.mbtiBoard.board.controller;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    //게시판 글작성
/*    @GetMapping("/list")
    public String boardIndex(){
        return "board/boardList4";
    }*/
    @GetMapping("/save")
    public  String boardSaveForm(){
        return "board/boardSave";
    }
    @PostMapping("/save")
    public String boardSave(@ModelAttribute BoardDTO boardDTO, HttpSession session){
//        HttpSession session = request.getSession();
        String loginId = (String) session.getAttribute("loginId");

        boardDTO.setBoardId(loginId); //로그인 session값을 가져와서 boardId 값에 넣기

        int boardSaveResult = boardService.boardSave(boardDTO);
        if(boardSaveResult > 0){
            return "redirect:/board/list";
        }else{
            return "board/boardSave";
        }
    }

    // 게시판 글 목록 출력
    @GetMapping("/list")
    public String findAll(Model model){
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList",boardDTOList);
        return "board/boardList";
    }
    //글 상세조회
    @GetMapping
    public String findByBno(@RequestParam("bno") Integer bno, Model model ){
        System.out.println("boardId = " + bno);
        BoardDTO boardDTO = boardService.findByBno(bno);
        model.addAttribute("board",boardDTO);
        return "board/boardListDetail";

    }
}
