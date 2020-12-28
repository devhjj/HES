package com.ezen709.myhome.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen709.myhome.model.RoomDTO;

@Service
public class RoomMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<RoomDTO> listRoom(){
		return sqlSession.selectList("listRoom");
	}
	
	public int insertRoom(RoomDTO dto) {
		int res = sqlSession.insert("insertRoom",dto);
		return res;
	}
}
