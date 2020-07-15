package coma.spring.dto;

import java.sql.Timestamp;

public class MemberReportDTO {
	private int seq;
	private String id;
	private String report_id;
	private String title;
	private String content;
	private Timestamp write_date;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public MemberReportDTO(int seq, String id, String report_id, String title, String content, Timestamp write_date) {
		super();
		this.seq = seq;
		this.id = id;
		this.report_id = report_id;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
	}
	public MemberReportDTO() {
		super();
	}

}
