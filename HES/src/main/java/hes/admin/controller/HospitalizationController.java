package hes.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hes.admin.model.HospitalizationDTO;
import hes.admin.model.RoomDTO;
import hes.admin.service.HospitalizationMapper;
import hes.admin.service.RoomMapper;

@Controller
public class HospitalizationController {

	@Autowired
	private HospitalizationMapper hospitalizationMapper;
	
	@Autowired
	private RoomMapper roomMapper;
			
	@RequestMapping("/hospitalization.do")
	public ModelAndView listHpl() {
		List<HospitalizationDTO> listHospitalization = hospitalizationMapper.listHospitalization();
		ModelAndView mav = new ModelAndView("hospitalization/hospitalization_list");
		mav.addObject("listHospitalization", listHospitalization);
		return mav;
	}
	
	@RequestMapping(value="/hospitalization_input.do", method=RequestMethod.GET)
	public ModelAndView insertHospitalization() {
		ModelAndView mav = new ModelAndView("hospitalization/hospitalization_input");
		return mav;
	}
	
	@RequestMapping(value="/hospitalization_input.do", method=RequestMethod.POST)
	public String insertHospitalizationPro(@ModelAttribute HospitalizationDTO dto) {
		dto.setLeaveDate("");
		hospitalizationMapper.insertHospitalization(dto);
		roomMapper.minAccommodatedNumNow(dto.getRoomName()); //���� �Կ� ���� �ο� - 1
		return "redirect:hospitalization.do";
	}
	
	//���� ��ȸ�� �˾�â
	@RequestMapping("/room_status.do")
	public ModelAndView roomStatus() {
		ModelAndView mav = new ModelAndView("hospitalization/room_status");
		List<RoomDTO> listRoom = roomMapper.listRoom();
		mav.addObject("listRoom", listRoom);
		return mav;
	}
	
	@RequestMapping("/hospitalization_delete.do")
	public String deleteHospitalization(@RequestParam int hplCode) {
		HospitalizationDTO dto = hospitalizationMapper.getHospitalization(hplCode);
		roomMapper.plusAccommodatedNumNow(dto.getRoomName()); //�Կ� ���� �� ���� ���� �ο� + 1
		hospitalizationMapper.deleteHospitalization(hplCode); 
		return "redirect:hospitalization.do";
	}
	
	@RequestMapping(value="/hospitalization_update.do", method=RequestMethod.GET)
	public ModelAndView updateHospitalization(@RequestParam int hplCode) {
		HospitalizationDTO dto = hospitalizationMapper.getHospitalization(hplCode);
		ModelAndView mav = new ModelAndView("hospitalization/hospitalization_update","getHospitalization",dto);
		return mav;
	}
	
	@RequestMapping(value="/hospitalization_update.do", method=RequestMethod.POST)
	public String updateHospitalizationPro(@ModelAttribute HospitalizationDTO dto,@RequestParam String currentRoomName) {
		if(dto.getLeaveDate() == null) {
			dto.setLeaveDate("");
		}
		hospitalizationMapper.updateHospitalization(dto);
		roomMapper.plusAccommodatedNumNow(currentRoomName); //���� ���� ���� �ο� + 1
		roomMapper.minAccommodatedNumNow(dto.getRoomName()); //�̵� ���� ���� �ο� - 1
		return "redirect:hospitalization.do";
	}
}
