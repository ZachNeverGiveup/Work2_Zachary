package com.connext.pojo;

public class Admin {
    private Integer adminid;

    private String adminname;

    private String adminphone;

    private String adminpassword;

    private Integer admingrade;

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname == null ? null : adminname.trim();
    }

    public String getAdminphone() {
        return adminphone;
    }

    public void setAdminphone(String adminphone) {
        this.adminphone = adminphone == null ? null : adminphone.trim();
    }

    public String getAdminpassword() {
        return adminpassword;
    }

    public void setAdminpassword(String adminpassword) {
        this.adminpassword = adminpassword == null ? null : adminpassword.trim();
    }

    public Integer getAdmingrade() {
        return admingrade;
    }

    public void setAdmingrade(Integer admingrade) {
        this.admingrade = admingrade;
    }
}