package coma.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReportDTO {
	private int seq;
	private int category;
	private String id;
	private String report_id;
	private Timestamp report_date;
	private int parent_seq;
	private String sdate;
	
	public ReportDTO() {
		super();
	}
	
	public ReportDTO(int seq, int category, String id, String report_id, Timestamp report_date, int parent_seq) {
		super();
		this.seq = seq;
		this.category = category;
		this.id = id;
		this.report_id = report_id;
		this.report_date = report_date;
		this.parent_seq = parent_seq;
		this.sdate = new SimpleDateFormat("YYYY-MM-dd").format(report_date);
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
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
	public Timestamp getReport_date() {
		return report_date;
	}
	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	public String getSdate() {
		long report_date = this.report_date.getTime(); // 글 작성 시점
		long current_date = System.currentTimeMillis(); // 현재 시점
		long gapTime = (current_date - report_date)/1000; // 초단위
		if(gapTime < 60) {
			return "방금 전";
		}else if(gapTime < 3600) {
			return gapTime / 60 + "분 전";
		}else if(gapTime < 86400) {
			return gapTime / 3600 + "시간 전";
		}else {
			return new SimpleDateFormat("YYYY-MM-dd").format(report_date);
		}
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	

}
