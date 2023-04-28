package com.example.esunbank.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.sql.DataSource;
import com.example.esunbank.model.User;

import java.util.Map;

@Repository("UserDao")
public class UserDao {

	private JdbcTemplate jdbcTemplate;

	@Resource(name = "dataSource")
	public void setDataSource(DataSource dataSource) {

		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public int insertUser(User user){

		return  jdbcTemplate.update("INSERT INTO [User] ([User Name], Email, Password, [Cover Image], Biography, [Phone Number]) VALUES (?, ?, ?, ?, ?, ?)"
				, new Object[] { user.getUserName()
						       , user.getEmail()
		                       , user.getPassword()
						       , user.getCoverImage()
		                       , user.getBiography()
		                       , user.getPhoneNumber()});
	}

	public User selectFromUserPhoneNumber(String phoneNumber){
		try{
			return jdbcTemplate.queryForObject("SELECT * FROM [User] WHERE [Phone Number] = ?", new Object[] {phoneNumber}, new BeanPropertyRowMapper<>(User.class));
		}catch (Exception e) {
			return null;
		}
	}
}