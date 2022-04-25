package com.esoft.kingston.ecart.dao;

import com.esoft.kingston.ecart.domain.Image;
import com.esoft.kingston.ecart.util.UserConfig;

public interface ImageUploadDao {
	public void uploadImage(UserConfig userConfig, Image image) throws Exception;
	public Image retrieveImage(UserConfig userConfig, Image image) throws Exception;
}
