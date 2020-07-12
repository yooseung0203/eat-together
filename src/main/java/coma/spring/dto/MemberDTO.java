package coma.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	private String id;
	private String pw;
	private String nickname;
	private String birth;
	private String account_email;
	private int report_count;
	private Timestamp join_date;
	private MultipartFile profile;
	private int gender;
	private String member_type;
	
	private String sysname;
	private String sdate;
	
	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	public String getSdate() {

		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd"); 
		String sdate =	 format1.format(join_date);

		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	public MultipartFile getProfile() {
		return profile;
	}
	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
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
			Timestamp join_date, MultipartFile profile, int gender, String member_type, String sysname, String sdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.birth = birth;
		this.account_email = account_email;
		this.report_count = report_count;
		this.join_date = join_date;
		this.profile = profile;
		this.gender = gender;
		this.member_type = member_type;
		this.sysname = sysname;
		this.sdate = sdate;
	}
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
