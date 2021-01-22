package hes.admin.service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hes.admin.model.PatientDTO;

@Service
public class PatientMapper {


	@Autowired
	private SqlSession sqlSession;
	
	public List<PatientDTO> listPatient(){
		return sqlSession.selectList("listPatient");
	}
	
	public int insertPatient(PatientDTO dto) {
			return sqlSession.insert("insertPatient", dto);
	}
	
	public int updatePatient(PatientDTO dto) {
			return sqlSession.update("updatePatient", dto);
	}
	
	public PatientDTO getPatient(int patient_code) {
		return sqlSession.selectOne("getPatient", patient_code);
	}
	
	public List<PatientDTO> searchPatient(String patient_Name) {
		return sqlSession.selectList("searchPatient", patient_Name);
	}
	
	public int deletePatient(int patient_code) {
		return sqlSession.delete("deletePatient", patient_code);
	}
	
	
	
}
