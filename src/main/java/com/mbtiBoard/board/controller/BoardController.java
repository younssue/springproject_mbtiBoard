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
        System.out.println("boardBno = " + bno);
        //글 상세보기 클릭시 조회수 증가
        boardService.updateHits(bno);
        BoardDTO boardDTO = boardService.findByBno(bno);
        System.out.println("boardDTO_상세보기 = " + boardDTO );
        model.addAttribute("board",boardDTO);
        return "board/boardListDetail";

    }

    //글 수정
    @GetMapping("/update")
    public String updateForm(@RequestParam("bno") Integer bno,Model model){
        System.out.println("boardBno = " + bno);
        BoardDTO boardDTO = boardService.findByBno(bno);
        model.addAttribute("board", boardDTO);
        return "board/boardUpdate";
    }

    @PostMapping("/update")
    public String boardUpdate(@ModelAttribute BoardDTO boardDTO , Model model){
        System.out.println("boardDTO1 = " + boardDTO );
        boardService.boardUpdate(boardDTO);
        System.out.println("boardDTO2 = " + boardDTO );
        BoardDTO dto = boardService.findByBno(boardDTO.getBno());
        System.out.println("bno="+ boardDTO.getBno());
        System.out.println("dto="+ dto);
        model.addAttribute("board" , dto);
        return "board/boardListDetail";
        //redirect를 할 경우 글 상세보기 메서드를 다시 실행하게 된다
        //그렇게 되면 글 수정 후 다시 글 상세창으로 돌아갔을 때 조회수가 올라가게 된다
        //return "redirect:/board?bno="+boardDTO.getBno();
    }


}
