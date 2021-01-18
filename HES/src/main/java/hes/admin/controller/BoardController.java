package hes.admin.controller;

import java.io.File;
import java.io.IOException;
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

import hes.admin.model.BoardDTO;
import hes.admin.service.BoardMapper;



@Controller
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/fileUpload_ok.do")
	public void fileUpload_ok(HttpServletRequest req){
		String filename="";
		int filesize=0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("filename");
		File target= new File(uploadPath, file.getOriginalFilename());
		if(file.getSize() > 0) {
			try {
				file.transferTo(target);
				filename = file.getOriginalFilename();
				filesize = (int)file.getSize();
			} catch (IOException e) {
			}
		}
		System.out.println("filename ="+ filename);
		System.out.println("filesize =" +filesize+"bytes");
	}
	
	@RequestMapping("/test_fileUpload.do")
	public String fileUpload() {
		return "FileUpload";
	}
	

	@RequestMapping("/board_list.do")
	public ModelAndView listBoard(HttpServletRequest req) {
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
		List<BoardDTO> listBoard = boardMapper.listBoard(startRow, endRow);
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
	
	@RequestMapping(value="/board_write.do", method=RequestMethod.GET)
	public String writeForm() {
		return "board/writeForm";
	}
	
	@RequestMapping(value="/board_write.do", method=RequestMethod.POST)
	public ModelAndView writePro(HttpServletRequest req, @ModelAttribute BoardDTO dto, BindingResult result) {
		if (result.hasErrors()) {
			dto.setNum(0);
			dto.setRe_step(0);
			dto.setRe_level(0);
		}
		dto.setIp(req.getRemoteAddr());
		int res = boardMapper.insertBoard(dto);//boardDAO.insertBoard(dto);
		String msg = null, url="board_list.do";
		if(res>0) {
			msg = "글 등록 완료";
		}else {
			msg = "글 등록 실패";
		}
		ModelAndView mav = new ModelAndView("message");
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		return mav;
	}
	
	@RequestMapping("/board_content.do")
	public ModelAndView content(@RequestParam int num) {
		BoardDTO dto = boardMapper.getBoard(num, "content");
		ModelAndView mav = new ModelAndView("board/content", "getBoard", dto);
		return mav;
	}
	
	@RequestMapping(value="/board_delete.do", method=RequestMethod.GET)
	public String deleteForm() {
		return "board/deleteForm";
	}
	
	@RequestMapping(value="/board_delete.do", method=RequestMethod.POST)
	public String deletePro(@RequestParam int num, @RequestParam String passwd) {
		int res = boardMapper.deleteBoard(num, passwd);
		return "redirect:board_list.do";
	}
	
	@RequestMapping(value="/board_update.do", method=RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam int num) {
		BoardDTO dto = boardMapper.getBoard(num, "update");
		ModelAndView mav = new ModelAndView("board/updateForm", "getBoard", dto);
		return mav;
	}
	
	@RequestMapping(value="/board_update.do", method=RequestMethod.POST)
	public String updatePro(BoardDTO dto) {
		int res = boardMapper.updateBoard(dto);
		return "redirect:board_list.do";
	}
	
}

