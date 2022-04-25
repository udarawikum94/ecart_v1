package com.esoft.kingston.ecart.domain;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;
import javax.transaction.Transactional;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */

//@Entity
//@Table(name="product_category")
//@Transactional
public class ProductCategory implements Serializable {
	private static final long serialVersionUID = -1872175431745073588L;
	
	private String code;
	private String name;
	private String status;
	
	@Column(name = "name")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name = "code")
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
