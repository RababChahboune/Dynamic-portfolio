package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Cursus;
import model.Profile;
import utility.UtilHelper;

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
    public static int insertCursus(Cursus p,Profile profile) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (nomCursus,idProfile,annee_debutCursus,annee_finCursus,etablissementCursus,remarqueCursus) "
                + "VALUES ( ? , ? , ? , ? , ? , ? )";
        return dataAccess.executeSQL(con, sql,
                p.getNomCursus(),
                profile.getIdProfile(),
                p.getAnnee_debutCursus(),
                p.getAnnee_finCursus(),
                p.getEtablissementCursus(),
                p.getRemarqueCursus()
        );
    }
    public static int deleteCursus(Cursus p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
            String sql = "DELETE FROM " + tableName + " WHERE id_cursus = ?";
        return dataAccess.executeSQL(con, sql, p.getId_cursus());
    }
    public static Cursus findCursus(int id) throws dataAccessException,SQLException {
        Cursus p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE id_cursus = ?";
        ResultSet result = dataAccess.select(con, sql,id);
        if (result.next()) {
            p = map(result);
        }
        UtilHelper.close(con);
        UtilHelper.close(result);

        return p;
    }
    public static int updateCursus(Cursus p,Profile profile) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
        +" SET nomCursus  = ? , idProfile = ? , annee_debutCursus = ? , annee_finCursus = ? ," +
                " etablissementCursus = ? , remarqueCursus = ? "
                +" where id_Cursus = ?";
        int i = dataAccess.executeSQL(con, sql,
                p.getNomCursus(),
                profile.getIdProfile(),
                p.getAnnee_debutCursus(),
                p.getAnnee_finCursus(),
                p.getEtablissementCursus(),
                p.getRemarqueCursus(),
                p.getId_cursus()
        );
        UtilHelper.close(con);
        return i;
    }
    private static Cursus map(ResultSet resultSet) throws SQLException {
        Cursus p = new Cursus();
        p.setNomCursus(resultSet.getString("nomCursus"));
        p.setAnnee_debutCursus(resultSet.getString("annee_debutCursus"));
        p.setAnnee_finCursus(resultSet.getString("annee_finCursus"));
        p.setEtablissementCursus(resultSet.getString("etablissementCursus"));
        p.setRemarqueCursus(resultSet.getString("remarqueCursus"));
        p.setId_cursus(resultSet.getInt("id_Cursus"));
        return p;
    }
}
