package com.instrument.domain;

public class Information {
  
	private String informationname;

    private String detail;

    public String getInformationname() {
        return informationname;
    }

    public void setInformationname(String informationname) {
        this.informationname = informationname == null ? null : informationname.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }
    @Override
  	public String toString() {
  		return "Information [informationname=" + informationname + ", detail="
  				+ detail + "]";
  	}

}
