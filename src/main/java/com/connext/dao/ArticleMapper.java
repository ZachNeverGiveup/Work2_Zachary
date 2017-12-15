package com.connext.dao;

import com.connext.model.Article;
import com.connext.model.ArticleExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * 文章的dao层mapper接口
 */
@Repository
public interface ArticleMapper {
    int countByExample(ArticleExample example);

    int deleteByExample(ArticleExample example);
    //根据主键删除文章
    int deleteByPrimaryKey(Integer articleid);
    //根据记录插入文章
    int insert(Article record);
    //插入可以为空
    int insertSelective(Article record);

    List<Article> selectByExample(ArticleExample example);
    //查找所有的文章记录
    List<Article> selectAllArticles();
    //根据当前页的起始记录id和每页显示的数量查询出所有的文章
    List<Article> selectArticlesByPage(@Param("pageStart") Integer pageStart,@Param("pageSize") Integer PageSize);
    //根据用户id查询出所有的文章
    List<Article> selectByUserId(Integer articleuserid);
    //根据文章id查出文章的具体信息
    Article selectByPrimaryKey(Integer articleid);

    int updateByExampleSelective(@Param("record") Article record, @Param("example") ArticleExample example);

    int updateByExample(@Param("record") Article record, @Param("example") ArticleExample example);
    //根据主键更新文章
    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKey(Article record);


}