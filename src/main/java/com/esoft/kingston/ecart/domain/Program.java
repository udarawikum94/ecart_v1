package com.esoft.kingston.ecart.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Program implements Serializable{
	private int programId;
	private String sId;
	private String description;
	private int level;
	private int parentId;
	private int isEndProgram;
	private String icon;
	private String jspFile;
	private String events;
	
	@Id
	@Column(name="programid")
	public int getProgramId() {
		return programId;
	}
	public void setProgramId(int programId) {
		this.programId = programId;
	}
	
	@Column(name="sid")
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="level")
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	@Column(name="parentid")
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	@Column(name="isendprogram")
	public int getIsEndProgram() {
		return isEndProgram;
	}
	public void setIsEndProgram(int isEndProgram) {
		this.isEndProgram = isEndProgram;
	}
	
	@Column(name="icon")
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	@Column(name="jspFile")
	public String getJspFile() {
		return jspFile;
	}
	public void setJspFile(String jspFile) {
		this.jspFile = jspFile;
	}
	
	
	@Column(name="events")
	public String getEvents() {
		return events;
	}
	public void setEvents(String events) {
		this.events = events;
	}
}
