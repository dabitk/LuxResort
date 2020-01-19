package com.resort.reservation;


public class calendarVO {
	private String calendr;
	private String room1;
	private String room2;
	private String room3;
	
	public calendarVO(String c, String r1, String r2, String r3) {
		this.calendr = c;
		this.room1 = r1;
		this.room2 = r2;
		this.room3 = r3;
	}
	
	public String getCalendr() {
		return calendr;
	}
	public void setCalendr(String calendr) {
		this.calendr = calendr;
	}
	public String getRoom1() {
		return room1;
	}
	public void setRoom1(String room1) {
		this.room1 = room1;
	}
	public String getRoom2() {
		return room2;
	}
	public void setRoom2(String room2) {
		this.room2 = room2;
	}
	public String getRoom3() {
		return room3;
	}
	public void setRoom3(String room3) {
		this.room3 = room3;
	}
	
	
}
