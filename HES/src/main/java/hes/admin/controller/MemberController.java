package hes.admin.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hes.admin.service.MailSendService;
import hes.admin.service.MemberMapper;
import hes.common.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private MailSendService mss;

	@GetMapping("/login")
	public String login() {
		return "signin";
	}

	@GetMapping("/member/join")
	public String signup(){
		return "signup";
	}

	@ResponseBody
	@PostMapping(value = "/member/join", consumes = MediaType.APPLICATION_JSON_VALUE) // HttpMediaTypeNotSupportedException Content type error 처리
	public Map<String, Object> join(@RequestBody MemberDTO dto) {
		System.out.println(dto);
		Map<String, Object> response = new HashMap<>();

		// 이메일 정규 표현식
		// "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		// naver.com 메일만 가능하도록 처리
		String emailRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@naver.com$";
		Matcher emailMatcher = Pattern.compile(emailRegex).matcher(dto.getPatient_email());

		// 영문, 숫자, 특수문자 포함 8 ~ 15 자리
		String passwordRegex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$@$!%*?&`~'\"+=])[A-Za-z[0-9]$@$!%*?&`~'\"+=]{8,15}$";
		Matcher passwordMatcher = Pattern.compile(passwordRegex).matcher(dto.getPatient_passwd());

		if (!emailMatcher.find()) {
			response.put("email", true);
			return response;
		} else if (!passwordMatcher.find()) {
			response.put("password", true);
			return response;
		} else if (memberMapper.findUserByEmail(dto.getPatient_email()).isPresent()) {
			response.put("duplicate", true);
			return response;
		}
		// 유효성 검사 끝

		// DB에 기본정보 insert
		boolean result = memberMapper.createMember(dto);
		response.put("success", result);
		
		System.out.println(response);

		if (result) {
			// 임의의 approvalKey 생성 & 이메일 발송
			String approvalKey = mss.sendAuthMail(dto.getPatient_email());
			dto.setApproval_key(approvalKey);

			Map<String, String> map = new HashMap<String, String>();
			map.put("email", dto.getPatient_email());
			map.put("approvalKey", dto.getApproval_key());

			// DB에 approvalKey 업데이트
			memberMapper.updateEmailApproval(map);
		}

		return response;
	}

	@GetMapping("/member/signUpConfirm.do")
	public String signUpConfirm(@RequestParam Map<String, String> map, ModelAndView mav) {
		// email, approvalKey 가 일치할경우 status 업데이트
		if (memberMapper.updateMemberStatus(map)) {
			return "/board/list.do";
		} else {
			return "/member/signup";
		}

	}
}
