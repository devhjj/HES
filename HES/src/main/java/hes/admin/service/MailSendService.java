package hes.admin.service;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;


@Service("mss")
public class MailSendService {

	@Resource(name="mailSender")
    private JavaMailSenderImpl mailSender;
	private int size = 6;

    //인증키 생성
    private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }

    //인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer sb = new StringBuffer();

        while(sb.length() < size) {
        	if(random.nextBoolean()){ // rnd.nextBoolean() 는 랜덤으로 true, false 를 리턴. true일 시 랜덤 한 소문자를, false 일 시 랜덤 한 숫자를 StringBuffer 에 append
                sb.append((char)((int)(random.nextInt(26))+97));
            }else{
            	sb.append(random.nextInt(10));
            }
        }

        return sb.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
        String approvalKey = getKey(6);

        //인증메일 보내기
        MimeMessage mail = mailSender.createMimeMessage();
        String mailContent = "<h1>[HES 가입 인증]</h1><br><p>아래 링크를 클릭하시면 HES 회원가입 이메일 인증이 완료됩니다.</p>"
                            + "<a href='http://localhost:8081/member/signupConfirm.do?email=" 
                            + email + "&approvalKey=" + approvalKey + "' target='_blenk'>이메일 인증 확인</a>";

        try {
            mail.setSubject("HES 회원가입 이메일 인증 ", "utf-8");
            mail.setText(mailContent, "utf-8", "html");
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            mailSender.send(mail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return approvalKey;
    }
}