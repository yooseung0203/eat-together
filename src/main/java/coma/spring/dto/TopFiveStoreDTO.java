package coma.spring.dto;

public class TopFiveStoreDTO {
	private String id;
	private int parent_seq;
	private String parent_name;
	private String content;
	
	public TopFiveStoreDTO() {
		super();
	}

	public TopFiveStoreDTO(String id, int parent_seq, String parent_name, String content) {
		super();
		this.id = id;
		this.parent_seq = parent_seq;
		this.parent_name = parent_name;
		this.content = content;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
