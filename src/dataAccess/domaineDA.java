package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Domaine;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class domaineDA {
    private final static String tableName = "Domaine";
    public static ArrayList<Domaine> getDomaineList()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "+tableName;
        ResultSet result = dataAccess.select(con, sql);
        ArrayList<Domaine> list = new ArrayList<Domaine>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertDomaine(Domaine p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (nomDomaine,descriptionDomaine,imageDomaine) "
                + "VALUES ( ?, ? , ? )";
        return dataAccess.executeSQL(con, sql,
                p.getNomDomaine(),
                p.getDescriptionDomaine(),
                p.getImageDomaine()
        );
    }
    public static int deleteDomaine(Domaine p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE idDomaine = ?";
        return dataAccess.executeSQL(con, sql, p.getIdDomaine());
    }
    public static Domaine findDomaine(int id) throws dataAccessException,SQLException {
        Domaine p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE idDomaine = ?";
        ResultSet result = dataAccess.select(con, sql,id);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateDomaine(Domaine p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
                +" SET nomDomaine = ? , descriptionDomaine = ?,imageDomaine = ?"
                +" where idDomaine = ?";
        return dataAccess.executeSQL(con, sql,
                p.getNomDomaine(),
                p.getDescriptionDomaine(),
                p.getImageDomaine(),
                p.getIdDomaine()
        );
    }
    private static Domaine map(ResultSet resultSet) throws SQLException {
        Domaine pp = new Domaine();
        pp.setNomDomaine(resultSet.getString("nomDomaine"));
        pp.setImageDomaine(resultSet.getString("imageDomaine"));
        pp.setDescriptionDomaine(resultSet.getString("descriptionDomaine"));
        pp.setIdDomaine(resultSet.getInt("idDomaine"));
        return pp;
    }
}
