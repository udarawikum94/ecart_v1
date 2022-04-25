package com.esoft.kingston.ecart.serviceImpl;

import java.sql.Blob;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.esoft.kingston.ecart.dao.ImageUploadDao;
import com.esoft.kingston.ecart.domain.Image;
import com.esoft.kingston.ecart.enumeration.EventsEnum;
import com.esoft.kingston.ecart.enumeration.EventsResponseStatusEnum;
import com.esoft.kingston.ecart.service.ImageUploadService;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserConfig;

@Service
public class ImageUploadServiceImpl implements ImageUploadService {
	@Autowired
	private ImageUploadDao imageUploadDao;

	@Override
	public ResponseDTO uploadImage(UserConfig userConfig, MultipartFile file) throws Exception {
		ResponseDTO responseDTO = null;
		if (!file.isEmpty()) {
			try {
				if (file.getBytes().length>0) {
					byte[] bytesArrayData = file.getBytes();
					Blob imageData = new SerialBlob(bytesArrayData);
					
					Image image = new Image();
					
					image.setImageUpload(imageData);
					//image.setCreatedUser(userConfig.getUserName());
					//image.setCreatedDate(new Date());
					//image.setName(file.getName());
					
					imageUploadDao.uploadImage(userConfig, image);
					
					responseDTO = new ResponseDTO(EventsResponseStatusEnum.SUCCESS.getDescription(), EventsEnum.UPLOAD.getEventMessage(), image);
				} else {
					responseDTO = new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), "Cannot process image. Error code #003", null);
				}
				
				// Creating the directory to store file
				/*String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());*/

			} catch (Exception e) {
				responseDTO = new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), "Exeption occured in uploading image. Error code #003", null);
			}
		} else {
			responseDTO = new ResponseDTO(EventsResponseStatusEnum.FAIL.getDescription(), "Image not found. Error code #003", null);
		}
		
		return responseDTO;
	}

	@Override
	public Image retrieveImage(UserConfig userConfig, int imageId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

}
