package com.connext.dao;


import com.connext.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    int insertUser(User u);

    User selectByUserphone(String userphone);

    User selectByUser(User user);

    List<User> selectAllWhereGradeLessTen();

    void updateUserByPrimaryKey(User user);
}
