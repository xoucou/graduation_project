package com.instrument.dao;

import java.util.List;

import com.instrument.domain.Message;

public interface MessageDAO {
    int insert(Message record);
   
    List<Message> getMessage();
    
    int delMessage(String email);
    
    int deleteByPrimaryKey(int proposer);

    int insertSelective(Message record);

    Message selectByPrimaryKey(String proposer);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);

}