package hes.admin.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hes.admin.model.HospitalizationDTO;

@Service
public class HospitalizationMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public List<HospitalizationDTO> listHospitalization(){
		return sqlSession.selectList("listHospitalization");
	}
	
	public List<HospitalizationDTO> searchHospitalization(String filter, String searchString){
		String sql = "select * from hospital_hospitalization where "+ filter +"= '"+searchString+"'";
		Map<String, String> map = new Hashtable<>();
		map.put("sql",sql);
		return sqlSession.selectList("searchHospitalization", map);
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
