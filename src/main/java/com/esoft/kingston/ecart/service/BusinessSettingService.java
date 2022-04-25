package com.esoft.kingston.ecart.service;

import com.esoft.kingston.ecart.domain.BusinessSetting;
import com.esoft.kingston.ecart.util.UserConfig;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * 
 * @implNote 
 * 		: Manages Business settings, 
 * 		: Represents a single instance implementation
 */

public interface BusinessSettingService {
	public void createBusinessSetting(UserConfig userConfig, BusinessSetting businessSetting)throws Exception;
	public void updateBusinessSetting(UserConfig userConfig, BusinessSetting businessSetting)throws Exception;
	public void deleteBusinessSetting(UserConfig userConfig, int id)throws Exception;
	
	public BusinessSetting getBusinessSetting(UserConfig userSession) throws Exception;;
}
