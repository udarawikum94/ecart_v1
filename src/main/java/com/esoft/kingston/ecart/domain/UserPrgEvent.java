package com.esoft.kingston.ecart.domain;

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
@Table(name="userprogramevent")
public class UserPrgEvent {
	private int userPrgEventId;
	private int userProgramId;
	private int event;
	
	@Id
	@Column(name="userprgeventid")
	@GeneratedValue()
	public int getUserPrgEventId() {
		return userPrgEventId;
	}
	public void setUserPrgEventId(int userPrgEventId) {
		this.userPrgEventId = userPrgEventId;
	}
	
	@Column(name="userprogramid")
	public int getUserProgramId() {
		return userProgramId;
	}
	public void setUserProgramId(int userProgramId) {
		this.userProgramId = userProgramId;
	}
	
	@Column(name="event")
	public int getEvent() {
		return event;
	}
	public void setEvent(int event) {
		this.event = event;
	}
	
}
