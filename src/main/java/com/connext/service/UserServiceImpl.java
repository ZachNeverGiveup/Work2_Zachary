package com.connext.service;

import com.connext.dao.UserMapper;
import com.connext.dao.UserlogMapper;
import com.connext.pojo.User;
import com.connext.pojo.Userlog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Autowired
    UserlogMapper userlogMapper;

    @Override
    public int registUser(User u) {
        int i = userMapper.insertUser(u);
        return i;
    }

    @Override
    public User selectByUserphone(String userphone) {
        return userMapper.selectByUserphone(userphone);
    }

    @Override
    public User selectByUser(User user) {
        return userMapper.selectByUser(user);
    }

    @Override
    public int insertSelective(Userlog record) {
        userlogMapper.insertSelective(record);
        return 0;
    }

    @Override
    public int updateAddFailtimesByUserphone(Userlog record) {
        userlogMapper.updateAddFailtimesByUserphone(record);
        return 0;
    }

    @Override
    public int updateResetFailtimesByUserphone(String userphone) {
        userlogMapper.updateResetFailtimesByUserphone(userphone);
        return 0;
    }

    @Override
    public Userlog selectUserlogByUserphone(String userphone) {
        return userlogMapper.selectByUserphone(userphone);
    }

}
