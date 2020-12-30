package com.ezen709.myhome.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen709.myhome.model.PatientDTO;

@Service
public class PatientMapper {


	@Autowired
	private SqlSession sqlSession;
	
	public List<PatientDTO> listPatient(){
		return sqlSession.selectList("listPatient");
	}
	
	public int insertPatient(PatientDTO dto) {
		try {
			return sqlSession.insert("insertPatient", dto);
		} catch (Exception e) {
			//환자코드중복
			return -1;
		}
	}
}
