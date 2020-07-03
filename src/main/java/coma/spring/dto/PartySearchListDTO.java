package coma.spring.dto;

public class PartySearchListDTO {
	private String sido;
	private String gugun;
	private String gender;
	private int[] age;
	private String drinking;
	private String text;
	private String search;
	
	
	public PartySearchListDTO() {
		super();
	}

	public PartySearchListDTO(String sido, String gugun, String gender, int[] age, String drinking, String text,
			String search) {
		super();
		this.sido = sido;
		this.gugun = gugun;
		this.gender = gender;
		this.age = age;
		this.drinking = drinking;
		this.text = text;
		this.search = search;
	}
	
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int[] getAge() {
		return age;
	}
	public void setAge(int[] age) {
		this.age = age;
	}
	public String getDrinking() {
		return drinking;
	}
	public void setDrinking(String drinking) {
		this.drinking = drinking;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
