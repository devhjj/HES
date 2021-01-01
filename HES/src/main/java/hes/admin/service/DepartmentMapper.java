package hes.admin.service;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hes.admin.model.DepartmentDTO;

@Service
public class DepartmentMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<DepartmentDTO> listDepartment(){
		return sqlSession.selectList("listDepartment");
	}
	

	public List<DepartmentDTO> filtering(int filter){
		return sqlSession.selectList("filtering", filter);
	}
	
	public int insertDepartment(DepartmentDTO dto) {
		return sqlSession.insert("insertDepartment", dto);
	}
	
	public void deleteDepartment(int dep_Code) {
		sqlSession.delete("deleteDepartment", dep_Code);
	}
	
	public DepartmentDTO getDepartment(int dep_Code) {
		DepartmentDTO dto = sqlSession.selectOne("getDepartment", dep_Code);
		return dto;
	}
	
	public int updateDepartment(DepartmentDTO dto) {
		int res = sqlSession.update("updateDepartment", dto);
		return res;
	}
	
}
