package hes.admin.service;

import java.util.Map;
import java.util.Optional;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import hes.common.MemberDTO;

@Service
public class MemberMapper {
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public boolean createMember(MemberDTO dto) {
		int queryResult = 0;
		dto.setPatient_passwd(bcryptPasswordEncoder.encode(dto.getPatient_passwd()));
		queryResult = sqlSession.insert("createMember", dto);
		
		return (queryResult == 1) ? true : false;
	}

    public Optional<MemberDTO> findUserByEmail(String email) {
        return sqlSession.selectOne("findUserByEmail", email);
    }

	public boolean updateMemberStatus(Map<String, String> map) {
		int queryResult = 0;
		
		queryResult = sqlSession.selectOne("findByEmailAndAuth", map);
		
		if(queryResult == 1) {
			queryResult = sqlSession.update("updateUserStatus", map.get("email"));
		}
		
		return (queryResult == 1) ? true : false;
	}

	public boolean updateEmailApproval(Map<String, String> map) {
		int queryResult = 0;
		queryResult = sqlSession.update("updateEmailApproval", map);
		
		return (queryResult == 1) ? true : false;
	}
}
