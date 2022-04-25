package com.esoft.kingston.ecart.enumeration;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */
public enum EventsEnum {
	CREATE(1,"CREATE", "Create", "Successfully Created"),
	UPDATE(2,"UPDATE", "Update", "Successfully Updated"),
	DELETE(3,"DELETE", "Delete", "Successfully Deleted"),
	PRINT(4,"PRINT", "Print", "Successfully Printed"),
	AUTHORIZE(5,"AUTHORIZE", "Authorize", "Successfully Authorized"),
	VIEW(6,"VIEW", "View", "View"),
	CANCEL(7,"CANCEL", "Cancel", "Successfully Canceled"),
	DISPATCH_CANCEL(8,"DISPATCH_CANCEL", "Dispatch Cancel", "Successfully Dispatch Canceled"),
	REJECT(9,"REJECT", "Reject", "Successfully Rejectd"),
	SPECIAL_DATA_EDIT(10,"SPECIAL_DATA_EDIT", "Special data edit", "Special data edited Successfully"),
	UPLOAD(11,"UPLOAD", "Upload", "Successfully Uploaded");
	
	private int id;
	private String code;
	private String description;
	private String eventMessage;
	
	private EventsEnum(int id, String code, String description, String eventMessage) {
		this.id = id;
		this.code = code;
		this.description = description;
		this.eventMessage = eventMessage;
	}

	public int getId() {
		return id;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getCode() {
		return code;
	}

	public String getEventMessage() {
		return eventMessage;
	}

	public static EventsEnum getEnumByCode(String code) {
		Class clazz = EventsEnum.class;
		Object[] cons = clazz.getEnumConstants();
		for(Object obj : cons) {
			if(((EventsEnum)obj).getCode().equals(code))
				return (EventsEnum)obj;
		}
		return null;
	}
	
	public static EventsEnum getEnumById(int id) {
		Class clazz = EventsEnum.class;
		Object[] cons = clazz.getEnumConstants();
		for(Object obj : cons) {
			if(((EventsEnum)obj).getId()==id)
				return (EventsEnum)obj;
		}
		return null;
	}
}
