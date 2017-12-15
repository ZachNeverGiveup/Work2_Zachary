package com.connext.model;

import java.util.Date;
/**
 * 评论的model层属性和getter/setter方法
 */
public class Comment {
    //评论主键id
    private Integer commentid;
    //评论内容
    private String commentcontent;
    //评论的用户id
    private Integer commentuserid;
    //评论的文章id
    private Integer commentarticleid;
    //评论的时间
    private Date commenttime;
    //评论所属的用户信息
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