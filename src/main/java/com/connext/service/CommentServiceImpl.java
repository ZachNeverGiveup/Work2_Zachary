package com.connext.service;

import com.connext.dao.ArticleMapper;
import com.connext.dao.CommentMapper;
import com.connext.pojo.Article;
import com.connext.pojo.Comment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    //日志记录
    private static Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);

    /**
     * 根据文章id查所有的评论
     * 按时间排序
     * @param articleId
     * @return
     */
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

    /**
     *
     * 先把这篇文章的评论数减一（此处不能先把评论删了，否则会报NPE）
     * 然后再删除评论的方法
     * @param commentid
     */
    @Override
    public void deleteByPrimaryKey(Integer commentid) {

        //1 根据这个commentid找出这个文章的信息
        Comment comment = commentMapper.selectByPrimaryKey(commentid);
        logger.info("comment的文章id："+comment.getCommentarticleid());
        Article article = articleMapper.selectByPrimaryKey(comment.getCommentarticleid());
        //2 将这个文章的评论数减一
        article.setArticlecommentnum(article.getArticlecommentnum()-1);
        //3 更新文章信息
        articleMapper.updateByPrimaryKeySelective(article);
        //4 删除这个评论
        commentMapper.deleteByPrimaryKey(commentid);
    }
}
