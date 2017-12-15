package com.connext.dao;


import com.connext.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 用户的dao层mapper接口
 */
@Repository
public interface UserMapper {
    //插入用户
    int insertUser(User u);
    //根据手机号查询用户
    User selectByUserphone(String userphone);
    //根据用户查用户
    User selectByUser(User user);
    //查出等级小于10的用户
    List<User> selectAllWhereGradeLessTen();
    //根据用户的id更新用户信息
    void updateUserByPrimaryKey(User user);
}
