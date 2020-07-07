package coma.spring.dto;

public class PartyMemberDTO {
	private String participant;
	private int viewed_seq;
	private String exist;

	public PartyMemberDTO() {}	
    public PartyMemberDTO(String participant, int viewed_seq, String exist) {
		this.participant = participant;
		this.viewed_seq = viewed_seq;
		this.exist = exist;
	}
	public PartyMemberDTO(String participant, int viewed_seq) {
		this.participant = participant;
		this.viewed_seq = viewed_seq;
		this.exist = "noexist";
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
}
