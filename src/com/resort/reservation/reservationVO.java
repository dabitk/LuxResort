package com.resort.reservation;

import java.util.Date;

public class reservationVO {
	private String name;
	private Date resv_data;
	private int room;
	private String addr;
	private String telnum;
	private String in_name;
	private String comment;
	private Date write_date;
	private int processing;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getResv_data() {
		return resv_data;
	}
	public void setResv_data(Date resv_data) {
		this.resv_data = resv_data;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTelnum() {
		return telnum;
	}
	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}
	public String getIn_name() {
		return in_name;
	}
	public void setIn_name(String in_name) {
		this.in_name = in_name;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getProcessing() {
		return processing;
	}
	public void setProcessing(int processing) {
		this.processing = processing;
	}
	
	
}
