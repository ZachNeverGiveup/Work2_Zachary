package com.connext.service;

import com.connext.dao.ArticleMapper;
import com.connext.dao.CommentMapper;
import com.connext.pojo.Article;
import com.connext.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zach.Zhang on 2017/12/11.
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private ArticleMapper articleMapper;
    @Override
    public List<Comment> selectCommentsByArticleId(Integer articleId) {
        return commentMapper.selectCommentsByArticleId(articleId);
    }

    /**
     * 传入一个comment的对象将其插入数据库中
     * 然后还要把这篇文章的评论数加一
     * 然后还要把这篇文章的最后评论时间更新为这个评论的时间
     * @param record
     */
    @Override
    public void insertSelective(Comment record) {
        commentMapper.insertSelective(record);
        //以下将这篇文章的评论数加一以及最后评论时间更新为这个评论的时间
        //先根据文章id取出数据库里的文章信息
        Article articleOld = articleMapper.selectByPrimaryKey(record.getCommentarticleid());
        Article articleNew = new Article();
        articleNew.setArticleid(record.getCommentarticleid());
        //评论数+1
        articleNew.setArticlecommentnum(articleOld.getArticlecommentnum()+1);
        //最后评论时间更新
        articleNew.setArticlelastcommenttime(record.getCommenttime());
        //调用dao层的方法将其更新
        articleMapper.updateByPrimaryKeySelective(articleNew);
    }
}
