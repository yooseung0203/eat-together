package coma.spring.dao;

import java.util.List;

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
	
	//프로필 업로드하기
	public int uploadProc(MemberFileDTO mfdto)throws Exception{
		return mybatis.insert("MemberFile.uploadProc", mfdto);
	}
}
