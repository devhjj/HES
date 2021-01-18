package hes.admin.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hes.admin.model.BoardDTO;


@Service
public class BoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> listBoard(int start, int end){
		Map<String, Integer> map = new Hashtable<>();
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("listBoard", map);
	}
	
	public int getCount(){
		return sqlSession.selectOne("getCount");
	}
	
	public int insertBoard(BoardDTO dto) {	
			String sql = null;
			if (dto.getNum()==0) {
				sql = "update board set re_step = re_step + 1";
			}else {
				sql = "update board set re_step = re_step + 1 where re_step > " + dto.getRe_step();
				dto.setRe_step(dto.getRe_step() + 1);
				dto.setRe_level(dto.getRe_level() + 1);
			}
			Map<String, String> map = new Hashtable<>();
			map.put("sql", sql);
			sqlSession.update("plusRe_step", map);
			int res = sqlSession.insert("insertBoard", dto);
			return res;
	}
			
	public int plusReadCount(Integer num) {	
			int res = sqlSession.update("plusReadCount",num);
			return res;	
	}
			
	public BoardDTO getBoard(int num, String mode) {
		  	if(mode.equals("content")) {
				plusReadCount(num);
			}
			BoardDTO dto = sqlSession.selectOne("getBoard",num);
			return dto;	
	}
			
	public boolean isPasswd(int num, String passwd) {
		BoardDTO dto = getBoard(num, "isPasswd");
		if(dto.getPasswd().equals(passwd)) {
			return true;
		}
		return false;
	}

	public int deleteBoard(Integer num, String passwd) {
			if(!isPasswd(num,passwd)) {
				return -1;
			}
			Integer res = sqlSession.delete("deleteBoard",num);
			return res;
	}
			
	public int updateBoard(BoardDTO dto) {
			if(!isPasswd(dto.getNum(),dto.getPasswd())) {
				return -1;
			}
			Integer res = sqlSession.update("updateBoard",dto);
			return res;
	}
		
}
