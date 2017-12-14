package com.connext.service;

import com.connext.dao.ArticleMapper;
import com.connext.pojo.Article;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    //日志
    private static Logger logger = LoggerFactory.getLogger(ArticleServiceImpl.class);
    /**
     * 查找出所有文章的方法，返回Article类型的List
     *
     * @return
     */
    @Override
    public List<Article> selectAllArticles() {
        return articleMapper.selectAllArticles();
    }

    /**
     * 根据每页显示的数量和当前页来查找文章
     * @param PAGE_SIZE
     * @param pageNow
     * @return
     */
    @Override
    public List<Article> selectArticlesByPage(Integer PAGE_SIZE, Integer pageNow) {
        List<Article> allArticles = articleMapper.selectAllArticles();
        //共有rowCount条记录
        int rowCount = allArticles.size();
        logger.info("共有"+rowCount+"条记录");
        //共有pageCount页(除的尽就是总数除以每页的数，除不尽就+1)
        int pageCount = rowCount%PAGE_SIZE==0?rowCount/PAGE_SIZE:rowCount/PAGE_SIZE+1;
        logger.info("共有"+pageCount+"页");
        //当页的起始记录
        Integer pageStart = PAGE_SIZE*(pageNow-1);
        logger.info("当前的起始记录为第："+pageStart+"条");
        List<Article> articlesSelectedByPage = articleMapper.selectArticlesByPage(pageStart,PAGE_SIZE);

        return articlesSelectedByPage;

    }

    /**
     * 根据用户查文章
     * @param userId
     * @return
     */
    @Override
    public List<Article> selectArticlesByUserId(Integer userId) {
        return articleMapper.selectByUserId(userId);
    }

    /**
     *
     * 根据文章id查文章
     * @param id
     * @return
     */
    @Override
    public Article selectArticleByPrimaryKey(Integer id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    /**
     * 更新文章
     * @param article
     */
    @Override
    public void updateByPrimaryKeySelective(Article article) {
        articleMapper.updateByPrimaryKeySelective(article);
    }

    /**
     * 插入文章
     * @param article
     */
    @Override
    public void insertArticle(Article article) {
        articleMapper.insertSelective(article);
    }

    /**
     * 根据id删除文章
     * @param id
     */
    @Override
    public void deleteArticleById(Integer id) {
        articleMapper.deleteByPrimaryKey(id);
    }
}

