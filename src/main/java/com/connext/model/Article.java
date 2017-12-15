package com.connext.model;

import java.util.Date;
/**
 * 文章的model层属性和getter/setter方法
 */
public class Article {
    //文章主键id
    private Integer articleid;
    //文章标题
    private String articletitle;
    //文章内容
    private String articlecontent;
    //文章的添加时间
    private Date articleaddtime;
    //文章的用户id
    private Integer articleuserid;
    //文章的评论数量
    private Integer articlecommentnum;
    //文章的最后评论时间
    private Date articlelastcommenttime;
    //文章所属的用户信息
    private User user;

    public Integer getArticleid() {
        return articleid;
    }

    public void setArticleid(Integer articleid) {
        this.articleid = articleid;
    }

    public String getArticletitle() {
        return articletitle;
    }

    public void setArticletitle(String articletitle) {
        this.articletitle = articletitle == null ? null : articletitle.trim();
    }

    public String getArticlecontent() {
        return articlecontent;
    }

    public void setArticlecontent(String articlecontent) {
        this.articlecontent = articlecontent == null ? null : articlecontent.trim();
    }

    public Date getArticleaddtime() {
        return articleaddtime;
    }

    public void setArticleaddtime(Date articleaddtime) {
        this.articleaddtime = articleaddtime;
    }

    public Integer getArticleuserid() {
        return articleuserid;
    }

    public void setArticleuserid(Integer articleuserid) {
        this.articleuserid = articleuserid;
    }

    public Integer getArticlecommentnum() {
        return articlecommentnum;
    }

    public void setArticlecommentnum(Integer articlecommentnum) {
        this.articlecommentnum = articlecommentnum;
    }

    public Date getArticlelastcommenttime() {
        return articlelastcommenttime;
    }

    public void setArticlelastcommenttime(Date articlelastcommenttime) {
        this.articlelastcommenttime = articlelastcommenttime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Article{" +
                "articleid=" + articleid +
                ", articletitle='" + articletitle + '\'' +
                ", articlecontent='" + articlecontent + '\'' +
                ", articleaddtime=" + articleaddtime +
                ", articleuserid=" + articleuserid +
                ", articlecommentnum=" + articlecommentnum +
                ", articlelastcommenttime=" + articlelastcommenttime +
                ", user=" + user +
                '}';
    }
}