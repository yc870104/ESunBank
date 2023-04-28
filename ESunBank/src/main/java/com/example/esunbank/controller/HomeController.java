package com.example.esunbank.controller;

import com.example.esunbank.model.User;
import com.example.esunbank.service.PostService;
import com.example.esunbank.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @Autowired
    PostService postService;

    @RequestMapping(method = RequestMethod.GET, value = "/")
    public String index(HttpServletRequest request, HttpServletResponse response, Model model){

        HttpSession session = request.getSession();

        if(session.getAttribute("Authorise") != null){
            model.addAttribute("login",true);
        }else {
            model.addAttribute("login",false);
        }
        model.addAttribute("post",postService.getPost());

        return "index";
    }
}
