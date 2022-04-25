package com.esoft.kingston.ecart.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.esoft.kingston.ecart.service.ImageUploadService;
import com.esoft.kingston.ecart.util.ResponseDTO;
import com.esoft.kingston.ecart.util.UserSession;

/**
 * @author Udara Liyanage
 * @since Oct 25, 2020
 * @copyright Onenro Solutions
 * @Developed with @IntelijIdea
 */
@Controller
@RequestMapping("/image")
public class ImageUploadController {
	
	@Autowired
	private ImageUploadService imageUploadService;
	
	@PostMapping(value = "/upload")
	@ResponseBody
	public ResponseDTO upload(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception {
		return imageUploadService.uploadImage(UserSession.getUserSession(request), file);
	}

	/**
	 * Upload multiple file using Spring Controller
	 */
	@RequestMapping(value = "/uploadMultipleFile", method = RequestMethod.POST)
	public @ResponseBody
	String uploadMultipleFileHandler(@RequestParam("name") String[] names,
			@RequestParam("file") MultipartFile[] files) {

		if (files.length != names.length)
			return "Mandatory information missing";

		String message = "";
		for (int i = 0; i < files.length; i++) {
			MultipartFile file = files[i];
			String name = names[i];
			try {
				byte[] bytes = file.getBytes();

				/*// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				logger.info("Server File Location="
						+ serverFile.getAbsolutePath());

				message = message + "You successfully uploaded file=" + name*/
			} catch (Exception e) {
				return "You failed to upload " + name + " => " + e.getMessage();
			}
		}
		return message;
	}
	
	private String getErrorMessage(Exception e) {
		String errorMessage = "Error occured during process. Error code #002";
		return e.getMessage()!=null?e.getMessage():errorMessage;
	}
}
