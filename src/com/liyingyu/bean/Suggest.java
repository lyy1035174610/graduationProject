package com.liyingyu.bean;

import net.sf.json.JSONArray;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by YingyuLi on 2017/5/19.
 */
public class Suggest {
    public static double suggest(String u_name){
        JSONArray jsons = new JSONArray();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = " SELECT longitude,count(*) FROM user_scan_record group BY longitude";
        double l=0;
        try {
            conn = JdbcUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                 l = rs.getDouble("longitude");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return l;
    }
}
