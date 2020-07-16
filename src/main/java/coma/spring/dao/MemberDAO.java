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

	//by 지은, 파일업로드와 성별 추가하여 회원가입하기 수정_20200708
	public int signUp(Map<String, Object> signUpParam) throws Exception {
		return mybatis.insert("Member.signUp", signUpParam);
	}
	
	//by 지은, 카카오톡 회원가입 처리_20200708
	public int signUpKakao(MemberDTO mdto)throws Exception{
		return mybatis.insert("Member.signUpKakao", mdto);
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
	//닉네임으로 내정보보기
	public MemberDTO selectMyInfoByNick(String nickname)throws Exception{
		return mybatis.selectOne("Member.selectMyInfoByNick",nickname);
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

	//회원가입 시 닉네임 중복 검사_20200710
	public boolean isNickAvailable(String nickname) throws Exception{
		int result = mybatis.selectOne("Member.isNickAvailable", nickname);

		if(result>0) return false;
		else return true;
	}

	//회원탈퇴
	public int deleteMember(String id) throws Exception{
		return mybatis.delete("Member.deleteMember", id);
	}
	//회원정보수정
	public int editMyInfo(Map<String, Object> editParam)throws Exception{
		return mybatis.update("Member.editMyInfo", editParam);
	}
	//비밀번호 수정
	public int editPw(Map<String, String> param) throws Exception{
		return mybatis.update("Member.editPw", param);
	}
	//아이디 찾기용 이메일 체크
	public MemberDTO emailCheck(String account_email) throws Exception{
		return mybatis.selectOne("Member.emailCheck", account_email);
	}
}
