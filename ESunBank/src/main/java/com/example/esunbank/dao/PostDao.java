package com.example.esunbank.dao;

import com.example.esunbank.model.Post;
import com.example.esunbank.model.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.List;

@Repository("PostDao")
public class PostDao {

	private JdbcTemplate jdbcTemplate;

	@Resource(name = "dataSource")
	public void setDataSource(DataSource dataSource) {

		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<Post> getAllPost(){

		return jdbcTemplate.query("SELECT * FROM [Post]", new BeanPropertyRowMapper<>(Post.class));
	}

	public int insertPost(Post post){

		return  jdbcTemplate.update("INSERT INTO [Post] ([User ID], Content, Image, [Created At]) VALUES (?, ?, ?, ?)"
				, new Object[] { post.getUserId()
						       , post.getContent()
		                       , post.getImage()
						       , post.getCreatedAt()});
	}
}