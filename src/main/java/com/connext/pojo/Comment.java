package com.connext.pojo;

import java.util.Date;

public class Comment {
    private Integer commentid;

    private String commentcontent;

    private Integer commentuserid;

    private Integer commentarticleid;

    private Date commenttime;

    private User user;

    public Integer getCommentid() {
        return commentid;
    }

    public void setCommentid(Integer commentid) {
        this.commentid = commentid;
    }

    public String getCommentcontent() {
        return commentcontent;
    }

    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent == null ? null : commentcontent.trim();
    }

    public Integer getCommentuserid() {
        return commentuserid;
    }

    public void setCommentuserid(Integer commentuserid) {
        this.commentuserid = commentuserid;
    }

    public Integer getCommentarticleid() {
        return commentarticleid;
    }

    public void setCommentarticleid(Integer commentarticleid) {
        this.commentarticleid = commentarticleid;
    }

    public Date getCommenttime() {
        return commenttime;
    }

    public void setCommenttime(Date commenttime) {
        this.commenttime = commenttime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentid=" + commentid +
                ", commentcontent='" + commentcontent + '\'' +
                ", commentuserid=" + commentuserid +
                ", commentarticleid=" + commentarticleid +
                ", commenttime=" + commenttime +
                ", user=" + user +
                '}';
    }
}