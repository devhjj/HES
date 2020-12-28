package com.ezen709.myhome;

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

import com.ezen709.myhome.model.DepartmentDTO;
import com.ezen709.myhome.model.DoctorDTO;
import com.ezen709.myhome.service.DoctorMapper;

@Controller
public class DoctorController {

	@Autowired
	private DoctorMapper doctorMapper;
	
	@RequestMapping(value="doctor.do", method=RequestMethod.GET)
	public ModelAndView listDoctor() {
		List<DoctorDTO> listDoctor = doctorMapper.listDoctor();
		List<DepartmentDTO> setFilter = doctorMapper.getDepartment();
		ModelAndView mav = new ModelAndView("doctor/doctor_list", "listDoctor", listDoctor);
		mav.addObject("setFilter", setFilter);
		return mav;
	}

	@RequestMapping(value="doctor.do", method=RequestMethod.POST)
	public ModelAndView filtering(HttpServletRequest req) {
		int filter = Integer.parseInt(req.getParameter("filter"));
		List<DepartmentDTO> setFilter = doctorMapper.getDepartment();
		ModelAndView mav =  new ModelAndView("doctor/doctor_list", "setFilter", setFilter);
		if (filter==0) {
			List<DoctorDTO> listDoctor = doctorMapper.listDoctor();
			mav.addObject("listDoctor", listDoctor);
			return mav;
		}else {
			List<DoctorDTO> listDoctor = doctorMapper.filtering(filter);
			mav.addObject("listDoctor", listDoctor);
			return mav;
		}
	}
	
	@RequestMapping(value="doctor_input.do", method=RequestMethod.GET)
	public ModelAndView insertDoctor() {
		List<DepartmentDTO> getDepartment = doctorMapper.getDepartment();
		ModelAndView mav = new ModelAndView("doctor/doctor_input", "getDepartment", getDepartment);
		return mav;
	}
	
	@RequestMapping(value="doctor_input.do", method=RequestMethod.POST)
	public String insertDoctorPro(HttpServletRequest req, @ModelAttribute DoctorDTO dto, BindingResult result) {
		int res = doctorMapper.insertDoctor(dto);
		if(res>0) {
			System.out.println("성공");
			return "redirect:doctor.do";
		}else {
			System.out.println("실패");
			return "doctor/doctor_input";
		}
	}
	
	@RequestMapping(value="doctor_delete.do", method=RequestMethod.GET)
	public String deleteDoctor(@RequestParam int doc_Code) {
		doctorMapper.deleteDoctor(doc_Code);
		return "redirect:doctor.do";
	}
	
	@RequestMapping(value="doctor_update.do", method=RequestMethod.GET)
	public ModelAndView getDoctor(@RequestParam int doc_Code) {
		DoctorDTO dto = doctorMapper.getDoctor(doc_Code);
		List<DepartmentDTO> getDepartment = doctorMapper.getDepartment();
		ModelAndView mav =  new ModelAndView("doctor/doctor_update", "dto", dto);
		mav.addObject("getDepartment", getDepartment);
		return mav;
	}
	
	@RequestMapping(value="doctor_update.do", method=RequestMethod.POST)
	public String updateDoctor(HttpServletRequest req, @ModelAttribute DoctorDTO dto, BindingResult result) {
		int res = doctorMapper.updateDoctor(dto);
		if(res>0) {
			System.out.println("성공");
			return "redirect:doctor.do";
		}else {
			System.out.println("실패");
			return "doctor/doctor_update";
		}
		
	}
	
}
