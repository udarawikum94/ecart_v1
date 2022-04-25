package com.esoft.kingston.ecart.dao;

import com.esoft.kingston.ecart.domain.BusinessSetting;
import com.esoft.kingston.ecart.util.UserConfig;

public interface BusinessSettingDao {
	public void createBusinessSetting(UserConfig userConfig, BusinessSetting businessSetting) throws Exception;
	public void updateBusinessSetting(UserConfig userConfig, BusinessSetting businessSetting) throws Exception;
	public void deleteBusinessSetting(UserConfig userConfig, int id) throws Exception;
	
	public BusinessSetting getBusinessSetting(UserConfig userSession) throws Exception;;
}
