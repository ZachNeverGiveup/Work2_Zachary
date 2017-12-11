package com.connext.pojo;

import java.util.Date;

public class Userlog {
    private Integer logid;

    private String userphone;

    private Integer failtimes;

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