package com.liyingyu.controller;

import com.liyingyu.bean.JdbcUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by YingyuLi on 2017/3/28.
 */
@Controller
public class FishingPlaceController {
    @RequestMapping("/fishingKnowlege")
    public ModelAndView fishingKnowlege(){//钓鱼百科主页
        return new ModelAndView("/fishingKnowlege");
    }

    @RequestMapping("/www.diaoyu123.com")
    public ModelAndView forwordToURL(){
        return new ModelAndView("redirect:http://www.diaoyu123.com");
    }

    @RequestMapping("/fishingPlace")
    public ModelAndView fishingPlace(@RequestParam("u_name") String u_name){
        return new ModelAndView("/fishingPlace","u_name",u_name);
    }

    @RequestMapping("/testMapAPI")
    public ModelAndView map(@RequestParam("u_name") String u_name){
        return new ModelAndView("/testMapAPI","u_name",u_name);
    }

    @RequestMapping("/addFishingPlace")
    public ModelAndView addFishingPlace(HttpServletRequest request){
        PreparedStatement pstmt = null;
        Connection conn = null;
        try {
            System.out.print(request.getParameter("fishing_place_name"));
            conn = JdbcUtils.getConnection();
            String coordinate = request.getParameter("coordinate");
            System.out.print(coordinate);
            String[] coor = coordinate.split(",");
            String longitude = coor[0];
            String latitude = coor[1];
            String fishing_place_name = request.getParameter("fishing_place_name");
            String species_of_fish = request.getParameter("species_of_fish");
            String free_or_not = request.getParameter("free_or_not");
            String discoverer_name = request.getParameter("discoverer_name");
            String sql = "insert into fishing_place(longitude,latitude,fishing_place_name,species_of_fish,free_or_not,discoverer_name) values("+longitude+","+latitude+",'"+fishing_place_name+"','"+species_of_fish+"','"+free_or_not+"','"+discoverer_name+"')";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            pstmt.execute();
        }catch (SQLException e){
            e.printStackTrace();
            return new ModelAndView("/testMapAPI");
        }finally {
            JdbcUtils.free(conn,pstmt);
        }
        return new ModelAndView("/testMapAPI");
    }
}
