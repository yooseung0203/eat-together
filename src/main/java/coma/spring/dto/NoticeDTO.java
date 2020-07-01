package coma.spring.dto;

import java.sql.Timestamp;

public class NoticeDTO {
	private int seq;
	private String title;
	private String contents;
	private int importance;
	private Timestamp write_date;
	private String attachement;
	private int view_count;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getImportance() {
		return importance;
	}
	public void setImportance(int importance) {
		this.importance = importance;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getAttachement() {
		return attachement;
	}
	public void setAttachement(String attachement) {
		this.attachement = attachement;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public NoticeDTO(int seq, String title, String contents, int importance, Timestamp write_date, String attachement,
			int view_count) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.importance = importance;
		this.write_date = write_date;
		this.attachement = attachement;
		this.view_count = view_count;
	}
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
}
