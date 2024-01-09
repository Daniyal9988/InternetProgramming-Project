package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import model.Activity;
import service.add_activity;

@Controller
@RequestMapping("/add")
public class AddActivityController{
	
	private final add_activity  add_activity ;
	
	@Autowired
	AddActivityController(add_activity  add_activity){
		this.add_activity = add_activity;
	}

	@GetMapping("/")
	public String landingPage5() {
		return "admin/events/add_activity";
	}
	
	// String fullName, String dob,Integer phone,String address,
	@PostMapping("/activity")
	public RedirectView getActivity(Model model,@RequestParam String activityName, String activityDate, String location) {
		add_activity.createUser(activityName, activityDate, location);
		return new RedirectView("http://localhost:8080/Project/");
	}
	
	 // @GetMapping("/view-activities")
	
//	@GetMapping("/view-activities")
//	@ResponseBody
//	    public String viewActivities(Model model) {
////	        List<Activity> activityList = add_activity.getAllActivities();
////	        model.addAttribute("activityList", activityList);
////	        return "admin/events/view_activities"; // Assuming you have a view_activities.jsp or similar
//		  List<Activity> activityList = add_activity.getAllActivities();
//			model.addAttribute("activityList", activityList);
//			//just return responsebody for simplicity... pls change to return the appropriate jsp view page here
//			return "getall : " +activityList.toString();
//	    }
	
	
	@GetMapping("/view-activities")
	public ModelAndView getall_mav() {
		List<Activity> activityList = add_activity.getAllActivities();
		ModelAndView mav = new ModelAndView("admin/events/listofactivities");
		mav.addObject("activityList", activityList);
		return mav;
	}
	
	
}
