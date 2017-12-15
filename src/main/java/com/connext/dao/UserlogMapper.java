package com.connext.dao;

import com.connext.model.Userlog;
import com.connext.model.UserlogExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户登录日志Dao层
 *
 */
@Repository
public interface UserlogMapper {
    int countByExample(UserlogExample example);

    int deleteByExample(UserlogExample example);

    int deleteByPrimaryKey(Integer logid);
    //插入记录
    int insert(Userlog record);

    int insertSelective(Userlog record);

    List<Userlog> selectByExample(UserlogExample example);
    //根据主键查用户记录
    Userlog selectByPrimaryKey(Integer logid);
    //根据用户手机号查用户日志
    Userlog selectByUserphone(String userphone);

    int updateByExampleSelective(@Param("record") Userlog record, @Param("example") UserlogExample example);

    int updateByExample(@Param("record") Userlog record, @Param("example") UserlogExample example);

    int updateByPrimaryKeySelective(Userlog record);
    //更新
    int updateByPrimaryKey(Userlog record);
    //更新输错时间
    int updateAddFailtimesByUserphone(Userlog record);
    //重置输错时间
    int updateResetFailtimesByUserphone(String userphone);
}