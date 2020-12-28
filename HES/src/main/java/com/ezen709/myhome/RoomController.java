package com.ezen709.myhome;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
