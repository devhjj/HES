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
	private PatientMapper patientMapper;

	@RequestMapping(value = "patient.do", method = RequestMethod.GET)
	public ModelAndView listPatient() {
		List<PatientDTO> listPatient = patientMapper.listPatient();
		ModelAndView mav = new ModelAndView("patient/patient_list", "listPatient", listPatient);
		return mav;
	}

	@RequestMapping(value = "patient_input.do", method = RequestMethod.GET)
	public String insertPatient() {
		return "patient/patient_input";
	}

	@RequestMapping(value = "patient_input.do", method = RequestMethod.POST)
	public String insertPatient(HttpServletRequest req, @ModelAttribute PatientDTO dto, BindingResult result) {
		int res = patientMapper.insertPatient(dto);
		if (res > 0) {
			System.out.println("성공");
			return "redirect:patient.do";
		} else {
			System.out.println("실패");
			return "patient/patient_input";
		}
	}
	
	@RequestMapping(value = "patient_login.do", method = RequestMethod.GET)
	public String loginPatient() {
		return "patient/patient_login";
	}
	

	@RequestMapping(value="patient_update.do", method=RequestMethod.GET)
	public ModelAndView updatePatient(@RequestParam int patient_code) {
		PatientDTO dto = patientMapper.getPatient(patient_code);
		ModelAndView mav =  new ModelAndView("patient/patient_update", "dto", dto);
		return mav;
	}
	
	
	@RequestMapping(value="patient_update.do", method=RequestMethod.POST)
	public String updateDoctor(HttpServletRequest req, @ModelAttribute PatientDTO dto, BindingResult result) {
		int res = patientMapper.updatePatient(dto);
		if(res>0) {
			System.out.println("성공");
			return "redirect:patient.do";
		}else {
			System.out.println("실패");
			return "patient/patient_update";
		}
	}

	@RequestMapping(value="patient_delete.do", method=RequestMethod.GET)
	public String deletePatient(@RequestParam int patient_code) {
		patientMapper.deletePatient(patient_code);
		return "redirect:patient.do";
	}


}
