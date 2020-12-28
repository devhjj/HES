package com.ezen709.myhome.model;

public class HospitalizationDTO {
	private int hplCode;
	private int patient_Code;
	private int roomNum;
	private String leaveDate;
	private String joinDate;
	
	public int getHplCode() {
		return hplCode;
	}
	public void setHplCode(int hplCode) {
		this.hplCode = hplCode;
	}
	public int getPatient_Code() {
		return patient_Code;
	}
	public void setPatient_Code(int patient_Code) {
		this.patient_Code = patient_Code;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
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
