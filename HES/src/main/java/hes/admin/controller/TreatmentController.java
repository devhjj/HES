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
public class TreatmentController {

	@Autowired
	private TreatmentMapper treatmentMapper;
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Autowired
	private DoctorMapper doctorMapper;
	
	@Autowired
	private ReservationMapper reservationMapper;
	
	@RequestMapping(value="/treatment.do", method=RequestMethod.GET)
	public ModelAndView listTreatment() {
		List<TreatmentDTO> listTreatment = treatmentMapper.listTreatment();
		List<DepartmentDTO> listDepartment = departmentMapper.listDepartment();
		ModelAndView mav = new ModelAndView("treatment/treatment_list");
		mav.addObject("listTreatment",listTreatment);
		mav.addObject("listDepartment", listDepartment);
		return mav;
	}
	
	//�����Ͽ��� ����˻�
	@RequestMapping(value="/treatment.do", method=RequestMethod.POST)
	public ModelAndView searchTreatment(HttpServletRequest req) {
		List<DepartmentDTO> listDepartment = departmentMapper.listDepartment();
		ModelAndView mav = new ModelAndView("treatment/treatment_list");
		
		String searchColumn=null, searchString=null;
		if(req.getParameter("treatment_Date")!=null) {
			searchColumn = "treatment_Date";
			searchString = req.getParameter("treatment_Date");
		}else if(req.getParameter("dep_Code")!=null) {
			searchColumn = "dep_Code";
			searchString = req.getParameter("dep_Code");
		}else if(req.getParameter("filter")!=null) {
			searchColumn = req.getParameter("filter");
			searchString = req.getParameter("searchString");
		}
		List<TreatmentDTO> searchTreatment = treatmentMapper.searchTreatment1(searchColumn,searchString);
		
		mav.addObject("searchTreatment", searchTreatment);
		mav.addObject("listDepartment", listDepartment);
		return mav;
	}
	
	@RequestMapping(value="/treatment_input.do", method=RequestMethod.GET)
	public ModelAndView inputTreatment() {
		ModelAndView mav = new ModelAndView("treatment/treatment_input");
		return mav;
	}
	
	//�����߰� -> �����߰�
	@RequestMapping(value="/treatment_input.do", method=RequestMethod.POST)
	public String insertTreatmentPro(@ModelAttribute TreatmentDTO dto) {
		dto.setTreatment_Detail("");
		treatmentMapper.insertTreatment(dto);
		return "redirect:treatment.do";
	}
	
	//����� -> �������
	@RequestMapping(value="/treatment_input2.do", method=RequestMethod.POST)
	public String insertTreatmentPro2(@ModelAttribute ReservationDTO dto) {
		TreatmentDTO dto2 = new TreatmentDTO();
		dto2.setPatient_Name(dto.getPatient_Name());
		dto2.setTreatment_Date(dto.getTreatment_Date());
		dto2.setTreatment_Time(dto.getTreatment_Time());
		dto2.setDep_Code(dto.getDep_Code());
		dto2.setDoc_Name(dto.getDoc_Name()); 
		dto2.setTreatment_Detail("����� ���� �� �䱸���� : \n" + dto.getReservation_Detail());
		treatmentMapper.insertTreatment(dto2); 
		reservationMapper.approveReservation(dto.getReservation_Code()); //���������Ȳ '�������' ���� ����
		return "redirect:treatment.do";
	}
	
	//���� �߰��� ���� ��ȸ	
	@RequestMapping(value="/treatment_status.do", method= {RequestMethod.GET ,RequestMethod.POST})
	public ModelAndView treatmentStatus(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("treatment/treatment_status");
		List<DepartmentDTO> listDepartment = departmentMapper.listDepartment();
		List<DoctorDTO> listDoctor = doctorMapper.listDoctor();
		String dep_Code = req.getParameter("dep_Code");
		String doc_Name = req.getParameter("doc_Name");
		String treatment_Date = req.getParameter("treatment_Date");
		
		//�μ� ���ý� �ش� �ǻ縸 �ǻ�list�� ���
		if(dep_Code != null) {
			if(!dep_Code.equals("0")) {
				listDoctor = doctorMapper.filtering(Integer.valueOf(req.getParameter("dep_Code")));
			}
			mav.addObject("dep_Code",dep_Code);
		}
		
		//�μ� �ǻ� ��¥ ��� ���ý� �ش� ���� �˻� 
		if(dep_Code != null & doc_Name != null & treatment_Date != null) {
			List<TreatmentDTO>searchTreatment = treatmentMapper.searchTreatment2(doc_Name, treatment_Date);
			List<ReservationDTO>searchReservation = reservationMapper.searchReservation2(doc_Name, treatment_Date);
			mav.addObject("treatment_Date", treatment_Date);
			mav.addObject("doc_Name", doc_Name);
			mav.addObject("dep_Code2",dep_Code);
			mav.addObject("searchTreatment", searchTreatment);
			mav.addObject("searchReservation", searchReservation);
		}
		
		//���࿡�� ��ȸ���� ���ῡ�� ��ȸ���� �����ϱ�
		String mode = req.getParameter("mode");
		mav.addObject("mode", mode);

		mav.addObject("listDoctor", listDoctor);
		mav.addObject("listDepartment", listDepartment);
		return mav;
	}
	
	@RequestMapping(value="/treatment_update.do", method=RequestMethod.GET)
	public ModelAndView updateTreatment(@RequestParam int treatment_Code) {
		ModelAndView mav = new ModelAndView("treatment/treatment_update");
		TreatmentDTO dto = treatmentMapper.getTreatment(treatment_Code);
		mav.addObject("getTreatment", dto);
		return mav;
	}
	
	@RequestMapping(value="/treatment_update.do", method=RequestMethod.POST)
	public String updateTreatmentPro(@ModelAttribute TreatmentDTO dto) {
		dto.setTreatment_Detail("");
		treatmentMapper.updateTreatment(dto);
		return "redirect:treatment.do";
	}
	
	@RequestMapping("/treatment_delete.do")
	public String deleteTreatment(@RequestParam int treatment_Code) {
		treatmentMapper.deleteTreatment(treatment_Code);
		return "redirect:treatment.do";
	}
}
