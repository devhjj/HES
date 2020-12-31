package com.ezen709.myhome;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen709.myhome.model.HospitalizationDTO;
import com.ezen709.myhome.model.RoomDTO;
import com.ezen709.myhome.service.HospitalizationMapper;
import com.ezen709.myhome.service.RoomMapper;

@Controller
public class HospitalizationController {

	@Autowired
	private HospitalizationMapper hospitalizationMapper;
	
	@Autowired
	private RoomMapper roomMapper;
			
	@RequestMapping("/hospitalization.do")
	public ModelAndView listHpl() {
		List<HospitalizationDTO> listHospitalization = hospitalizationMapper.listHospitalization();
		ModelAndView mav = new ModelAndView("hospitalization/hospitalization");
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
		roomMapper.minAccommodatedNumNow(dto.getRoomName()); //병실 입원 가능 인원 - 1
		return "redirect:hospitalization.do";
	}
	
	//병실 조회시 팝업창
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
		roomMapper.plusAccommodatedNumNow(dto.getRoomName()); //입원 삭제 시 병실 가능 인원 + 1
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
		roomMapper.plusAccommodatedNumNow(currentRoomName); //이전 병실 가능 인원 + 1
		roomMapper.minAccommodatedNumNow(dto.getRoomName()); //이동 병실 가능 인원 - 1
		return "redirect:hospitalization.do";
	}
}
