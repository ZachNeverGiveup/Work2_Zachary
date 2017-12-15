package com.connext.service.impl;

import com.connext.dao.UserMapper;
import com.connext.dao.UserlogMapper;
import com.connext.model.User;
import com.connext.model.Userlog;
import com.connext.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户的service实现类
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Autowired
    UserlogMapper userlogMapper;
    //注册
    @Override
    public int registUser(User u) {
        int i = userMapper.insertUser(u);
        return i;
    }
    //根据手机号查
    @Override
    public User selectByUserphone(String userphone) {
        return userMapper.selectByUserphone(userphone);
    }
    //查用户
    @Override
    public User selectByUser(User user) {
        return userMapper.selectByUser(user);
    }
    //插入用户
    @Override
    public int insertSelective(Userlog record) {
        userlogMapper.insertSelective(record);
        return 0;
    }
    //更新输错时间
    @Override
    public int updateAddFailtimesByUserphone(Userlog record) {
        userlogMapper.updateAddFailtimesByUserphone(record);
        return 0;
    }
    //重置输错时间
    @Override
    public int updateResetFailtimesByUserphone(String userphone) {
        userlogMapper.updateResetFailtimesByUserphone(userphone);
        return 0;
    }
    //根据手机号查找用户日志
    @Override
    public Userlog selectUserlogByUserphone(String userphone) {
        return userlogMapper.selectByUserphone(userphone);
    }
    //查找所有的用户除了管理员
    @Override
    public List<User> selectAllUsersExpectAdmin() {
        return userMapper.selectAllWhereGradeLessTen();
    }
    //更新用户
    @Override
    public void updateUserByPrimaryKey(User user) {
        userMapper.updateUserByPrimaryKey(user);
    }

}
