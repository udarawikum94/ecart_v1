package com.esoft.kingston.ecart.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */

@Entity
@Table(name="user")
public class User implements Serializable{
	private static final long serialVersionUID = 8600624655863885247L;
	
	private int userId;
	private String userName;
	private String password;
	private int userType;
	private String userTypeDescription;
	
	@Id
	@Column(name="userid")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	@Column(name="username")
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	@Column(name="password")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name="usertype")
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	
	@Transient
	public String getUserTypeDescription() {
		return userTypeDescription;
	}
	public void setUserTypeDescription(String userTypeDescription) {
		this.userTypeDescription = userTypeDescription;
	}
}
