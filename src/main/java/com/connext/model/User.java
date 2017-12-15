package com.connext.model;

/**
 * 用户的model层属性和getter/setter方法
 * Created by Zach.Zhang on 2017/12/11.
 */
public class User {
    //用户的主键id
    private Integer userid;
    //用户名
    private String username;
    //用户手机号
    private String userphone;
    //用户密码
    private String userpassword;
    //用户等级
    private Integer usergrade;

    public Integer getUserid() {
        return userid;
    }

    public String getUsername() {
        return username;
    }

    public String getUserphone() {
        return userphone;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public Integer getUsergrade() {
        return usergrade;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public void setUsergrade(Integer usergrade) {
        this.usergrade = usergrade;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", userphone='" + userphone + '\'' +
                ", userpassword='" + userpassword + '\'' +
                ", usergrade=" + usergrade +
                '}';
    }
}
