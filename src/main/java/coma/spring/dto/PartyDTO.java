package coma.spring.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class PartyDTO {

	private int seq;
	private String parent_name;
	private String parent_address;
	private String title;
	private String writer;
	private String date;
	private String time;
	private Timestamp meetdate;
	private int count;
	private String gender;
	private String age;
	private String drinking;
	private String content;
	private String status;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	public String getParent_address() {
		return parent_address;
	}
	public void setParent_address(String parent_address) {
		this.parent_address = parent_address;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Timestamp getMeetdate() {
		return meetdate;
	}
	public void setMeetdate(Timestamp meetdate) {
		this.meetdate = meetdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getDrinking() {
		return drinking;
	}
	public void setDrinking(String drinking) {
		this.drinking = drinking;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public PartyDTO(int seq, String parent_name, String parent_address, String title, String writer, String date,
			String time, Timestamp meetdate, int count, String gender, String age, String drinking, String content,
			String status) {
		super();
		this.seq = seq;
		this.parent_name = parent_name;
		this.parent_address = parent_address;
		this.title = title;
		this.writer = writer;
		this.date = date;
		this.time = time;
		this.meetdate = meetdate;
		this.count = count;
		this.gender = gender;
		this.age = age;
		this.drinking = drinking;
		this.content = content;
		this.status = status;
	}
	
	public PartyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	
}
