package com.lost.customPojo;

import java.util.Date;

public class DetLost {

	private Long id;
	private String categoryName;
	private String userName;
	private String lostPlace;
	private String rewards;
	private String contacts;
	private String email;
	private Date lostTime1;
	private Date lostTime2;

	public DetLost() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLostPlace() {
		return lostPlace;
	}

	public void setLostPlace(String lostPlace) {
		this.lostPlace = lostPlace;
	}

	public String getRewards() {
		return rewards;
	}

	public void setRewards(String rewards) {
		this.rewards = rewards;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getLostTime1() {
		return lostTime1;
	}

	public void setLostTime1(Date lostTime1) {
		this.lostTime1 = lostTime1;
	}

	public Date getLostTime2() {
		return lostTime2;
	}

	public void setLostTime2(Date lostTime2) {
		this.lostTime2 = lostTime2;
	}

}
