package com.connext.controller;

import com.connext.pojo.Comment;
import com.connext.service.CommentServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by Zach.Zhang on 2017/12/12.
 * 关于评论的控制层代码
 */
@Controller
public class CommentController {

    @Autowired
    CommentServiceImpl commentService;
    private static Logger logger = LoggerFactory.getLogger(CommentController.class);

    /**
     * 提交评论的方法
     * @param commentcontent
     * @param userid
     * @param articleid
     * @return
     * @throws ParseException
     */
    @RequestMapping("commentSubmit.do")
    public String commentSubmit(String commentcontent,Integer userid,Integer articleid) throws ParseException {
        logger.info(commentcontent+userid+articleid);
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formatDate = dFormat.format(new java.util.Date());
        Comment comment = new Comment();
        comment.setCommentcontent(commentcontent);
        comment.setCommentuserid(userid);
        comment.setCommentarticleid(articleid);
        comment.setCommenttime(dFormat.parse(formatDate));
        commentService.insertSelective(comment);
        return "redirect:articleDetail.do?id="+articleid;
    }
}
