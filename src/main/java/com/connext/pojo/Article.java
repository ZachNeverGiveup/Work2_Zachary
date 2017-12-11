package com.connext.pojo;

import java.util.Date;
import java.util.List;

public class Article {
    private Integer articleid;

    private String articletitle;

    private String articlecontent;

    private Date articleaddtime;

    private Integer articleuserid;

    private Integer articlecommentnum;

    private Date articlelastcommenttime;

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