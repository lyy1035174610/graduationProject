package com.liyingyu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created by YingyuLi on 2017/5/18.
 */
@Controller
public class AdminController {
    @RequestMapping("/adminLogin")
    public ModelAndView adminLogin(){
        return new ModelAndView("adminLogin");
    }
    @RequestMapping("/adminMain")
    public ModelAndView adminMain(){
        return new ModelAndView("adminMain");
    }
    @RequestMapping("/adminLeft")
    public ModelAndView adminLeft(){
        return new ModelAndView("adminLeft");
    }
//    @RequestMapping("/adminCenter")
//    public ModelAndView adminCenter(){
//        return new ModelAndView("adminCenter");
//    }

    @RequestMapping("/adminCheck")
    public String adminLogin(@RequestParam("u_name") String u_name, @RequestParam("u_password") String u_password, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
//        StringBuffer s = new StringBuffer();
//        try  {
//            BufferedReader br = new BufferedReader(new FileReader("D:\\code\\github\\graduationProject\\web\\WEB-INF\\admin.txt"));
//            s.append(br.readLine());
//            String[] str = s.toString().split("=");
//            String userName = str[0];
//            String password = str[1];
//            if(userName != u_name || password != u_password){
//                request.setAttribute("err","账号或密码有误！");
//                return new ModelAndView("adminLogin");
//            }
//        }catch (IOException e){
//            request.setAttribute("err","账号或密码有误！");
//            return new ModelAndView("adminLogin");
//        }
        request.setCharacterEncoding("gbk");
        return "redirect:D:\\code\\github\\graduationProject\\web\\file\\main.html";
    }

}
