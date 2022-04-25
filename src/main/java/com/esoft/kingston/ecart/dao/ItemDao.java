package com.esoft.kingston.ecart.dao;

import java.util.List;

import com.esoft.kingston.ecart.domain.Item;
import com.esoft.kingston.ecart.util.UserConfig;

public interface ItemDao {
	public void createItem(UserConfig userConfig, Item item) throws Exception;
	public void updateItem(UserConfig userConfig, Item item) throws Exception;
	public void deleteItem(UserConfig userConfig, int id) throws Exception;
	
	public List<Item> getItem(UserConfig userSession) throws Exception;
}
