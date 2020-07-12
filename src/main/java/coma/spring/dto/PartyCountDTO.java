package coma.spring.dto;

public class PartyCountDTO {
	private int seq;
	private int pull;
	private int count;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getPull() {
		return pull;
	}
	public void setPull(int pull) {
		this.pull = pull;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public PartyCountDTO(int seq, int pull, int count) {
		super();
		this.seq = seq;
		this.pull = pull;
		this.count = count;
	}
	public PartyCountDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
