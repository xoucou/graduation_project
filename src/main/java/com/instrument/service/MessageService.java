package com.instrument.service;

import java.util.List;

import com.instrument.domain.Message;

public interface MessageService {
	
	public void sendMessage(String proposer, String email, String message);
	
	List<Message> getMessage();
	
	public void delMessage(int id);
}
