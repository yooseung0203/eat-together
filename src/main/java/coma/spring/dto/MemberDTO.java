package coma.spring.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private String pw;
	private String nickname;
	private String birth;
	private String account_email;
	private int report_count;
	private Timestamp join_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAccount_email() {
		return account_email;
	}
	public void setAccount_email(String account_email) {
		this.account_email = account_email;
	}
	public int getReport_count() {
		return report_count;
	}
	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}
	public Timestamp getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}
	public MemberDTO(String id, String pw, String nickname, String birth, String account_email, int report_count,
			Timestamp join_date) {
		super();
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.birth = birth;
		this.account_email = account_email;
		this.report_count = report_count;
		this.join_date = join_date;
	}
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
