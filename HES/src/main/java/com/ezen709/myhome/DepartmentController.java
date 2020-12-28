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
import com.ezen709.myhome.service.DepartmentMapper;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	@RequestMapping(value="department.do", method=RequestMethod.GET)
	public ModelAndView listDepartment() {
		List<DepartmentDTO> listDepartment = departmentMapper.listDepartment();
		List<DepartmentDTO> setFilter = departmentMapper.listDepartment();
		ModelAndView mav = new ModelAndView("department/department","listDepartment", listDepartment);
		mav.addObject("setFilter", setFilter);
		return mav;
	}
	
	@RequestMapping(value="department.do", method=RequestMethod.POST)
	public ModelAndView filtering(HttpServletRequest req) {
		int filter = Integer.parseInt(req.getParameter("filter"));
		List<DepartmentDTO> setFilter = departmentMapper.listDepartment();
		ModelAndView mav = new ModelAndView("department/department", "setFilter", setFilter);
		if (filter==0) {
			List<DepartmentDTO> listDepartment = departmentMapper.listDepartment();
			mav.addObject("listDepartment", listDepartment);
			return mav;
		}else {
			List<DepartmentDTO> listDepartment = departmentMapper.filtering(filter);
			mav.addObject("listDepartment", listDepartment);
			return mav;
		}
	}
	
	@RequestMapping(value="department_input.do", method=RequestMethod.GET)
	public String insertDepartment() {
		return "department/department_input";
	}
	
	@RequestMapping(value="department_input.do", method=RequestMethod.POST)
	public String insertDepartmentPro(HttpServletRequest req, @ModelAttribute DepartmentDTO dto, BindingResult result) {
		int res = departmentMapper.insertDepartment(dto);
		if(res>0) {
			System.out.println("성공");
			return "redirect:department.do";
		}else {
			System.out.println("실패");
			return "department/department_input";
		}
	}
	
	
	@RequestMapping(value="department_delete.do", method=RequestMethod.GET)
	public String deleteDepartment(@RequestParam int dep_Code) {
		departmentMapper.deleteDepartment(dep_Code);
		return "redirect:department.do";
	}
	
	@RequestMapping(value="department_update.do", method=RequestMethod.GET)
	public ModelAndView getDepartment(@RequestParam int dep_Code) {
		DepartmentDTO dto = departmentMapper.getDepartment(dep_Code);
		return new ModelAndView("department/department_update", "dto", dto);
	}
	
	@RequestMapping(value="department_update.do", method=RequestMethod.POST)
	public String updateDepartment(HttpServletRequest req, @ModelAttribute DepartmentDTO dto, BindingResult result) {
		int res = departmentMapper.updateDepartment(dto);
		if(res>0) {
			System.out.println("성공");
			return "redirect:department.do";
		}else {
			System.out.println("실패");
			return "department/department_update";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
