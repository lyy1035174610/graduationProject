package com.liyingyu.controller;

import com.liyingyu.bean.JdbcUtils;
import com.liyingyu.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    public ModelAndView login(HttpServletRequest request, HttpSession session){
        User user = (User)session.getAttribute("user");
        String u_name = user.getU_name();
        System.out.println(u_name);
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
            return new ModelAndView("login");
        }finally {
            JdbcUtils.free(conn,pstmt,rs);
        }
        return model;
    }

    @RequestMapping("/alterUserInformation")
    public ModelAndView alterUserInformation(HttpSession session,HttpServletRequest request){
        User user = (User)session.getAttribute("user");
        String u_name = user.getU_name();
        return new ModelAndView("/alterUserInformation","u_name",u_name);
    }

    @RequestMapping("/saveChange")
    public ModelAndView  saveChange( HttpServletRequest request){
        String u_name = request.getParameter("u_name");
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
                if(!rs.getString("u_password").equals(oldPassword)) {//密码不正确时返回个人信息页面
                    request.setAttribute("err","旧密码输入有误！");
                    return new ModelAndView("alterUserInformation","u_name",u_name);
                }
            }
            sql = "update user set u_password='"+u_password+"',u_email='"+u_email+"',u_phone='"+u_phone+"',u_sex='"+u_sex+"',u_age="+u_age+" where u_name='"+u_name+"'";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            pstmt.execute();
        }catch (SQLException e){
            e.printStackTrace();
            request.setAttribute("err","旧密码输入有误！");
            return new ModelAndView("alterUserInformation","u_name",u_name);
        }finally {
            JdbcUtils.free(conn,pstmt);
        }
        System.out.println("yessss");
        return new ModelAndView("success");
    }
    @RequestMapping("/success")
    public String success(){
        return "success";
    }

}
