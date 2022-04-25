package com.esoft.kingston.ecart.dto;

import java.util.List;

import com.esoft.kingston.ecart.domain.Program;
import com.esoft.kingston.ecart.domain.UserPrgEvent;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */
public class SystemProgramDTO {
	private Program program;
	private List<UserPrgEvent> programEvents;
	private String url;
	
	public Program getProgram() {
		return program;
	}
	public void setProgram(Program program) {
		this.program = program;
	}
	
	public List<UserPrgEvent> getProgramEvents() {
		return programEvents;
	}
	public void setProgramEvents(List<UserPrgEvent> programEvents) {
		this.programEvents = programEvents;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
