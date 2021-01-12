package hes.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import hes.admin.model.DepartmentDTO;
import hes.admin.model.DoctorDTO;
import hes.admin.service.DepartmentMapper;
import hes.admin.service.DoctorMapper;

@Controller
public class DoctorController {

	@Autowired
	private DoctorMapper doctorMapper;
	
	@Autowired
	private DepartmentMapper departmentmapper;
	
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
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="doctor_input.do", method=RequestMethod.GET)
	public ModelAndView insertDoctor() {
		List<DepartmentDTO> getDepartment = doctorMapper.getDepartment();
		ModelAndView mav = new ModelAndView("doctor/doctor_input", "getDepartment", getDepartment);
		return mav;
	}
	
	@RequestMapping(value="doctor_input.do", method=RequestMethod.POST)
	public String insertDoctorPro(HttpServletRequest req, @ModelAttribute DoctorDTO dto, BindingResult result) {
		
		String doc_Image = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("doc_Image");
		File target = new File(uploadPath, file.getOriginalFilename());
		if(file.getSize()>0) {
			try {
				file.transferTo(target);
				doc_Image = file.getOriginalFilename();
				//filesize = (int)file.getSize();
			} catch (IOException e) {
				// TODO: handle exception
			}
		}
		System.out.println("filename = " + doc_Image);
		//System.out.println("filesize = " + filesize + "bytes");
		
		dto.setDoc_Image(doc_Image);
		dto.setDoc_Tel(req.getParameter("doc_Tel1")+"-"+req.getParameter("doc_Tel2")+"-"+req.getParameter("doc_Tel3"));
		dto.setDoc_License(req.getParameter("doc_License1")+"-"+req.getParameter("doc_License2")+"-"+req.getParameter("doc_License3"));
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
		String doc_Tel = dto.getDoc_Tel();
		String doc_TelArray[] = doc_Tel.split("-");
		String doc_License = dto.getDoc_License();
		String doc_LicenseArray[] = doc_License.split("-");
		ModelAndView mav =  new ModelAndView("doctor/doctor_update", "dto", dto);
		mav.addObject("getDepartment", getDepartment);
		mav.addObject("doc_TelArray", doc_TelArray);
		mav.addObject("doc_LicenseArray", doc_LicenseArray);
		return mav;
	}
	
	@RequestMapping(value="doctor_update.do", method=RequestMethod.POST)
	public String updateDoctor(HttpServletRequest req, @ModelAttribute DoctorDTO dto, BindingResult result) {
		
		String doc_Image = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("doc_Image");
		File target = new File(uploadPath, file.getOriginalFilename());
		if(file.getSize()>0) {
			try {
				file.transferTo(target);
				doc_Image = file.getOriginalFilename();
			} catch (IOException e) {
				// TODO: handle exception
			}
		}
		System.out.println("filename = " + doc_Image);
		if(doc_Image.trim().equals("")) {
			dto.setDoc_Image(doctorMapper.getImage(dto.getDoc_Code()));
			System.out.println("imagename : " + dto.getDoc_Image() );
		}else {
			dto.setDoc_Image(doc_Image);
		}
		
		System.out.println("image : " + dto.getDoc_Image());
		dto.setDoc_Tel(req.getParameter("doc_Tel1")+"-"+req.getParameter("doc_Tel2")+"-"+req.getParameter("doc_Tel3"));
		dto.setDoc_License(req.getParameter("doc_License1")+"-"+req.getParameter("doc_License2")+"-"+req.getParameter("doc_License3"));
		int res = doctorMapper.updateDoctor(dto);
		if(res>0) {
			System.out.println("성공");
			return "redirect:doctor.do";
		}else {
			System.out.println("실패");
			return "doctor/doctor_update";
		}
		
	}
	
	@RequestMapping("doctor_view.do")
	public ModelAndView viewDoctor(@RequestParam int doc_Code) {
		DoctorDTO dto = doctorMapper.getDoctor(doc_Code);
		int dep_Code = dto.getDep_Code();
		DepartmentDTO department = departmentmapper.getDepartment(dep_Code);
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DATE);
		String date[] = {month + "/" + day, month + "/" + (day+1), month + "/" + (day+2), month + "/" + (day+3), month + "/" + (day+4), month + "/" + (day+5), month + "/" + (day+6)};
		ModelAndView mav = new ModelAndView("doctor/doctor_view", "dto", dto);
		mav.addObject("department", department);
		mav.addObject("date", date);
		return mav;
	}
	
}
