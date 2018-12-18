package com.lost.customPojo;

import java.util.Date;

public class DetFound {

	private Long id;
	private String categoryName;
	private String userName;
	private String foundPlace;
	private String contacts;
	private String email;
	private Date foundTime1;
	private Date foundTime2;

	public DetFound() {
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

	public String getFoundPlace() {
		return foundPlace;
	}

	public void setFoundPlace(String foundPlace) {
		this.foundPlace = foundPlace;
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

	public Date getFoundTime1() {
		return foundTime1;
	}

	public void setFoundTime1(Date foundTime1) {
		this.foundTime1 = foundTime1;
	}

	public Date getFoundTime2() {
		return foundTime2;
	}

	public void setFoundTime2(Date foundTime2) {
		this.foundTime2 = foundTime2;
	}

}
