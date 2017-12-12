package com.connext.service;

import com.connext.pojo.Article;

import java.util.List;

/**
 * Created by Zach.Zhang on 2017/12/11.
 */
public interface ArticleService {
    //查找所有的文章
    List<Article> selectAllArticles();
    //根据用户id查找所有文章
    List<Article> selectArticlesByUserId(Integer userId);
    //根据文章id查找文章的具体信息
    Article selectArticleByPrimaryKey(Integer id);

    //更新文章
    void updateByPrimaryKeySelective(Article article);

    //插入文章
    void insertArticle(Article article);

    //删除文章
    void deleteArticleById(Integer id);
}
