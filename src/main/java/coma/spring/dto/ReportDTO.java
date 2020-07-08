package coma.spring.dto;

import java.sql.Timestamp;

public class ReportDTO {
	private int seq;
	private String writer;
	private String report_id;
	private String content;
	private Timestamp report_date;
	
	public ReportDTO() {
		super();
	}

	public ReportDTO(int seq, String writer, String report_id, String content, Timestamp report_date) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.report_id = report_id;
		this.content = content;
		this.report_date = report_date;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getReport_id() {
		return report_id;
	}
	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReport_date() {
		return report_date;
	}
	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}
	
	
}
