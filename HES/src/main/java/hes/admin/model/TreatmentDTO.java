package hes.admin.model;

public class TreatmentDTO {
	private int treatment_Code; 
	private String treatment_Date;
	private String treatment_Time;
	private String patient_Name;
	private int dep_Code;
	private String doc_Name;
	private String treatment_Detail;
	
	public int getTreatment_Code() {
		return treatment_Code;
	}
	public void setTreatment_Code(int treatment_Code) {
		this.treatment_Code = treatment_Code;
	}
	public String getTreatment_Date() {
		return treatment_Date;
	}
	public void setTreatment_Date(String treatment_Date) {
		this.treatment_Date = treatment_Date;
	}
	public String getTreatment_Time() {
		return treatment_Time;
	}
	public void setTreatment_Time(String treatment_Time) {
		this.treatment_Time = treatment_Time;
	}
	public String getPatient_Name() {
		return patient_Name;
	}
	public void setPatient_Name(String patient_Name) {
		this.patient_Name = patient_Name;
	}
	public int getDep_Code() {
		return dep_Code;
	}
	public void setDep_Code(int dep_Code) {
		this.dep_Code = dep_Code;
	}
	public String getDoc_Name() {
		return doc_Name;
	}
	public void setDoc_Name(String doc_Name) {
		this.doc_Name = doc_Name;
	}
	public String getTreatment_Detail() {
		return treatment_Detail;
	}
	public void setTreatment_Detail(String treatment_Detail) {
		this.treatment_Detail = treatment_Detail;
	}
	
	
	
	
}
