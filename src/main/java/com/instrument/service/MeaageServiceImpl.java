package com.instrument.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.instrument.dao.MessageDAO;
import com.instrument.domain.Message;

@Service("messageService")
public class MeaageServiceImpl implements MessageService {
	
	@Resource(name = "messageDAO")
	private MessageDAO md;
	
	
	@Override
	public void sendMessage(String proposer, String email, String message) {
		
		SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		
		String date = fmt.format(time);
		
		Message sendMessage = new Message();
		
		sendMessage.setDate(date);
		sendMessage.setEmail(email);
		sendMessage.setMessage(message);
		sendMessage.setProposer(proposer);
		
		md.insertSelective(sendMessage);

	}

	@Override
	public List<Message> getMessage() {
		
		List<Message> list = md.getMessage();
		
		return list;
	}

	@Override
	public void delMessage(int id) {
		md.deleteByPrimaryKey(id);
	}

}
