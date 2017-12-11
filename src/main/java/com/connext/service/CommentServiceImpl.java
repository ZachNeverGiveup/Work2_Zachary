package com.connext.service;

import com.connext.dao.CommentMapper;
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
    @Override
    public List<Comment> selectCommentsByArticleId(Integer articleId) {
        return commentMapper.selectCommentsByArticleId(articleId);
    }
}
