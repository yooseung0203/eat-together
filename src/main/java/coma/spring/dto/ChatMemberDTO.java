package coma.spring.dto;

public class ChatMemberDTO {
	private int chatroom_seq;
	private String name;
	private int viewd_seq;
	public ChatMemberDTO() {}
	public ChatMemberDTO(int chatroom_seq, String name, int viewd_seq) {
		this.chatroom_seq = chatroom_seq;
		this.name = name;
		this.viewd_seq = viewd_seq;
	}
	public ChatMemberDTO(int chatroom_seq, String name) {
		this.chatroom_seq = chatroom_seq;
		this.name = name;
	}
	public int getChatroom_seq() {
		return chatroom_seq;
	}
	public void setChatroom_seq(int chatroom_seq) {
		this.chatroom_seq = chatroom_seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getViewd_seq() {
		return viewd_seq;
	}
	public void setViewd_seq(int viewd_seq) {
		this.viewd_seq = viewd_seq;
	}
	
	
}
