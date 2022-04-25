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
//@Table(name="image")
//@Transactional
public class Image implements Serializable {
	private static final long serialVersionUID = -1872175431745073588L;
	
	//private Product product;
	private Blob imageUpload;
	private String status;
	
	/*@Column(name = "product_id")
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}*/
	
	@Column(name = "image_upload")
	public Blob getImageUpload() {
		return imageUpload;
	}
	public void setImageUpload(Blob imageUpload) {
		this.imageUpload = imageUpload;
	}
	
	@Column(name = "status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
																				

	
}



