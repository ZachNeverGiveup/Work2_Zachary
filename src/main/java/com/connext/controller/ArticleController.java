package com.connext.controller;


import com.connext.pojo.Article;
import com.connext.pojo.Comment;
import com.connext.pojo.User;
import com.connext.service.ArticleServiceImpl;
import com.connext.service.CommentService;
import com.connext.service.CommentServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

    //日志记录
    private static Logger logger = LoggerFactory.getLogger(ArticleController.class);
    //传进来的文章ID乘以这个数，再除以这个数
    private Integer ARTICLE_ID_CHANGE_NUMBER = 271343;
    //文章分页，每页显示的数量
    private Integer PAGE_SIZE = 10;

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
     * 根据每页显示的数量和当前页来查找文章，返回一个List<Article>到文章列表
     * @param request
     * @return
     */
    @RequestMapping("toArticleCenter.do")
    public String toArticleByPage(HttpServletRequest request,Integer pageNow){
        List<Article> arts= articleService.selectArticlesByPage(PAGE_SIZE,pageNow);
        int rowCount=articleService.selectAllArticles().size();
        int pageCount = rowCount%PAGE_SIZE==0?rowCount/PAGE_SIZE:rowCount/PAGE_SIZE+1;
        request.setAttribute("arts",arts);
        request.setAttribute("pageNow",pageNow);
        request.setAttribute("rowCount",rowCount);
        request.setAttribute("pageCount",pageCount);
        return "article";
    }
    /**
     * 根据session里的用户Id来查找出所有该用户发表过的文章，然后返回到JSP页面
     */
    @RequestMapping("toArticleByUserId.do")
    public String toArticleByUserId(HttpServletRequest request,HttpSession session){
        User userFromSession= (User) session.getAttribute("user");
        List<Article> articles=articleService.selectArticlesByUserId(userFromSession.getUserid());
        request.setAttribute("articles",articles);
        return "personalCenter";
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

    /**
     * 根据文章的ID获取文章的具体信息，然后将文章的具体信息放到request域中，返回编辑页面
     * @param request
     * @param articleid
     * @return
     */
    @RequestMapping("toEditArticle.do")
    public String toEditArticle(HttpServletRequest request,Integer articleid){
        logger.info("传进来的articleid是："+articleid);
        Integer articleIdAfter = articleid/ARTICLE_ID_CHANGE_NUMBER;
        logger.info("改变之后的articleid是："+articleIdAfter);
        Article article=articleService.selectArticleByPrimaryKey(articleIdAfter);
        request.setAttribute("article",article);
        return "articleEdit";
    }
    /**
     * updateArticle.do
     */
    @RequestMapping("updateArticle.do")
    public String updateArticle(Article article) throws ParseException {
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formatDate = dFormat.format(new java.util.Date());
        article.setArticleaddtime(dFormat.parse(formatDate));
        logger.info(article.toString());
        articleService.updateByPrimaryKeySelective(article);
        return "redirect:toArticleByUserId.do";
    }

    /**
     * 跳转至新增文章界面的方法
     * @return
     */
    @RequestMapping("toAddArticle.do")
    public String toAddArticle(){
       logger.info("正在前往新增文章界面……");
        return "articleAdd";
    }
    /**
     * addArticle.do
     */
    @RequestMapping("addArticle.do")
    public String addArticle(Article article,HttpSession session) throws ParseException {
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formatDate = dFormat.format(new java.util.Date());
        article.setArticleaddtime(dFormat.parse(formatDate));
        article.setArticlelastcommenttime(dFormat.parse(formatDate));
        User user = (User) session.getAttribute("user");
        article.setArticleuserid(user.getUserid());
        logger.info("即将插入数据库的文章信息为："+article);
        articleService.insertArticle(article);
        return "redirect:toArticleByUserId.do";
    }

    /**
     * 删除文章
     * @return
     */
    @RequestMapping("articleDel.do")
    @ResponseBody
    public void articleDel(Integer articleid){
        articleService.deleteArticleById(articleid);
    }
}
