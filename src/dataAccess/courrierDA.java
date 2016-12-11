package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Courrier;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class courrierDA {
    private final static String tableName = "Courrier";
    public static ArrayList<Courrier> getCourrierList()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "+tableName;
        ResultSet result = dataAccess.select(con, sql);
        ArrayList<Courrier> list = new ArrayList<Courrier>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertCourrier(Courrier p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (emailCourrier,sujetCourrier,messageCourrier,nomCompletCourrier,dateEnvoieCourrier) "
                + "VALUES ( ?, ? , ? , ? , now())";
        return dataAccess.executeSQL(con, sql,
                p.getEmailCourrier(),
                p.getSujetCourrier(),
                p.getMessageCourrier(),
                p.getNomComplet()

        );
    }
    public static int deleteCourrier(Courrier p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE idCourrier = ?";
        return dataAccess.executeSQL(con, sql, p.getIdCourrier());
    }
    public static Courrier findCourrier(int id) throws dataAccessException,SQLException {
        Courrier p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE idCourrier = ?";
        ResultSet result = dataAccess.select(con, sql,id);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateCourrier(Courrier p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
                +" SET emailCourrier = ?,sujetCourrier = ?,messageCourrier = ?,nomCompletCourrier = ?"
                +" where idCourrier = ?";
        return dataAccess.executeSQL(con, sql,
                p.getEmailCourrier(),
                p.getSujetCourrier(),
                p.getMessageCourrier(),
                p.getNomComplet(),
                p.getIdCourrier()
        );
    }
    private static Courrier map(ResultSet resultSet) throws SQLException {
        Courrier p = new Courrier();
        p.setEmailCourrier(resultSet.getString("emailCourrier"));
        p.setSujetCourrier(resultSet.getString("sujetCourrier"));
        p.setMessageCourrier(resultSet.getString("messageCourrier"));
        p.setDateEnvoieCourrier(resultSet.getString("dateEnvoieCourrier"));
        p.setNomComplet(resultSet.getString("nomCompletCourrier"));
        p.setIdCourrier(resultSet.getInt("idCourrier"));
        return p;
    }
}
