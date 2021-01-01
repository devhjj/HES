package hes.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hes.admin.model.PatientDTO;
import hes.admin.service.PatientMapper;

@Controller
public class PatientController {

	@Autowired
	private PatientMapper PatientMapper;
	
	@RequestMapping(value="patient.do", method=RequestMethod.GET)
	public ModelAndView listDoctor() {
		List<PatientDTO> listPatient = PatientMapper.listPatient();
		ModelAndView mav = new ModelAndView("patient/patient_list", "listPatient", listPatient);
		return mav;
	}


	
}
