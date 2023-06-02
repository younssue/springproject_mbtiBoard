package com.mbtiBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @GetMapping("/")
    public String index(){
      /*  boolean loggedIn = session.getAttribute("loggedIn") != null;
        model.addAttribute("loggedIn", loggedIn);*/
        return "mainIndex";
    }
}
