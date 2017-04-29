package com.liyingyu.controller;

import com.liyingyu.entity.User;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by YingyuLi on 2017/4/22.
 */
@Controller
public class Test_AAAAAAAAA{

    @RequestMapping("/AAAAAAAAA")
    public String toAAAAAAAAA(){
        return "AAAAAAAAA";
    }

    //接收前台传过来的字符串格式的json对象，在后台进行解析
    @RequestMapping(value="/sendJson",method= RequestMethod.POST)
    public String sendJsonModel(){
        //System.out.println(u.getU_name()+" "+u.getU_password());
        System.out.println();
        System.out.println("12312313213");
        return "AAAAAAAAA";
    }

    //后台返回json数据到前端解析
    @RequestMapping(value="/getJson",method= RequestMethod.POST)
    public void getJsonModel(HttpServletResponse response) throws IOException {
        List m = new ArrayList();
        JSONArray jsons = new JSONArray();
        for(int i=0;i<10;i++){
            User user = new User();
            user.setU_name("name_" + i);
            m.add(user);
        }

        for(int j=0;j<m.size();j++){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("user", m.get(j));
            jsons.add(jsonObject);
        }
        response.getWriter().print(jsons.toString()) ;
    }
    @RequestMapping("/top")
    public String top(){
        return "top";
    }
    @RequestMapping("/main")
    public String main(){
        return "main";
    }
    @RequestMapping("/left")
    public String left(){
        return "left";
    }

}
