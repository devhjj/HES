package com.ezen709.myhome.service;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen709.myhome.model.BoardDTO;

@Service
public class BoardMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<BoardDTO> listBoard(int start, int end) {
		Map<String, Integer> map = new Hashtable<>();
		map.put("start", start);
		map.put("end", end);
		List<BoardDTO> list = sqlSession.selectList("listBoard", map);
		return list;
	}

	public int getCount() {
			Integer count = sqlSession.selectOne("getCount");
			return count;
	}

	public int insertBoard(BoardDTO dto) {
		String sql = null;
		if (dto.getNum() == 0) {
			sql = "update board set re_step = re_step + 1";
		} else {
			sql = "update board set re_step = re_step + 1 where re_step > " + dto.getRe_step();
			dto.setRe_step(dto.getRe_step() + 1);
			dto.setRe_level(dto.getRe_level() + 1);
		}
		Map<String, String> map = new Hashtable<>();
		map.put("sql", sql);
		sqlSession.update("plusRe_step", map);
		int res = sqlSession.insert("insertBoard", dto);
		sqlSession.commit();
		return res;
	}
	
	public BoardDTO getBoard(int num, String mode) {
		if (mode.equals("content")) {
			sqlSession.update("plusReadCount",num);
		}
		//sqlSession.commit();
		BoardDTO dto = sqlSession.selectOne("getBoard",num);
		return dto;
	}
	
	
}
