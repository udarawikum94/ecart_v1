package com.esoft.kingston.ecart.service;

import java.util.List;

import com.esoft.kingston.ecart.domain.Item;
import com.esoft.kingston.ecart.util.UserConfig;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * 
 * @implNote 
 * 		: Manages Item configuration, 
 * 		: Represents a single instance implementation
 */

public interface ItemService {
	public void createItem(UserConfig userConfig, Item item) throws Exception;
	public void updateItem(UserConfig userConfig, Item item) throws Exception;
	public void deleteItem(UserConfig userConfig, int id) throws Exception;
	
	public List<Item> getItem(UserConfig userSession) throws Exception;
}
