package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Experience;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class experienceDA {
    private final static String tableName = "Experience";
    public static ArrayList<Experience> getExperienceList()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "+tableName;
        ResultSet result = dataAccess.select(con, sql);
        ArrayList<Experience> list = new ArrayList<Experience>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertExperience(Experience p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (nomExperience, logoExperience) "
                + "VALUES (?, ? )";
        return dataAccess.executeSQL(con, sql,
                p.getNomExperience(),
                p.getLogoExperience()
        );
    }
    public static int deleteExperience(Experience p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE nomExperience = ?";
        return dataAccess.executeSQL(con, sql, p.getNomExperience());
    }
    public static Experience findExperience(int id) throws dataAccessException,SQLException {
        Experience p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE idExperience = ?";
        ResultSet result = dataAccess.select(con, sql,id);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateExperience(Experience p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
                +" SET nomExperience = ? , logoExperience = ?"
                +" where idExperience = ?";
        return dataAccess.executeSQL(con, sql,
                p.getNomExperience(),
                p.getLogoExperience(),
                p.getIdExperience()
        );
    }
    private static Experience map(ResultSet resultSet) throws SQLException {
        Experience pp = new Experience();
        pp.setIdExperience(resultSet.getInt("idExperience"));
        pp.setNomExperience(resultSet.getString("nomExperience"));
        pp.setLogoExperience(resultSet.getString("logoExperience"));
        return pp;
    }
}
