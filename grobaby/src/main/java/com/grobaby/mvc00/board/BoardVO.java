package com.grobaby.mvc00.board;

import java.util.Date;

public class BoardVO {
	
	private Integer BCODE;
	private String BTITLE;
	private String BCONTENT;
	private Date BDATE;
	private String MID;
	
	
	public Integer getBCODE() {
		return BCODE;
	}
	public void setBCODE(Integer bCODE) {
		BCODE = bCODE;
	}
	public String getBTITLE() {
		return BTITLE;
	}
	public void setBTITLE(String bTITLE) {
		BTITLE = bTITLE;
	}
	public String getBCONTENT() {
		return BCONTENT;
	}
	public void setBCONTENT(String bCONTENT) {
		BCONTENT = bCONTENT;
	}
	public Date getBDATE() {
		return BDATE;
	}
	public void setBDATE(Date bDATE) {
		BDATE = bDATE;
	}
	public String getMID() {
		return MID;
	}
	public void setMID(String mID) {
		MID = mID;
	}
	
	
	

}
