package hes.common;

public class MemberDTO {
	
	private String patient_code;
	private String patient_call;
	private String patient_id;
	private String patient_email;
	private String patient_passwd;
	private String patient_name;
	private String patient_adderss;
	private boolean enabled;
	private String approval_key;
	private String status;
	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApproval_key() {
		return approval_key;
	}

	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}

	public String getPatient_code() {
		return patient_code;
	}

	public void setPatient_code(String patient_code) {
		this.patient_code = patient_code;
	}

	public String getPatient_call() {
		return patient_call;
	}

	public void setPatient_call(String patient_call) {
		this.patient_call = patient_call;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setUsername(String patient_id) {
		this.patient_id = patient_id;
	}

	public void setpasswd(String patient_passwd) {
		this.patient_passwd = patient_passwd;
	}
	
	public String getPatient_id() {
		return patient_id;
	}
	public void setPatient_id(String patient_id) {
		this.patient_id = patient_id;
	}
	public String getPatient_email() {
		return patient_email;
	}
	public void setPatient_email(String patient_email) {
		this.patient_email = patient_email;
	}
	public String getPatient_passwd() {
		return patient_passwd;
	}
	public void setPatient_passwd(String patient_passwd) {
		this.patient_passwd = patient_passwd;
	}
	public String getPatient_name() {
		return patient_name;
	}
	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}
	public String getPatient_adderss() {
		return patient_adderss;
	}
	public void setPatient_adderss(String patient_adderss) {
		this.patient_adderss = patient_adderss;
	}

}
