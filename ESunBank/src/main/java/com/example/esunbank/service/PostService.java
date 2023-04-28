package com.example.esunbank.service;

import com.example.esunbank.dao.PostDao;
import com.example.esunbank.model.Post;
import com.example.esunbank.model.User;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Service
public class PostService {

    @Autowired
    PostDao postDao;

    public List<Post> getPost(){
        return postDao.getAllPost();
    }

    public String insertPost(Post post){

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest();
        HttpSession session = request.getSession();
        int userId = (int)session.getAttribute("Authorise");

        post.setUserId(userId);
        post.setCreatedAt(new Date());

        return postDao.insertPost(post) == 1 ? "S" : "F";
    }
}
