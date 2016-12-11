package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Cursus;
import model.Profile;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class cursusDA {
    private final static String tableName = "Cursus";
    public static ArrayList<Cursus> getCursusList(Profile p)throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "+tableName+ " where idProfile=?";
        ResultSet result = dataAccess.select(con, sql,p.getIdProfile());
        ArrayList<Cursus> list = new ArrayList<Cursus>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertCursus(Cursus p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (nomCursus,annee_debutCursus,annee_finCursus,etablissementCursus,remarqueCursus) "
                + "VALUES ( ? , ? , ? , ? , ? )";
        return dataAccess.executeSQL(con, sql,
                p.getNomCursus(),
                p.getAnnee_debutCursus(),
                p.getAnnee_finCursus(),
                p.getEtablissementCursus(),
                p.getRemarqueCursus()
        );
    }
    public static int deleteCursus(Cursus p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE nomCursus = ?";
        return dataAccess.executeSQL(con, sql, p.getId_cursus());
    }
    public static Cursus findCursus(int id) throws dataAccessException,SQLException {
        Cursus p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE nomCursus = ?";
        ResultSet result = dataAccess.select(con, sql,id);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateCursus(Cursus p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
        +"nomCursus  = ?,annee_debutCursus = ?,annee_finCursus = ?,etablissementCursus = ?,remarqueCursus = ?"
                +" where idCursus = ?";
        return dataAccess.executeSQL(con, sql,
                p.getNomCursus(),
                p.getAnnee_debutCursus(),
                p.getAnnee_finCursus(),
                p.getEtablissementCursus(),
                p.getRemarqueCursus(),
                p.getId_cursus()
        );
    }
    private static Cursus map(ResultSet resultSet) throws SQLException {
        Cursus p = new Cursus();
        p.setNomCursus(resultSet.getString("nomCursus"));
        p.setAnnee_debutCursus(resultSet.getString("annee_debutCursus"));
        p.setAnnee_finCursus(resultSet.getString("annee_finCursus"));
        p.setEtablissementCursus(resultSet.getString("etablissementCursus"));
        p.setRemarqueCursus(resultSet.getString("remarqueCursus"));
        p.setId_cursus(resultSet.getInt("IDCursus"));
        return p;
    }
}
