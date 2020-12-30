package com.ezen709.myhome.model;

public class RoomDTO {
	private int roomNum; 
	private String roomName;
	private int price;
	private int accommodated_number;
	
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
			
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAccommodated_number() {
		return accommodated_number;
	}
	public void setAccommodated_number(int accommodated_number) {
		this.accommodated_number = accommodated_number;
	} 
	
	
}
