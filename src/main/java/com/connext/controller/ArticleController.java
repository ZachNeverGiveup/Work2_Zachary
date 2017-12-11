package com.connext.controller;


import com.connext.pojo.Article;
import com.connext.pojo.Comment;
import com.connext.service.ArticleServiceImpl;
import com.connext.service.CommentService;
import com.connext.service.CommentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Zach.Zhang on 2017/12/11.
 * 文章的Controller层
 */
@Controller
public class ArticleController {
    @Autowired
    ArticleServiceImpl articleService;

    @Autowired
    CommentServiceImpl commentService;
    /**
     * 查找所有的文章，返回一个List<Article>到文章列表（即论坛首页）
     * @param request
     * @return
     */
    @RequestMapping("toArticleAll.do")
    public String toArticleAll(HttpServletRequest request){
       List<Article> arts= articleService.selectAllArticles();
        request.setAttribute("arts",arts);
        return "article";
    }
    /**
     * 通过点击文章列表的文章标题，进入此方法，返回文章的具体信息以及评论List
     */
    @RequestMapping("articleDetail.do")
    public String articleDetail (Integer id,HttpServletRequest request){
        Article article=articleService.selectArticleByPrimaryKey(id);
        request.setAttribute("article",article);
        List<Comment> comments=commentService.selectCommentsByArticleId(id);
        request.setAttribute("comments",comments);
        return "articleDetail";
    }
}
