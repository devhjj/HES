package hes.admin.service;

import java.util.List;

import javax.swing.ListModel;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hes.admin.model.DepartmentDTO;
import hes.admin.model.DoctorDTO;

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
	
	public int getDepartmentCode(int doc_Code) {
		return sqlSession.selectOne("getDepartmentCode", doc_Code);
	}
	
	public String getImage(int doc_Code) {
		return sqlSession.selectOne("getImage", doc_Code);
	}
	
	public List<DoctorDTO> searchDoctor(String search) {
		return sqlSession.selectList("searchDoctor", search);
	}
	
	public List<DoctorDTO> searchDepartment(int dep_Code){
		return sqlSession.selectList("searchDepartment", dep_Code);
	}
}
