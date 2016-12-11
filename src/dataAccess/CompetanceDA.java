package dataAccess;

import DB.dataAccessException;
import model.Categorie_competance;
import model.Competance;
import DB.dataAccess;
import model.Profile;
import model.Projet;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * Created by Rabab Chahboune on 12/10/2016.
 */
public class CompetanceDA {

    private final static String tableName = "competance";
    private final static String tableName1 = "categorie_competance";
    public static ArrayList<Competance> getCompetanceList()throws SQLException {

        // get database connection
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        // String sql = "SELECT * FROM `" + tableName + "` ORDER BY id DESC";
        String sql = "SELECT * FROM " + tableName + " INNER JOIN "+tableName1+" ON "
                +tableName+".idCompetanceCategorie="+tableName1+".idCompetanceCategorie ;" ;

        // get customer data from database
        ResultSet result = dataAccess.select(con, sql);

        ArrayList<Competance> list = new ArrayList<Competance>();

        while (result.next()) {
            list.add(map(result));
        }
        result.close();

        return list;
    }
    private static Competance map(ResultSet resultSet) throws SQLException {
        Competance c = new Competance();
        Categorie_competance cc = new Categorie_competance();
        c.setIdCompetance(resultSet.getInt("idCompetance"));
        c.setNomCompetance(resultSet.getString("nomCompetance"));
        c.setPourcentageCompetance(resultSet.getInt("pourcentageCompetance"));
        cc.setIdCompetanceCategorie(resultSet.getInt("idCompetanceCategorie"));
        cc.setNomCompetanceCategorie(resultSet.getString("nomCompetanceCategorie"));
        cc.setDescriptionCompetanceCategorie(resultSet.getString("descriptionCompetanceCategorie"));
        c.setCategorie_competance(cc);

        return c;
    }

    public static int insertCompetance(Competance competance, Profile profile) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "INSERT INTO " + tableName +
                " (idProfile, idCompetanceCategorie, nomCompetance,pourcentageCompetance) "+
                "VALUES (?, ? ,? , ?)";

        return dataAccess.executeSQL(con, sql,
                profile.getIdProfile() ,
                competance.getCategorie_competance().getIdCompetanceCategorie(),
                competance.getNomCompetance(),
                competance.getPourcentageCompetance());
    }

    public static int deleteCompetance(Competance competance) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "DELETE FROM " + tableName + " WHERE id = ?";

        return dataAccess.executeSQL(con, sql, competance.getIdCompetance());
    }

    public static int updateCompetance(Competance competance, Profile profile) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "UPDATE "+ tableName +
                " SET idProfile = ?,  idCompetanceCategorie= ?," +
                "nomCompetance = ? , pourcentageCompetance= ?" +
                "   WHERE idCompetance = ?";

        return dataAccess.executeSQL(con, sql,
                profile.getIdProfile(),
                competance.getCategorie_competance(),
                competance.getNomCompetance(),
                competance.getPourcentageCompetance(),
                competance.getIdCompetance());
    }

    public static Competance findCompetance(int id) throws dataAccessException, SQLException {
        Competance competance = null;
        // get database connection
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "SELECT * FROM " + tableName + " WHERE id = ?";
        ResultSet result = dataAccess.select(con, sql, id);

        if (result.next()) {
            competance = map(result);
        }

        return competance;
    }






}
