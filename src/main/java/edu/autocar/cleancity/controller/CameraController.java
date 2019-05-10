package edu.autocar.cleancity.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.autocar.cleancity.broker.MjpegBroker;

@Controller
public class CameraController {
	
	@Autowired
	MjpegBroker broker;

	@GetMapping("/camera/{cameraId}")
	public String camera(@PathVariable("cameraId") int cameraId, Model model) {
		model.addAttribute("deviceId", cameraId);
		return "camera";
	}
	
	@PostMapping("/camera/{cameraId}")
	@ResponseBody
	public boolean postCamera(@PathVariable("cameraId") int cameraId,
							@RequestParam("image") MultipartFile image) {
		try {
			broker.update(cameraId, image.getBytes());
			System.out.println(cameraId);
			return true;
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	@GetMapping("/ipCam")
	public void ipCam() {
		
	}
	
	
//	@PostMapping("/ipCam")
//	public String postIpCam(Model model) throws Exception {
//		byte[] data = view.getImage();
//		model.addAttribute("image", data);
//		return "ipCam";
//	}
	
	
}
