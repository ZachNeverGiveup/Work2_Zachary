package com.connext.service;

import com.connext.dao.ArticleMapper;
import com.connext.pojo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Zach.Zhang on 2017/12/11.
 * 文章的Service层
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    /**
     * 查找出所有文章的方法，返回Article类型的List
     *
     * @return
     */
    @Override
    public List<Article> selectAllArticles() {
        return articleMapper.selectAllArticles();
    }

    @Override
    public List<Article> selectArticlesByUserId(Integer userId) {
        return articleMapper.selectByUserId(userId);
    }

    @Override
    public Article selectArticleByPrimaryKey(Integer id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKeySelective(Article article) {
        articleMapper.updateByPrimaryKeySelective(article);
    }

    @Override
    public void insertArticle(Article article) {
        articleMapper.insertSelective(article);
    }

    @Override
    public void deleteArticleById(Integer id) {
        articleMapper.deleteByPrimaryKey(id);
    }
}

