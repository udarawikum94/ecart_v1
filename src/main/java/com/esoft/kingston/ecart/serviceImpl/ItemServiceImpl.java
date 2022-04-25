package com.esoft.kingston.ecart.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.esoft.kingston.ecart.dao.ItemDao;
import com.esoft.kingston.ecart.domain.Item;
import com.esoft.kingston.ecart.service.ItemService;
import com.esoft.kingston.ecart.util.UserConfig;

@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	private ItemDao itemDao;
	
	@Override
	public void createItem(UserConfig userConfig, Item item) throws Exception {
		item.setCreatedDate(new Date());
		item.setCreatedUser(userConfig.getUserName());
		
		itemDao.createItem(userConfig, item);
	}

	@Override
	public void updateItem(UserConfig userConfig, Item item) throws Exception {
		item.setModifiedDate(new Date());
		item.setModifiedUser(userConfig.getUserName());
		
		itemDao.updateItem(userConfig, item);
	}

	@Override
	public void deleteItem(UserConfig userConfig, int id) throws Exception {
		itemDao.deleteItem(userConfig, id);
	}

	@Override
	public List<Item> getItem(UserConfig userSession) throws Exception {
		return itemDao.getItem(userSession);
	}

}
