package com.mbtiBoard.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SimpleRestController {

    @GetMapping("/ajax")
    public  String ajax(){
        return "/board/ajax";
    }


}
