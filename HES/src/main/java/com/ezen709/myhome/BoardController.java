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

import com.ezen709.myhome.model.BoardDTO;
import com.ezen709.myhome.service.BoardMapper;


@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping("/board_list.do")
	public ModelAndView list(HttpServletRequest req) {
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = pageSize * currentPage - (pageSize - 1);
		int endRow = pageSize * currentPage;
		int count = boardMapper.getCount();
		if (endRow>count) endRow = count;
		List<BoardDTO> listBoard = boardMapper.listBoard(startRow, endRow);//boardDAO.listBoard(startRow, endRow);
		int startNum = count - ((currentPage-1) * pageSize);
		int pageBlock = 3;
		int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
		int startPage = (currentPage - 1)/pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage>pageCount) endPage = pageCount;
		
		ModelAndView mav = new ModelAndView("board/list");
		mav.addObject("count", count);
		mav.addObject("startNum", startNum);
		mav.addObject("pageCount", pageCount);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("pageBlock", pageBlock);
		mav.addObject("listBoard", listBoard);
		return mav;
	}
	
	@RequestMapping(value="/board_write.do",method=RequestMethod.GET)
	public String writeFrom() {
		return "board/writeForm";
	}
	@RequestMapping(value="/board_write.do",method=RequestMethod.POST)
	public String writePro(HttpServletRequest req,@ModelAttribute BoardDTO dto, BindingResult result) {
		if(result.hasErrors()) {
			dto.setNum(0);
			dto.setRe_level(0);
			dto.setRe_step(0);
		}
		dto.setIp(req.getRemoteAddr());
		int res = boardMapper.insertBoard(dto);
		return "redirect:board_list.do";
	}
	@RequestMapping("/board_content.do")
	public ModelAndView content(@RequestParam int num) {
		BoardDTO dto = boardMapper.getBoard(num, "content");
		ModelAndView mav = new ModelAndView("board/content","getBoard",dto);
		return mav;
	}
	
}
