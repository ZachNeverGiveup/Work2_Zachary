package com.connext.service;

import com.connext.pojo.Comment;

import java.util.List;

/**
 * Created by Zach.Zhang on 2017/12/11.
 */
public interface CommentService {
    List<Comment> selectCommentsByArticleId(Integer articleId);
    void insertSelective(Comment record);
}
