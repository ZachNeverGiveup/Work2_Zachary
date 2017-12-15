package com.connext.model;
/**
 * 管理员的model层属性和getter/setter方法
 */
public class Admin {
    //管理员主键id
    private Integer adminid;
    //管理员名
    private String adminname;
    //管理员手机号
    private String adminphone;
    //管理员密码
    private String adminpassword;
    //管理员等级
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