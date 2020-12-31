package com.ezen709.myhome.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

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
		return sqlSession.insert("insertRoom",dto);
	
	}
	
	public int deleteRoom(int roomNum) {
		return sqlSession.delete("deleteRoom",roomNum);
		
	}
	
	public RoomDTO getRoom(int roomNum) {
		RoomDTO dto = sqlSession.selectOne("getRoom", roomNum);
		return dto;
	}
	
	public int updateRoom(RoomDTO dto) {
		return sqlSession.update("updateRoom", dto);	
	}
	
	public int minAccommodatedNumNow(String roomName) {
		return sqlSession.update("minAccommodatedNumNow", roomName);
	}
	
	public int plusAccommodatedNumNow(String roomName) {
		return sqlSession.update("plusAccommodatedNumNow", roomName);
	}
	
	public int changeAccommodatedNumNow(RoomDTO dto, int change) {
		System.out.print(change);
		String sql = "update hospital_room set accommodated_number_now = accommodated_number_now +"+change+"where roomNum="+ dto.getRoomNum();
		System.out.print(sql);
		Map<String, String> map = new Hashtable<>();
		map.put("sql",sql);
		return sqlSession.update("changeAccommodatedNumNow",map);
	}
}
