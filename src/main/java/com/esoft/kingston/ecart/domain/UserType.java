package com.esoft.kingston.ecart.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Transient;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */

@Entity
public class UserType {
	private int id;
	private String code;
	private String description;
	private int companyId;
	private String status;
	
	@Id
	@Column(name="usertypeid")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="companyid")
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	
	@Transient
	public String getStatus() {
		return "ACTIVE";
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
