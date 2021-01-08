package hes.admin.model;

public class ReservationDTO {
	private int reservation_Code; 
	private String reservation_Date;
	private String treatment_Date;
	private String treatment_Time;
	private String patient_Name;
	private int dep_Code;
	private String doc_Name;
	private String reservation_Detail;
	private String reservation_Progress;
	
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
	public int getReservation_Code() {
		return reservation_Code;
	}
	public void setReservation_Code(int reservation_Code) {
		this.reservation_Code = reservation_Code;
	}
	public String getReservation_Date() {
		return reservation_Date;
	}
	public void setReservation_Date(String reservation_Date) {
		this.reservation_Date = reservation_Date;
	}
	public String getReservation_Detail() {
		return reservation_Detail;
	}
	public void setReservation_Detail(String reservation_Detail) {
		this.reservation_Detail = reservation_Detail;
	}
	public String getReservation_Progress() {
		return reservation_Progress;
	}
	public void setReservation_Progress(String reservation_Progress) {
		this.reservation_Progress = reservation_Progress;
	}
	
}
