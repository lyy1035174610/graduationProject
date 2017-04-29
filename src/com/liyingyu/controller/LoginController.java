package com.liyingyu.controller;

import com.liyingyu.bean.JdbcUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Created by YingyuLi on 2017/3/21.
 */
@Controller
public class LoginController {
    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("u_name") String u_name, @RequestParam("u_password") String u_password, HttpSession session){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtils.getConnection();
            String sql = "select u_password from user where u_name='"+u_name+"'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                if(u_password.equals(rs.getString("u_password"))){
                    ModelAndView model = new ModelAndView("/main","u_name",u_name);
                    return model;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.free(conn,pstmt,rs);
        }
        return new ModelAndView("login2");
    }
    @RequestMapping("/mainPage")
    public ModelAndView returnMainPage(@RequestParam("u_name") String u_name){
        return new ModelAndView("/mainPage","u_name",u_name);
    }
    @RequestMapping("/quit")
    public ModelAndView quit(){
        return new ModelAndView("login2");
    }
}
