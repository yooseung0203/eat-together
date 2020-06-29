package coma.spring.dto;

public class MapDTO {
	private int seq;
	private String name;
	private String address;
	private String category;
	private double lat;
	private double lng;
	private double rating_avg;
	private String week_operation;
	private String time_operation;
	private String closed;
	private String phone;
	private String homepage;
	public MapDTO() {
		super();
	}
	public MapDTO(int seq, String name, String address, String category, double lat, double lng, double rating_avg,
			String week_operation, String time_operation, String closed, String phone, String homepage) {
		super();
		this.seq = seq;
		this.name = name;
		this.address = address;
		this.category = category;
		this.lat = lat;
		this.lng = lng;
		this.rating_avg = rating_avg;
		this.week_operation = week_operation;
		this.time_operation = time_operation;
		this.closed = closed;
		this.phone = phone;
		this.homepage = homepage;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getRating_avg() {
		return rating_avg;
	}
	public void setRating_avg(double rating_avg) {
		this.rating_avg = rating_avg;
	}
	public String getWeek_operation() {
		return week_operation;
	}
	public void setWeek_operation(String week_operation) {
		this.week_operation = week_operation;
	}
	public String getTime_operation() {
		return time_operation;
	}
	public void setTime_operation(String time_operation) {
		this.time_operation = time_operation;
	}
	public String getClosed() {
		return closed;
	}
	public void setClosed(String closed) {
		this.closed = closed;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
}
