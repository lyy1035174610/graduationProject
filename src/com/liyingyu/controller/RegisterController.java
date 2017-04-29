package com.liyingyu.controller;

import com.liyingyu.bean.JdbcUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by YingyuLi on 2017/3/19.
 */
@Controller
public class RegisterController {
    @RequestMapping(value = "/register")
    public String register(){
        return "register";
    }

    @RequestMapping(value = "/save_register")
    public String save_register(HttpServletRequest request){
        StringBuffer s = new StringBuffer();
        try  {
            BufferedReader br = new BufferedReader(new FileReader("D:\\code\\github\\graduationProject\\web\\WEB-INF\\check.txt"));
            s.append(br.readLine());
        }catch (IOException e){
            return "register";
        }
        System.out.println(request.getParameter("checkcode")+"   "+s);
        System.out.println( request.getParameter("u_password1")+"   "+ request.getParameter("u_password2"));
        if(request.getParameter("checkcode").equals(s.toString()) && request.getParameter("u_password1").equals(request.getParameter("u_password2"))){
            System.out.println("2222222");
            PreparedStatement pstmt = null;
            Connection conn = null;
            try {
                conn = JdbcUtils.getConnection();
                System.out.println("11111");
                String u_name = request.getParameter("u_name");
                String u_password = request.getParameter("u_password1");
                String u_email = request.getParameter("u_email");
                String u_phone = request.getParameter("u_phone");
                String u_sex = request.getParameter("u_sex");
                String u_age = request.getParameter("u_age");
                String sql = "insert into user(u_name,u_password,u_email,u_phone,u_sex,u_age) values('"+u_name+"','"+u_password+"','"+u_email+"','"+u_phone+"','"+u_sex+"',"+u_age+")";
                System.out.println(sql);
                pstmt = conn.prepareStatement(sql);
                System.out.println("33333");
                pstmt.execute();
                System.out.println("44444");
                System.out.println("55555");
            }catch (SQLException e){
                e.printStackTrace();
                return "register";
            }finally {
                JdbcUtils.free(conn,pstmt);
            }
            return "login2";
        }
        return "register";
    }

}
