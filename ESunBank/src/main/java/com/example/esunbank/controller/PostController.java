package com.example.esunbank.controller;

import com.example.esunbank.model.Post;
import com.example.esunbank.model.User;
import com.example.esunbank.service.PostService;
import com.example.esunbank.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class PostController {

    @Autowired
    PostService postService;

    @RequestMapping(method = RequestMethod.POST, value = "/post")
    @ResponseBody
    public String addPost(@RequestBody Post post){

        return postService.insertPost(post);
    }

}
