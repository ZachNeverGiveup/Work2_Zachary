package com.connext.service;

import com.connext.pojo.Article;

import java.util.List;

/**
 * Created by Zach.Zhang on 2017/12/11.
 */
public interface ArticleService {
    List<Article> selectAllArticles();

    Article selectArticleByPrimaryKey(Integer id);
}
