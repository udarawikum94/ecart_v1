package com.esoft.kingston.ecart.util;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */
public class ResponseDTO {
	private String code;
	private String description;
	private Object object;
	
	public ResponseDTO(String code, String description, Object object) {
		super();
		this.code = code;
		this.description = description;
		this.object = object;
	}
	
	public ResponseDTO() {
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
}
