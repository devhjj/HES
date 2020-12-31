package com.ezen709.myhome.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen709.myhome.model.HospitalizationDTO;

@Service
public class HospitalizationMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<HospitalizationDTO> listHospitalization(){
		return sqlSession.selectList("listHospitalization");
	}
	
	public HospitalizationDTO getHospitalization(int hplCode) {
		return sqlSession.selectOne("getHospitalization", hplCode);
	}
	
	public int insertHospitalization(HospitalizationDTO dto) {
		return sqlSession.insert("insertHospitalization", dto);
	}
	
	public int deleteHospitalization(int hplCode) {
		return sqlSession.delete("deleteHospitalization", hplCode);
	}
	
	public int updateHospitalization(HospitalizationDTO dto) {
		return sqlSession.update("updateHospitalization", dto);
	}
}
