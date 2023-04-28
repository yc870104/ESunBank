package com.example.esunbank.controller;

import com.example.esunbank.model.User;
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
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String login(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        session.setAttribute("Authorise",null);

        return "login";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/register")
    public String register(HttpServletRequest request, HttpServletResponse response){
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/user")
    @ResponseBody
    public String addUser(@RequestBody User user){
        return userService.insertUser(user);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/login")
    @ResponseBody
    public String userLogin(@RequestBody User user){

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        HttpSession session = request.getSession();
        String result = userService.checkUser(user);
        if(result == "F")
        {
            session.setAttribute("Authorise",null);
        }else{
            session.setAttribute("Authorise",Integer.parseInt(result));
            result = "S";
        }
        return result;
    }

}
