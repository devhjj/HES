package hes.admin.model;

public class TreatmentDTO {
	private int treatment_Code; 
	private int doc_Code;
	private int patient_Code; 
	private String treatment_detail; 
	private String treatment_date;
	
	public int getTreatment_Code() {
		return treatment_Code;
	}
	public void setTreatment_Code(int treatment_Code) {
		this.treatment_Code = treatment_Code;
	}
	public int getDoc_Code() {
		return doc_Code;
	}
	public void setDoc_Code(int doc_Code) {
		this.doc_Code = doc_Code;
	}
	public int getPatient_Code() {
		return patient_Code;
	}
	public void setPatient_Code(int patient_Code) {
		this.patient_Code = patient_Code;
	}
	public String getTreatment_detail() {
		return treatment_detail;
	}
	public void setTreatment_detail(String treatment_detail) {
		this.treatment_detail = treatment_detail;
	}
	public String getTreatment_date() {
		return treatment_date;
	}
	public void setTreatment_date(String treatment_date) {
		this.treatment_date = treatment_date;
	} 
	
	
}
