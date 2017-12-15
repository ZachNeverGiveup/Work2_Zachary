package com.connext.service;

import com.connext.model.User;
import com.connext.model.Userlog;

import java.util.List;

/**
 * 用户的service层接口
 */
public interface UserService {
    //注册
    int registUser(User u);
    //根据手机号查用户
    User selectByUserphone(String userphone);
    //根据用户查用户
    User selectByUser(User user);
    //插入允许为空
    int insertSelective(Userlog record);
    //根据手机号跟新输错时间
    int updateAddFailtimesByUserphone(Userlog record);
    //根据手机号重置输错时间
    int updateResetFailtimesByUserphone(String userphone);
    //根据手机号查找用户日志
    Userlog selectUserlogByUserphone(String userphone);
    //查找出所有用户以及会员用户（除了管理员）
    List<User> selectAllUsersExpectAdmin();
    //更新
    void updateUserByPrimaryKey(User user);
}
