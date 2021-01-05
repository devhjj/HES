package hes.admin.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hes.admin.model.TreatmentDTO;

@Service
public class TreatmentMapper {
	@Autowired
	private SqlSession sqlSession;

	public List<TreatmentDTO> listTreatment(){
		return sqlSession.selectList("listTreatment");
	}
	
	//진료 목록에서 진료 검색
	public List<TreatmentDTO> searchTreatment1(String searchColumn, String searchString){
		String sql = "select * from hospital_treatment where "+ searchColumn +"= '"+searchString+"'";
		Map<String, String> map = new Hashtable<>();
		map.put("sql",sql);
		return sqlSession.selectList("searchTreatment", map);
	}
	
	//진료 조회시 진료 검색
	public List<TreatmentDTO> searchTreatment2(String doc_Name, String treatment_Date){
		String sql = "select * from hospital_treatment where doc_Name='"+doc_Name+"' and treatment_Date='"+treatment_Date+"'";
		Map<String, String> map = new Hashtable<>();
		map.put("sql",sql);
		return sqlSession.selectList("searchTreatment", map);
	}
	
	public int insertTreatment(TreatmentDTO dto) {
		return sqlSession.insert("insertTreatment", dto);
	}
	
	public TreatmentDTO getTreatment(int treatment_Code) {
		return sqlSession.selectOne("getTreatment", treatment_Code);
	}
	
	public int updateTreatment(TreatmentDTO dto) {
		return sqlSession.update("updateTreatment", dto);
	}
	
	public int deleteTreatment(int treatment_Code) {
		return sqlSession.delete("deleteTreatment", treatment_Code);
	}
}

