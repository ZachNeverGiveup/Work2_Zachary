package com.connext.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
public class CodeImageController {
    // 图片高度
    private static final int IMG_HEIGHT = 100;
    // 图片宽度
    private static final int IMG_WIDTH = 30;
    // 验证码长度
    private static final int CODE_LEN = 4;

    @RequestMapping("getCode.do")
    public void getCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 用于绘制图片，设置图片的长宽和图片类型（RGB)
        BufferedImage bi = new BufferedImage(IMG_HEIGHT, IMG_WIDTH, BufferedImage.TYPE_INT_RGB);
        // 获取绘图工具
        Graphics graphics = bi.getGraphics();
        graphics.setColor(new Color(100, 230, 200)); // 使用RGB设置背景颜色
        graphics.fillRect(0, 0, 100, 30); // 填充矩形区域

        // 验证码中所使用到的字符
        char[] codeChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456".toCharArray();
        String captcha = ""; // 存放生成的验证码
        Random random = new Random();
        for (int i = 0; i < CODE_LEN; i++) { // 循环将每个验证码字符绘制到图片上
            int index = random.nextInt(codeChar.length);
            // 随机生成验证码颜色
            graphics.setColor(new Color(random.nextInt(150), random.nextInt(200), random.nextInt(255)));
            // 将一个字符绘制到图片上，并制定位置（设置x,y坐标）
            graphics.drawString(codeChar[index] + "", (i * 20) + 15, 20);
            captcha += codeChar[index];
        }
        // 将生成的验证码code放入sessoin中
        req.getSession().setAttribute("imgcode", captcha);
        // 通过ImageIO将图片输出
        ImageIO.write(bi, "JPG", resp.getOutputStream());
    }

    @RequestMapping("imagecodeCheck.do")
    @ResponseBody
    public void phonecodeCheck(String imagecode, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("正在判断图形验证码是否正确…………");
        String imgcode = (String) request.getSession().getAttribute("imgcode");
        if (imagecode.toLowerCase().equals(imgcode.toLowerCase())) {
            System.out.println("图形验证码正确");
            response.getWriter().write("true");
        } else {
            System.out.println("图形验证码错误");
            response.getWriter().write("false");
        }
        System.out.println("验证码检测完成…………");
    }
}
