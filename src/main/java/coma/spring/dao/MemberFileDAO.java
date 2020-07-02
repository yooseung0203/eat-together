package coma.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import coma.spring.dto.MemberFileDTO;

@Repository
public class MemberFileDAO {
	@Autowired
	private JdbcTemplate jdbc;
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int editProfileImageProc(MemberFileDTO mfdto)throws Exception{
		return mybatis.insert("MemberFile.editProfileImage", mfdto);
	}
}
