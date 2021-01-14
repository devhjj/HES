package hes.user.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hes.admin.model.DepartmentDTO;
import hes.admin.model.DoctorDTO;
import hes.admin.service.DepartmentMapper;
import hes.admin.service.DoctorMapper;

@Controller
public class User_DepartmentController {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Autowired
	private DoctorMapper doctorMapper;
	
	@RequestMapping("main_department.do")
	public ModelAndView lisetDepartment() {
		List<DepartmentDTO> listDepartment = departmentMapper.listDepartment();
		ModelAndView mav = new ModelAndView("main_department/department_list","listDepartment", listDepartment);
		return mav;
	}
	
	@RequestMapping("main_doctor.do")
	public ModelAndView listDoctor(HttpServletRequest req) {
		int dep_Code = Integer.parseInt(req.getParameter("dep_Code"));
		List<DoctorDTO> listDoctor = doctorMapper.filtering(dep_Code);
		DepartmentDTO department= departmentMapper.getDepartment(dep_Code);
		ModelAndView mav = new ModelAndView("main_department/doctor_list", "listDoctor", listDoctor);
		mav.addObject("department", department);
		return mav;
	}
	
	@RequestMapping("main_view.do")
	public ModelAndView viewDoctor(HttpServletRequest req) {
		int doc_Code = Integer.parseInt(req.getParameter("doc_Code"));
		DoctorDTO viewDoctor = doctorMapper.getDoctor(doc_Code);
		int dep_Code = viewDoctor.getDep_Code();
		DepartmentDTO department = departmentMapper.getDepartment(dep_Code);
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		String date[] = {month + "/" + day, month + "/" + (day+1), month + "/" + (day+2), month + "/" + (day+3), month + "/" + (day+4), month + "/" + (day+5), month + "/" + (day+6)};
		ModelAndView mav = new ModelAndView("main_department/doctor_view", "dto", viewDoctor);
		mav.addObject("department", department);
		mav.addObject("date", date);
		return mav;
	}
	
	@RequestMapping("search_doctor.do")
	public ModelAndView searchDoctor(HttpServletRequest req) {
		String mode = req.getParameter("mode");
		String search = req.getParameter("search");
		System.out.println("mode = "  + mode);
		System.out.println("search = " + search);
		ModelAndView mav = new ModelAndView("main_department/doctor_search");
		List<DoctorDTO> listDoctor = doctorMapper.listDoctor();
		List<DoctorDTO> listDoctor2;
		if(mode==null) {
			listDoctor = doctorMapper.listDoctor();
		
		}else if(mode.equals("doc_Name")) {
			listDoctor = doctorMapper.searchDoctor(search);
		}else if(mode.equals("dep_Name")) {
			int dep_Code = departmentMapper.getDep_Code(search);
			listDoctor = doctorMapper.searchDepartment(dep_Code);
		}
		mav.addObject("listDoctor", listDoctor);
		//mav = new ModelAndView("main_department/doctor_search", "listDoctor", listDoctor);
		
		return mav;
	}
	
}
