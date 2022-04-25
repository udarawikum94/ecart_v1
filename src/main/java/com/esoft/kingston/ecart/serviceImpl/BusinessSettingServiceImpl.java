package com.esoft.kingston.ecart.serviceImpl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.esoft.kingston.ecart.dao.BusinessSettingDao;
import com.esoft.kingston.ecart.domain.BusinessSetting;
import com.esoft.kingston.ecart.service.BusinessSettingService;
import com.esoft.kingston.ecart.util.UserConfig;

@Service
public class BusinessSettingServiceImpl implements BusinessSettingService {
	@Autowired
	private BusinessSettingDao businessSettingDao;
	
	@Override
	public void createBusinessSetting(UserConfig userConfig, BusinessSetting businessSetting) throws Exception {
		businessSetting.setCreatedDate(new Date());
		businessSetting.setCreatedUser(userConfig.getUserName());
		
		businessSettingDao.createBusinessSetting(userConfig, businessSetting);
	}

	@Override
	public void updateBusinessSetting(UserConfig userConfig, BusinessSetting businessSetting) throws Exception {
		businessSetting.setModifiedDate(new Date());
		businessSetting.setModifiedUser(userConfig.getUserName());
		
		businessSettingDao.updateBusinessSetting(userConfig, businessSetting);
	}

	@Override
	public void deleteBusinessSetting(UserConfig userConfig, int id) throws Exception {
		businessSettingDao.deleteBusinessSetting(userConfig, id);
	}

	@Override
	public BusinessSetting getBusinessSetting(UserConfig userSession) throws Exception {
		return businessSettingDao.getBusinessSetting(userSession);
	}

}
