package com.connext.model;

import java.util.Date;
/**
 * 用户日志的model层属性和getter/setter方法
 */
public class Userlog {
    //用户日志主键id
    private Integer logid;
    //用户手机号
    private String userphone;
    //密码输入失败次数
    private Integer failtimes;
    //上次密码输错时间
    private Date lastfailtime;

    public Integer getLogid() {
        return logid;
    }

    public void setLogid(Integer logid) {
        this.logid = logid;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone == null ? null : userphone.trim();
    }

    public Integer getFailtimes() {
        return failtimes;
    }

    public void setFailtimes(Integer failtimes) {
        this.failtimes = failtimes;
    }

    public Date getLastfailtime() {
        return lastfailtime;
    }

    public void setLastfailtime(Date lastfailtime) {
        this.lastfailtime = lastfailtime;
    }
}