package com.ezen.auction.dto;

public class MypageCriteria  extends Criteria {

	private String aucId;
	private String aucNick;
	private String cstmId;
	
	public String getAucId() {
		return aucId;
	}
	
	public void setAucId(String aucId) {
		this.aucId = aucId;
	}

	public String getAucNick() {
		return aucNick;
	}

	public void setAucNick(String aucNick) {
		this.aucNick = aucNick;
	}

	public String getCstmId() {
		return cstmId;
	}

	public void setCstmId(String cstmId) {
		this.cstmId = cstmId;
	}

	@Override
	public String toString() {
		return "MypageCriteria [aucId=" + aucId + ", aucNick=" + aucNick + ", cstmId=" + cstmId + "]";
	}
	
}
