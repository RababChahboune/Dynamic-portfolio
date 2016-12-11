package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Theme;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class themeDA {
    private final static String tableName = "Theme";
    public static ArrayList<Theme> getThemeList()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "+tableName;
        ResultSet result = dataAccess.select(con, sql);
        ArrayList<Theme> list = new ArrayList<Theme>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertTheme(Theme p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (lienTheme,nomTheme,paletteTheme) "
                + "VALUES ( ?, ? , ? )";
        return dataAccess.executeSQL(con, sql,
                p.getLienTheme(),
                p.getNomTheme(),
                p.getPaletteTheme()
        );
    }
    public static int deleteTheme(Theme p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE nomTheme = ?";
        return dataAccess.executeSQL(con, sql, p.getNomTheme());
    }
    public static Theme findTheme(String nom) throws dataAccessException,SQLException {
        Theme p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE nomTheme = ?";
        ResultSet result = dataAccess.select(con, sql,nom);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateTheme(Theme p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
                +" SET nomTheme = ? , lienTheme = ?,paletteTheme = ?"
                +" where nomTheme = ?";
        return dataAccess.executeSQL(con, sql,
                p.getNomTheme(),
                p.getLienTheme(),
                p.getPaletteTheme(),
                p.getNomTheme()
        );
    }
    private static Theme map(ResultSet resultSet) throws SQLException {
        Theme pp = new Theme();
        pp.setLienTheme(resultSet.getString("nomTheme"));
        pp.setNomTheme(resultSet.getString("lienTheme"));
        pp.setPaletteTheme(resultSet.getString("paletteTheme"));
        return pp;
    }
}