package com.instrument.domain;

public class InstrumentType {
	private Integer instrumenttypeid;

	private String instrumenttypename;

	public Integer getInstrumenttypeid() {
		return instrumenttypeid;
	}

	public void setInstrumenttypeid(Integer instrumenttypeid) {
		this.instrumenttypeid = instrumenttypeid;
	}

	public String getInstrumenttypename() {
		return instrumenttypename;
	}

	public void setInstrumenttypename(String instrumenttypename) {
		this.instrumenttypename = instrumenttypename == null ? null
				: instrumenttypename.trim();
	}
}