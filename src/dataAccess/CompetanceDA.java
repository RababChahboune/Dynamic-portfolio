package dataAccess;

import DB.dataAccessException;
import model.Categorie_competance;
import model.Competance;
import DB.dataAccess;
import model.Profile;
import model.Projet;
import utility.UtilHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * Created by Rabab Chahboune on 12/10/2016.
 */
public class CompetanceDA {

    private final static String tableName = "competance";
    public static ArrayList<Competance> getCompetanceList(Profile p)throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName +" where idProfile=?" ;
        ResultSet result = dataAccess.select(con, sql,p.getIdProfile());
        ArrayList<Competance> list = new ArrayList<Competance>();
        while (result.next()) {
            list.add(map(result));
        }
        UtilHelper.close(con);
        UtilHelper.close(result);
        return list;
    }
    private static Competance map(ResultSet resultSet) throws SQLException {
        Competance c = new Competance();
        c.setIdCompetance(resultSet.getInt("idCompetance"));
        c.setNomCompetance(resultSet.getString("nomCompetance"));
        c.setPourcentageCompetance(resultSet.getInt("pourcentageCompetance"));
        return c;
    }

    public static int insertCompetance(Competance competance, Profile profile) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "INSERT INTO " + tableName +
                " (idProfile, nomCompetance,pourcentageCompetance) "+
                "VALUES (?, ? ,?)";

        int i = dataAccess.executeSQL(con, sql,
                profile.getIdProfile() ,
                competance.getNomCompetance(),
                competance.getPourcentageCompetance());
        UtilHelper.close(con);
        return i;
    }

    public static int deleteCompetance(Competance competance) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "DELETE FROM " + tableName + " WHERE idCompetance = ?";

        int i = dataAccess.executeSQL(con, sql, competance.getIdCompetance());
        UtilHelper.close(con);
        return i;
    }

    public static int updateCompetance(Competance competance, Profile profile) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "UPDATE "+ tableName +
                " SET idProfile = ?,  " +
                "nomCompetance = ? , pourcentageCompetance= ?" +
                "   WHERE idCompetance = ?";

        int i = dataAccess.executeSQL(con, sql,
                profile.getIdProfile(),
                competance.getNomCompetance(),
                competance.getPourcentageCompetance(),
                competance.getIdCompetance());
        UtilHelper.close(con);
        return  i;
    }

    public static Competance findCompetance(int id) throws dataAccessException, SQLException {
        Competance competance = null;
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName+ " WHERE idCompetance = ?";
        ResultSet result = dataAccess.select(con, sql, id);
        if (result.next())
            competance = map(result);
        UtilHelper.close(con);
        UtilHelper.close(result);
        return competance;
    }
}
