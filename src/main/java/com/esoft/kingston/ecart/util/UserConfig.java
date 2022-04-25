package com.esoft.kingston.ecart.util;

import java.util.Date;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */
public class UserConfig {
	private int userId;
	private String userName;
	private Date loginDate;
	
	public UserConfig(int userId, String userName, Date loginDate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.loginDate = loginDate;
	}
	
	public UserConfig() {
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
}
