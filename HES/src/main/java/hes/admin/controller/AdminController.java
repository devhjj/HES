package hes.admin.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminController {

	@Autowired
	//private PatientMapper patientMapper;

	@RequestMapping(value = "admin", method = RequestMethod.GET)
	public String userIndex() {
		return "index";
	}

}
