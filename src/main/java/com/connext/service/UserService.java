package com.connext.service;

import com.connext.pojo.User;
import com.connext.pojo.Userlog;

import java.util.List;

public interface UserService {
    int registUser(User u);

    User selectByUserphone(String userphone);

    User selectByUser(User user);

    int insertSelective(Userlog record);

    int updateAddFailtimesByUserphone(Userlog record);

    int updateResetFailtimesByUserphone(String userphone);

    Userlog selectUserlogByUserphone(String userphone);

    List<User> selectAllUsersExpectAdmin();

    void updateUserByPrimaryKey(User user);
}
