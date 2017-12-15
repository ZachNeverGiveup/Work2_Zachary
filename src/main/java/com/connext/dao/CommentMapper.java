package com.connext.dao;

import com.connext.model.Comment;
import com.connext.model.CommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 评论的持久层接口
 */
@Repository
public interface CommentMapper {
    int countByExample(CommentExample example);

    int deleteByExample(CommentExample example);
    //根据评论id删除评论
    int deleteByPrimaryKey(Integer commentid);
    //根据文章id删除评论
    int deleteByArticleId(Integer commentarticleid);
    //插入评论
    int insert(Comment record);
    //插入评论可为空
    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentExample example);
    //根据评论id查出评论具体信息
    Comment selectByPrimaryKey(Integer commentid);
    //根据文章的id查出所有评论
    List<Comment> selectCommentsByArticleId(Integer articleId);

    int updateByExampleSelective(@Param("record") Comment record, @Param("example") CommentExample example);

    int updateByExample(@Param("record") Comment record, @Param("example") CommentExample example);
    //更新评论
    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}