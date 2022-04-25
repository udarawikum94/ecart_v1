package com.esoft.kingston.ecart.enumeration;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 */
public enum EventsResponseStatusEnum {
	SUCCESS(1,"SUCCESS"),
	FAIL(2,"FAIL");
	
	private int id;
	private String description;
	
	private EventsResponseStatusEnum(int id, String description) {
		this.id = id;
		this.description = description;
	}

	public int getId() {
		return id;
	}
	public String getDescription() {
		return description;
	}

	public static EventsResponseStatusEnum getEnumById(int id) {
		Class clazz = EventsResponseStatusEnum.class;
		Object[] cons = clazz.getEnumConstants();
		for(Object obj : cons) {
			if(((EventsResponseStatusEnum)obj).getId()==id)
				return (EventsResponseStatusEnum)obj;
		}
		return null;
	}
}
