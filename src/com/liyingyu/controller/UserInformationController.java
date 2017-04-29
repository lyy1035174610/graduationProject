package com.liyingyu.controller;

import com.liyingyu.bean.JdbcUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

/**
 * Created by YingyuLi on 2017/3/28.
 */
@Controller
public class UserInformationController {
    @RequestMapping("/userInformation")
    public ModelAndView login(@RequestParam("u_name") String u_name, HttpServletRequest request){
        ModelAndView model = new ModelAndView("userInformation");
        Connection conn = null;
        String sql=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        LinkedList<String> list = null;
        try {
             conn = JdbcUtils.getConnection();
            sql = "select u_name,u_sex,u_age,u_email,u_phone,u_description from user where u_name='"+u_name+"'";
             pstmt = conn.prepareStatement(sql);
             rs = pstmt.executeQuery();
            while(rs.next()){
                request.setAttribute("u_name",u_name);
                request.setAttribute("u_sex",rs.getString("u_sex"));
                request.setAttribute("u_age",rs.getString("u_age"));
                request.setAttribute("u_email",rs.getString("u_email"));
                request.setAttribute("u_phone",rs.getString("u_phone"));
                request.setAttribute("u_description",rs.getString("u_description"));
            }
            System.out.println(request.getAttribute("u_name")+" "+request.getAttribute("u_sex"));
            String name,record_time,comment;
            StringBuffer line;
            list = new LinkedList<>();
            sql = "select * from user_record where u_name='"+u_name+"'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                name = rs.getString("u_name");
                comment = rs.getString("record_comment");
                record_time = rs.getString("record_time");
                line = new StringBuffer(name+":"+comment+"   "+record_time);
                list.add(line.toString());
            }
            request.setAttribute("list",list);
        } catch (SQLException e) {
            e.printStackTrace();
            return new ModelAndView("login2");
        }finally {
            JdbcUtils.free(conn,pstmt,rs);
        }
        return model;
    }

    @RequestMapping("/alterUserInformation")
    public ModelAndView alterUserInformation(@RequestParam("u_name") String u_name,HttpServletRequest request){
        return new ModelAndView("/alterUserInformation","u_name",u_name);
    }

    @RequestMapping("/saveChange")
    public ModelAndView saveChange( HttpServletRequest request){
        String u_name = request.getParameter("u_name");
        if (!request.getParameter("u_password1").equals(request.getParameter("u_password2")))//新密码前后不一致时返回个人信息页面
            return login(u_name,request);
        PreparedStatement pstmt = null;
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtils.getConnection();
            String oldPassword = request.getParameter("oldPassword");
            String u_password = request.getParameter("u_password1");
            String u_email = request.getParameter("u_email");
            String u_phone = request.getParameter("u_phone");
            String u_sex = request.getParameter("u_sex");
            String u_age = request.getParameter("u_age");
            String sql = "select u_password from user where u_name='"+u_name+"'";
           // String sql = "insert into user(u_name,u_password,u_email,u_phone,u_sex,u_age) values('"+u_name+"','"+u_password+"','"+u_email+"','"+u_phone+"','"+u_sex+"',"+u_age+")";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                if(!rs.getString(0).equals(oldPassword))//密码不正确时返回个人信息页面
                    return login(u_name,request);
            }
            sql = "update user set u_password='"+u_password+"',u_email='"+u_email+"',u_phone='"+u_phone+"',u_sex='"+u_sex+"',u_age="+u_age+"where u_name='"+u_name+"'";
            pstmt = conn.prepareStatement(sql);
            pstmt.execute();
        }catch (SQLException e){
            e.printStackTrace();
            return login(u_name,request);
        }finally {
            JdbcUtils.free(conn,pstmt);
        }
        return login(u_name,request);
    }
}
