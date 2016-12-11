package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Lien;
import model.Profile;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class lienDA {
    private final static String tableName = "Lien";
    public static ArrayList<Lien> getLienList(Profile p)throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "+tableName+ " where idProfile=?";
        ResultSet result = dataAccess.select(con, sql,p.getIdProfile());
        ArrayList<Lien> list = new ArrayList<Lien>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertLien(Lien p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (nomLien,urlLien,imageLien) "
                + "VALUES ( ?, ? , ? )";
        return dataAccess.executeSQL(con, sql,
                p.getNomLien(),
                p.getUrlLien(),
                p.getImageLien()
        );
    }
    public static int deleteLien(Lien p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE idLien = ?";
        return dataAccess.executeSQL(con, sql, p.getIdLien());
    }
    public static Lien findLien(int id) throws dataAccessException,SQLException {
        Lien p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE idLien = ?";
        ResultSet result = dataAccess.select(con, sql,id);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateLien(Lien p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
                +" SET nomLien = ? , urlLien = ?,imageLien = ?"
                +" where idLien = ?";
        return dataAccess.executeSQL(con, sql,
                p.getNomLien(),
                p.getUrlLien(),
                p.getImageLien(),
                p.getIdLien()
        );
    }
    private static Lien map(ResultSet resultSet) throws SQLException {
        Lien pp = new Lien();
        pp.setNomLien(resultSet.getString("nomLien"));
        pp.setImageLien(resultSet.getString("imageLien"));
        pp.setUrlLien(resultSet.getString("urlLien"));
        pp.setIdLien(resultSet.getInt("idLien"));
        return pp;
    }
}
