package com.liyingyu.controller;

import com.liyingyu.bean.JdbcUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
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
public class BBSController {
    @RequestMapping("/BBSPage")
    public ModelAndView bbsPage(HttpServletRequest request,@RequestParam("u_name") String u_name){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        LinkedList<String> list = null;
        try {
            conn = JdbcUtils.getConnection();
            String sql = "select * from user_record order by record_id DESC ";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            String name,record_time,record_comment;
            StringBuffer line;
            list = new LinkedList<>();
            while(rs.next()){
                name = rs.getString("u_name") ;
                record_comment = rs.getString("record_comment") ;
                record_time = rs.getString("record_time") ;
                line = new StringBuffer(name+":"+record_comment+"   "+record_time) ;
                list.add(line.toString()) ;
            }
            request.setAttribute("list",list);
            request.setAttribute("u_name",u_name);
            //DispatcherServlet dispatcherServlet = request.getRequestDispatcher().forward("BBS");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.free(conn,pstmt,rs);
        }
        ModelAndView modelAndView = new ModelAndView("BBSPage","list",list);
        return modelAndView;
    }


    @RequestMapping("/printRecord")
    public ModelAndView printRecord(@RequestParam("record_comment") String record_comment, @RequestParam("u_name") String u_name, HttpServletRequest request){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        LinkedList<String> list = null;
        try {
            conn = JdbcUtils.getConnection();
            String sql = "insert into user_record(record_comment,record_time,u_name) values('"+record_comment+"',now()"+",'"+u_name+"')";
            pstmt = conn.prepareStatement(sql);
            pstmt.execute();
            sql = "select * from user_record ORDER by record_id DESC";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            String name,record_time,comment;
            StringBuffer line;
            list = new LinkedList<>();
            while(rs.next()){
                name = rs.getString("u_name");
                comment = rs.getString("record_comment");
                record_time = rs.getString("record_time");
                line = new StringBuffer(name+":"+comment+"   "+record_time);
                list.add(line.toString());
            }
            request.setAttribute("list",list);
            request.setAttribute("u_name",u_name);
            //request.setAttribute("resultSet",rs);
            //DispatcherServlet dispatcherServlet = request.getRequestDispatcher().forward("BBS");
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.free(conn,pstmt,rs);
        }
        ModelAndView modelAndView = new ModelAndView("BBSPage","list",list);
        return modelAndView;
    }
}
