package com.example.esunbank.service;

import com.example.esunbank.dao.UserDao;
import com.example.esunbank.model.User;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;

@Service
public class UserService {

    @Autowired
    UserDao userDao;

    public String insertUser(User user){
        // 檢查重複
        if(userDao.selectFromUserPhoneNumber(user.getPhoneNumber()) != null){
            return "手機號碼已重複";
        }
        user.setPassword(encode(user.getPassword()));
        return userDao.insertUser(user) == 1 ? "S" : "F";
    }

    public String checkUser(User user){
        String result = "F";
        User userData = userDao.selectFromUserPhoneNumber(user.getPhoneNumber());
        if(userData != null){
            result = BCrypt.checkpw(user.getPassword(), userData.getPassword()) == true ? userData.getUserId().toString() : "F";
        }

        return result;
    }

    public String encode(String password){
        String encodedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        return  encodedPassword;
    }
}
