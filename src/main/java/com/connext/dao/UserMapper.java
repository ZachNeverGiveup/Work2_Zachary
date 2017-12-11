package com.connext.dao;


import com.connext.pojo.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    int insertUser(User u);

    User selectByUserphone(String userphone);

    User selectByUser(User user);
}
