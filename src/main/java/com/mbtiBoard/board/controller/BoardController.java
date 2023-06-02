package com.mbtiBoard.board.controller;

import com.mbtiBoard.board.dto.BoardDTO;
import com.mbtiBoard.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    @GetMapping("/")
    public String boardIndex(){
        return "board/boardIndex";
    }
    @GetMapping("/save")
    public  String boardSaveForm(){
        return "board/boardSave";
    }
    @PostMapping("/save")
    public String boardSave(@ModelAttribute BoardDTO boardDTO){
        int boardSaveResult = boardService.boardSave(boardDTO);
        if(boardSaveResult > 0){
            return "redirect:/board/";
        }else{
            return "board/boardSave";
        }
    }
}
