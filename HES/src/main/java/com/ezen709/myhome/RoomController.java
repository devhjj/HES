package com.ezen709.myhome;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen709.myhome.model.RoomDTO;
import com.ezen709.myhome.service.RoomMapper;

@Controller
public class RoomController {

	@Autowired
	private RoomMapper roomMapper;
	
	@RequestMapping("/room.do")
	public ModelAndView listRoom() {
		List<RoomDTO> listRoom =  roomMapper.listRoom();
		ModelAndView mav = new ModelAndView("room/room");
		mav.addObject("listRoom", listRoom);
		return mav;
	}
	
	@RequestMapping(value="/room_input.do", method=RequestMethod.GET)
	public String insertRoom() {
		return "room/room_input";
	}
	
	@RequestMapping(value="/room_input.do", method=RequestMethod.POST)
	public String insertRoomPro(@ModelAttribute RoomDTO dto) {
		int res = roomMapper.insertRoom(dto);
		return "redirect:room.do";
	}
	
	@RequestMapping("/room_delete.do")
	public String deleteRoom(@RequestParam int roomNum) {
		roomMapper.deleteRoom(roomNum);
		return "redirect:room.do";
	}
	
	@RequestMapping(value="/room_update.do", method=RequestMethod.GET)
	public ModelAndView updateRoom(@RequestParam int roomNum) {
		RoomDTO dto = roomMapper.getRoom(roomNum);
		ModelAndView mav = new ModelAndView("room/room_update", "getRoom", dto);
		return mav;
	}
	
	@RequestMapping(value="/room_update.do", method=RequestMethod.POST)
	public String UpdateRoomPro(@ModelAttribute RoomDTO dto,@RequestParam int currentAccommodated_number) {
		int change =dto.getAccommodated_number() - currentAccommodated_number;
		System.out.print(change);
		roomMapper.changeAccommodatedNumNow(dto, change);
		roomMapper.updateRoom(dto);
		return "redirect:room.do";
	}
}
