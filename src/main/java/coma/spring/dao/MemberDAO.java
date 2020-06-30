package coma.spring.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Map;

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

	//로그인하기
	public boolean logIn(Map<String, String> param) throws Exception{
		int result = mybatis.selectOne("Member.logIn", param);

		if(result>0) return true;
		else return false;
	}
	//내정보보기
	public MemberDTO selectMyInfo(String id) throws Exception {
		return mybatis.selectOne("Member.selectMyInfo", id);
	}
	//회원가입 시 이메일 중복 검사
	public boolean isEmailAvailable(String account_email) throws Exception{
		int result = mybatis.selectOne("Member.isEmailAvailable", account_email);

		if(result>0) return false;
		else return true;
	}
	//회원가입 시 아이디 중복 검사
	public boolean isIdAvailable(String id) throws Exception{
		int result = mybatis.selectOne("Member.isIdAvailable", id);

		if(result>0) return false;
		else return true;
	}
}
