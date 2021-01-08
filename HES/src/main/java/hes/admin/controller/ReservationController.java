package hes.admin.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hes.admin.model.DepartmentDTO;
import hes.admin.model.DoctorDTO;
import hes.admin.model.ReservationDTO;
import hes.admin.model.TreatmentDTO;
import hes.admin.service.DepartmentMapper;
import hes.admin.service.DoctorMapper;
import hes.admin.service.ReservationMapper;
import hes.admin.service.TreatmentMapper;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationMapper reservationMapper;
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Autowired
	private DoctorMapper doctorMapper;
	
	@Autowired
	private TreatmentMapper treatmentMapper;
	
	@RequestMapping(value="/reservation.do" ,method=RequestMethod.GET)
	public ModelAndView listReservation() {
		ModelAndView mav = new ModelAndView("/reservation/reservation_list");
		List<DepartmentDTO> listDepartment = departmentMapper.listDepartment();
		List<ReservationDTO> listReservation = reservationMapper.listReservation();
		mav.addObject("listDepartment", listDepartment);
		mav.addObject("listReservation",listReservation);
		return mav;
	}
	
	@RequestMapping(value="/reservation.do" ,method=RequestMethod.POST)
	public ModelAndView listReservation(HttpServletRequest req){
		ModelAndView mav = new ModelAndView("/reservation/reservation_list");
		List<DepartmentDTO> listDepartment = departmentMapper.listDepartment();
		
		String searchColumn=null, searchString=null;
		if(req.getParameter("treatment_Date")!=null) {
			searchColumn = "treatment_Date";
			searchString = req.getParameter("treatment_Date");
		}else if(req.getParameter("reservation_Date")!=null) {
			searchColumn = "reservation_Date";
			searchString = req.getParameter("reservation_Date");
		}else if(req.getParameter("dep_Code")!=null) {
			searchColumn = "dep_Code";
			searchString = req.getParameter("dep_Code");
		}else if(req.getParameter("filter")!=null) {
			searchColumn = req.getParameter("filter");
			searchString = req.getParameter("searchString");
		}
		List<ReservationDTO> searchReservation = reservationMapper.searchReservation1(searchColumn,searchString);
		
		mav.addObject("searchReservation", searchReservation);
		mav.addObject("listDepartment", listDepartment);
		return mav;
	}
	
	@RequestMapping(value="/reservation_input.do" ,method=RequestMethod.GET)
	public String insertReservation() {
		return "reservation/reservation_input";
	}
	
	@RequestMapping(value="/reservation_input.do" ,method=RequestMethod.POST)
	public String insertReservation(@ModelAttribute ReservationDTO dto, HttpServletRequest req) {
		if(req.getParameter("reservation_Detail") == null) {
			dto.setReservation_Detail("");
		}
		reservationMapper.insertReservation(dto);
		return "redirect:reservation.do";
	}
	
	@RequestMapping("/reservation_view.do")
	public ModelAndView viewReservation(@RequestParam int reservation_Code) {
		ModelAndView mav = new ModelAndView("reservation/reservation_view");
		ReservationDTO dto = reservationMapper.getReservation(reservation_Code);
		mav.addObject("getReservation", dto);
		return mav;
	}
	
	@RequestMapping("/reservation_reject.do")
	public String rejectReservation(@RequestParam int reservation_Code) {
		reservationMapper.rejectReservation(reservation_Code);
		return "redirect:reservation.do";
	}		
}
