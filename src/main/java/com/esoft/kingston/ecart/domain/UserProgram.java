package com.esoft.kingston.ecart.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */

@Entity
@Table(name = "userprogram")
public class UserProgram implements Serializable{
	private static final long serialVersionUID = 2599049594274239178L;
	
	private int userProgramId;
	private int usertypeId;
	private int programId;
 	
	@Id
	@Column(name="userprogramid")
	@GeneratedValue()
	public int getUserProgramId() {
		return userProgramId;
	}
	public void setUserProgramId(int userProgramId) {
		this.userProgramId = userProgramId;
	}
	
	@Column(name="usertypeid")
	public int getUsertypeId() {
		return usertypeId;
	}
	public void setUsertypeId(int usertypeId) {
		this.usertypeId = usertypeId;
	}
	
	@Column(name="programid")
	public int getProgramId() {
		return programId;
	}
	public void setProgramId(int programId) {
		this.programId = programId;
	}
}
