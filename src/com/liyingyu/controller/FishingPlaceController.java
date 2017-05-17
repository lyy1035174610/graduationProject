package com.liyingyu.controller;

import com.liyingyu.bean.GeoUtils;
import com.liyingyu.bean.JdbcUtils;
import com.liyingyu.entity.FishingPlace;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.DoubleSummaryStatistics;
import java.util.LinkedList;
import java.util.List;

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

    @RequestMapping("/addScore")
    public ModelAndView addScore(HttpServletRequest request){
//        PreparedStatement pstmt = null;
//        Connection conn = null;
//        try {
//            String sql = "insert into fishing_place(longitude,latitude,fishing_place_name,species_of_fish,free_or_not,discoverer_name) values("+longitude+","+latitude+",'"+fishing_place_name+"','"+species_of_fish+"','"+free_or_not+"','"+discoverer_name+"')";
//            System.out.println(sql);
//            pstmt = conn.prepareStatement(sql);
//            pstmt.execute();
//        }catch (SQLException e){
//            e.printStackTrace();
//            return new ModelAndView("/testMapAPI");
//        }finally {
//            JdbcUtils.free(conn,pstmt);
//        }
        return new ModelAndView("/testMapAPI");
    }

    @RequestMapping("/fishingPlaceDetails")
    public ModelAndView fishingPlaceDetails(HttpServletRequest request){
        ModelAndView model = new ModelAndView("fishingPlaceDetails");
        Connection conn = null;
        String sql="";
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        LinkedList<String> list = null;
        try {
            conn = JdbcUtils.getConnection();
            sql = "select * from fishing_place where longitude="+request.getParameter("longitude")+" and latitude="+request.getParameter("latitude");
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                request.setAttribute("longitude",rs.getDouble("longitude"));
                request.setAttribute("latitude",rs.getDouble("latitude"));
                request.setAttribute("fishing_place_name",rs.getString("fishing_place_name"));
                request.setAttribute("species_of_fish",rs.getString("species_of_fish"));
                request.setAttribute("free_or_not",rs.getString("free_or_not"));
                request.setAttribute("discoverer_name",rs.getString("discoverer_name"));
                request.setAttribute("score",rs.getDouble("score"));
            }
            System.out.println(request.getAttribute("fishing_place_name")+" "+request.getAttribute("species_of_fish"));
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.free(conn,pstmt,rs);
        }
        return model;
    }

    @RequestMapping("/getFishingPlaceInfo")
    public void getFishingPlaceInfo(HttpServletResponse response,HttpServletRequest request) throws IOException {
        System.out.print("111111");
        List m = new ArrayList();
        JSONArray jsons = new JSONArray();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        double longitude = Double.parseDouble(request.getParameter("longitude"));//用户当前所在纬度

        double latitude = Double.parseDouble(request.getParameter("latitude"));//用户当前所在经度
        System.out.print("ff");
//         String fishing_place_name = request.getParameter("fishing_place_name");
        double distance = Double.parseDouble(request.getParameter("distance"));//距离筛选条件，应把距离作为最后的筛选
        System.out.print("1212121212");
        String species_of_fish = request.getParameter("species_of_fish");//鱼种类筛选条件
        String free_or_not = request.getParameter("free_or_not");
        System.out.print("222222");
        if(!free_or_not.equals("1"))
          free_or_not = request.getParameter("free_or_not");//是否免费筛选条件

//         String discoverer_name = request.getParameter("discoverer_name");
        double score = Double.parseDouble(request.getParameter("score"));//评分筛选条件

        StringBuilder sql = new StringBuilder();
        StringBuilder subSQLSpecies = new StringBuilder();
        StringBuilder subSQLFree_or_not = new StringBuilder();
        StringBuilder subSQLScore = new StringBuilder();
        if(species_of_fish.equals("1")&&request.getParameter("free_or_not").equals("1")&&distance==1&&score==1 ){
            sql = sql.append("select * from fishing_Place");
            System.out.print("3333333");
        }else {
            sql = sql.append("select * from fishing_Place where ");
            if(!species_of_fish.equals("1")) {
                int end = species_of_fish.lastIndexOf(',');
                species_of_fish = species_of_fish.substring(0,end);
                String species[] = species_of_fish.split(",");
                subSQLSpecies = subSQLSpecies.append("(");
                for (int i = 0; i < species.length;) {
                    subSQLSpecies = subSQLSpecies.append("species_of_fish like '%" + species[i] + "%' ");
                    i++;
                    if(i<species.length)
                        subSQLSpecies = subSQLSpecies.append(" or ");
                }
                subSQLSpecies = subSQLSpecies.append(")");
            }
            if(!request.getParameter("free_or_not").equals("1")){
                subSQLFree_or_not = subSQLFree_or_not.append("free_or_not='"+free_or_not+"' ");
            }
            if(!(score-1<0.0000000001)){
                subSQLScore = subSQLScore.append("score>"+score);
            }
            sql = sql.append(subSQLFree_or_not+" and "+subSQLSpecies+" and "+subSQLScore);
            System.out.print("4444444");
        }
        try {
            conn = JdbcUtils.getConnection();
//            if(subSQLFree_or_not != null)
//                sql = sql.append(subSQLFree_or_not);
//            if(subSQLSpecies != null)
//                sql = sql.append(subSQLSpecies);
//            if(subSQLScore != null)
//                sql = sql.append(subSQLScore);
            //sql = sql.append(subSQLFree_or_not+" and "+subSQLSpecies+" and "+subSQLScore);
            System.out.println(sql.toString());
            System.out.print("55555555");
            if(!species_of_fish.equals("1")){
                sql = new StringBuilder("select * from fishing_Place where score>1");
            }
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            double longitude1;
            double latitude1;
             String fishing_place_name1="";
             String species_of_fish1="";
             String free_or_not1="";
             String discoverer_name1="";
             double score1=0;
             if(distance - 1 <0.001)
                 distance = 10000000;
             System.out.println(distance);
            while(rs.next()){
                longitude1 = rs.getDouble("longitude");
                latitude1 = rs.getDouble("latitude");
                if(GeoUtils.getDistance(longitude,latitude,longitude1,latitude1)<distance){
                    fishing_place_name1 = rs.getString("fishing_place_name");
                    species_of_fish1 = rs.getString("species_of_fish");
                    free_or_not1 = rs.getString("free_or_not");
                    discoverer_name1 = rs.getString("discoverer_name");
                    score1 = rs.getDouble("score");
                    FishingPlace fishingPlace = new FishingPlace();
                    fishingPlace.setDiscoverer_name(discoverer_name1);
                    fishingPlace.setFishing_place_name(fishing_place_name1);
                    fishingPlace.setFree_or_not(free_or_not1);
                    fishingPlace.setSpecies_of_fish(species_of_fish1);
                    fishingPlace.setScore(score1);
                    fishingPlace.setLatitude(latitude1);
                    fishingPlace.setLongitude(longitude1);
                    m.add(fishingPlace);
                }
            }
            //DispatcherServlet dispatcherServlet = request.getRequestDispatcher().forward("BBS");

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JdbcUtils.free(conn,pstmt,rs);
        }

        for(int j=0;j<m.size();j++){
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("fishingPlace", m.get(j));
            jsons.add(jsonObject);
        }
        System.out.println(jsons.toString());
        response.getWriter().print(jsons.toString()) ;
    }
}
