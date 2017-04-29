package com.liyingyu.bean;

/**
 * Created by YingyuLi on 2017/3/21.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


public final class JdbcUtils {
    private static String name = "root";
    private static String password = "Lyy123@hotmail.com";
    private static String url = "jdbc:mysql://localhost:3306/graduationproject";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return (Connection) DriverManager.getConnection(url, name, password);
    }

    public static void free(Connection conn, java.sql.PreparedStatement ps, ResultSet rs) {
        try {
            if (null != rs)
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != ps)
                    ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (null != conn)
                        conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    public static void free(Connection conn, java.sql.PreparedStatement ps) {
        try {
            if (null != ps)
                ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != conn)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
