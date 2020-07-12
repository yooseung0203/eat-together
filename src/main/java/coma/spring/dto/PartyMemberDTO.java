package coma.spring.dto;

public class PartyMemberDTO {
	private int chatSeq_parent;
	private String participant;
	private int viewed_seq;
	private String exist;
	private String id;
	private String sysname;
	public PartyMemberDTO() {}
	public PartyMemberDTO(int chatSeq_parent, String participant) {
		this.chatSeq_parent = chatSeq_parent;
		this.participant = participant;
	}
	public PartyMemberDTO(int chatSeq_parent) {
		this.chatSeq_parent = chatSeq_parent;
	}
	
	public PartyMemberDTO(int chatSeq_parent, String participant, int viewed_seq) {
		this.chatSeq_parent = chatSeq_parent;
		this.participant = participant;
		this.viewed_seq = viewed_seq;
		this.exist = "noexist";
	}

	public int getChatSeq_parent() {
		return chatSeq_parent;
	}

	public void setChatSeq_parent(int chatSeq_parent) {
		this.chatSeq_parent = chatSeq_parent;
	}

	public String getParticipant() {
		return participant;
	}

	public void setParticipant(String participant) {
		this.participant = participant;
	}

	public int getViewed_seq() {
		return viewed_seq;
	}

	public void setViewed_seq(int viewed_seq) {
		this.viewed_seq = viewed_seq;
	}

	public String getExist() {
		return exist;
	}

	public void setExist(String exist) {
		this.exist = exist;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}

	
	
	
}
