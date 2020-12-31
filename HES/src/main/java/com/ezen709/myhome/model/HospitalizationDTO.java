package com.ezen709.myhome.model;

public class HospitalizationDTO {
	private int hplCode;
	private String patient_Name;
	private String roomName;
	private String leaveDate;
	private String joinDate;
	
	public int getHplCode() {
		return hplCode;
	}
	public void setHplCode(int hplCode) {
		this.hplCode = hplCode;
	}
	public String getPatient_Name() {
		return patient_Name;
	}
	public void setPatient_Name(String patient_Name) {
		this.patient_Name = patient_Name;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(String leaveDate) {
		this.leaveDate = leaveDate;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	
}
