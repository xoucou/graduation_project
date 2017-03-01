package com.instrument.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.instrument.domain.User;

public interface UserDAO {
    int deleteByPrimaryKey(String username);

    void insert(@Param("username")String username, @Param("password")String password);

    int insertSelective(User record);
    
    User selectByPrimaryKey(String username);

    void updateByPrimaryKeySelective(@Param("username")String username, @Param("password")String newpass);

    int updateByPrimaryKey(User record);
    //获取所有账号
    ArrayList<User> getAll();
}