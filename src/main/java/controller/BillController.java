package controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import service.CarbonFootprintDao;
import service.UserDao;

@Controller
public class BillController {
	
private final CarbonFootprintDao calculatordao;
	
	@Autowired
	BillController(CarbonFootprintDao calculatordao){
		this.calculatordao = calculatordao;
	}
	
	@ResponseBody
    @PostMapping("/uploadElectricityBill")
    public RedirectView handleElectricityFormUpload(@RequestParam("file") MultipartFile file,@RequestParam int electricity) throws IOException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!file.isEmpty()) {
            byte[] bytes = file.getBytes();
            calculatordao.storeElectricityBill(authentication.getName(), electricity, bytes);
			return new RedirectView("http://localhost:8080/Project/water");
       } else {
    	   return new RedirectView("http://localhost:8080/Project/electricity");
       }
    }
	
	@PostMapping("/waterbillform")
	public RedirectView handleWaterBillFormUpload(@RequestParam("file") MultipartFile file,@RequestParam int water) throws IOException{
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!file.isEmpty()) {
            byte[] bytes = file.getBytes();
			calculatordao.storewaterbill(authentication.getName(), water, bytes);
			return new RedirectView("http://localhost:8080/Project/recycle");
       } else {
    	   return new RedirectView("http://localhost:8080/Project/water");
       }
	}
	
	@PostMapping("/recyclebillform")
	public RedirectView handleRecycleBillFormUpload(@RequestParam("file") MultipartFile file,@RequestParam int recycle) throws IOException {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!file.isEmpty()) {
            byte[] bytes = file.getBytes();
			calculatordao.storerecyclebill(authentication.getName(), recycle, bytes);
			return new RedirectView("http://localhost:8080/Project/");
       } else {
    	   return new RedirectView("http://localhost:8080/Project/recycle");
       }
	}

}