package com.ezen.auction.dto;

public class MypageCriteria  extends Criteria {

	private String aucId;
	private String cstmId;
	
	public String getAucId() {
		return aucId;
	}
	
	public void setAucId(String aucId) {
		this.aucId = aucId;
	}

	public String getCstmId() {
		return cstmId;
	}

	public void setCstmId(String cstmId) {
		this.cstmId = cstmId;
	}

	@Override
	public String toString() {
		return "MypageCriteria [aucId=" + aucId + ", cstmId=" + cstmId + "]";
	}


	
}
