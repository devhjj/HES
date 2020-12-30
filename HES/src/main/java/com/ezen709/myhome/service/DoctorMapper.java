package com.ezen709.myhome.service;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen709.myhome.model.DepartmentDTO;
import com.ezen709.myhome.model.DoctorDTO;

@Service
public class DoctorMapper {

	@Autowired
	private SqlSession sqlSession;
	
	public List<DoctorDTO> listDoctor(){
		return sqlSession.selectList("listDoctor");
	}
	
	public List<DepartmentDTO> getDepartment(){
		return sqlSession.selectList("setDepartment");
	}
	
	public List<DoctorDTO> filtering(int filter){
		return sqlSession.selectList("docFiltering", filter);
	}
	
	public int insertDoctor(DoctorDTO dto) {
		return sqlSession.insert("insertDoctor", dto);
	}
	
	public int deleteDoctor(int doc_Code) {
		return sqlSession.delete("deleteDoctor", doc_Code);
	}
	
	public DoctorDTO getDoctor(int doc_Code) {
		return sqlSession.selectOne("getDoctor", doc_Code);
	}
	
	public int updateDoctor(DoctorDTO dto) {
		int res = sqlSession.update("updateDoctor", dto);
		return res;
	}
}
