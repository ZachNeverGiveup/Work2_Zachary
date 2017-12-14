package com.connext.service;

import com.connext.pojo.Comment;

import java.util.List;

/**
 * Created by Zach.Zhang on 2017/12/11.
 */
public interface CommentService {
    /**
     * 根据文章id查出所有的评论
     * @param articleId
     * @return
     */
    List<Comment> selectCommentsByArticleId(Integer articleId);

    /**
     * 添加评论
     * @param record
     */
    void insertSelective(Comment record);

    /**
     * 根据id删除评论
     * @param commentid
     */
    void deleteByPrimaryKey(Integer commentid);
}
