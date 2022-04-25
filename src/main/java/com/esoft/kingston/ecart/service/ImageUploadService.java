package com.esoft.kingston.ecart.service;

import org.springframework.web.multipart.MultipartFile;

import com.esoft.kingston.ecart.domain.Image;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserConfig;

/**
 * @author Udara Liyanage
 * @since Feb 2, 2022
 * 
 * @implNote 
 * 		: Manages Business settings, 
 * 		: Represents a single instance implementation
 */

public interface ImageUploadService {
	public ResponseDTO uploadImage(UserConfig userConfig, MultipartFile file) throws Exception;
	public Image retrieveImage(UserConfig userConfig, int imageId) throws Exception;
}
