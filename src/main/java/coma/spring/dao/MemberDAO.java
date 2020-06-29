package coma.spring.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import coma.spring.dto.MemberDTO;

@Repository
public class MemberDAO {
	

	@Autowired
	private JdbcTemplate jdbc;
	
	@Autowired
	private SqlSessionTemplate mybatis;

	//회원가입하기
	public int signUp(MemberDTO mdto) throws Exception {
		return mybatis.insert("Member.signUp", mdto);
	}
}
