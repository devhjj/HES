package hes.admin.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hes.admin.model.ReservationDTO;
import hes.admin.model.TreatmentDTO;

@Service
public class ReservationMapper {
	@Autowired
	private SqlSession sqlSession;
	
	public int insertReservation(ReservationDTO dto) {
		return sqlSession.insert("insertReservation", dto);
	}
	
	public List<ReservationDTO> listReservation(){
		return sqlSession.selectList("listReservation");
	}
	
	//예약 목록에서 예약 검색
	public List<ReservationDTO> searchReservation1(String searchColumn, String searchString){
		String sql = "select * from hospital_reservation where "+ searchColumn +"= '"+searchString+"'";
		Map<String, String> map = new Hashtable<>();
		map.put("sql",sql);
		return sqlSession.selectList("searchReservation1", map);
	}
	
	//예약 조회시 예약 검색
	public List<ReservationDTO> searchReservation2(String doc_Name, String treatment_Date){
		String sql = "select * from hospital_reservation where doc_Name='"+doc_Name+"' and treatment_Date='"+treatment_Date+"'";
		Map<String, String> map = new Hashtable<>();
		map.put("sql",sql);
		return sqlSession.selectList("searchReservation2", map);
	}
	
	public ReservationDTO getReservation(int reservation_Code) {
		return sqlSession.selectOne("getReservation", reservation_Code);
	}
	
	public int approveReservation(int reservation_Code) {
		return sqlSession.update("approveReservation", reservation_Code);
	}
	
	public int rejectReservation(int reservation_Code) {
		return sqlSession.update("rejectReservation", reservation_Code);
	}
}
