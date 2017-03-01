package com.instrument.domain;

public class Message {
	 	private Integer id;

	    private String proposer;

	    private String email;

	    private String message;

	    private String date;

	    public Integer getId() {
	        return id;
	    }

	    public void setId(Integer id) {
	        this.id = id;
	    }

	    public String getProposer() {
	        return proposer;
	    }

	    public void setProposer(String proposer) {
	        this.proposer = proposer == null ? null : proposer.trim();
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email == null ? null : email.trim();
	    }

	    public String getMessage() {
	        return message;
	    }

	    public void setMessage(String message) {
	        this.message = message == null ? null : message.trim();
	    }

	    public String getDate() {
	        return date;
	    }

	    public void setDate(String date) {
	        this.date = date == null ? null : date.trim();
	    }
}