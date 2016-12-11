package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Categorie_competance;
import model.Competance;
import model.Profile;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/10/2016.
 */
public class Categorie_competanceDA {


    private final static String tableName = "categorie_competance";
    public static ArrayList<Categorie_competance> getCategorieCompetanceList()throws SQLException {

        // get database connection
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        // String sql = "SELECT * FROM `" + tableName + "` ORDER BY id DESC";
        String sql = "SELECT * FROM "+tableName;

        // get customer data from database
        ResultSet result = dataAccess.select(con, sql);

        ArrayList<Categorie_competance> list = new ArrayList<>();

        while (result.next()) {
            list.add(map(result));
        }
        result.close();

        return list;
    }

    private static Categorie_competance map(ResultSet resultSet) throws SQLException {

        Categorie_competance cc = new Categorie_competance();

        cc.setIdCompetanceCategorie(resultSet.getInt("idCompetanceCategorie"));
        cc.setNomCompetanceCategorie(resultSet.getString("nomCompetanceCategorie"));
        cc.setDescriptionCompetanceCategorie(resultSet.getString("descriptionCompetanceCategorie"));


        return cc;
    }

    public static int insertCategorieCompetance(Categorie_competance cc) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "INSERT INTO " + tableName +
                " (nomCompetanceCategorie,descriptionCompetanceCategorie) "+
                "VALUES (?, ? )";

        return dataAccess.executeSQL(con, sql,
                cc.getNomCompetanceCategorie(),
                cc.getDescriptionCompetanceCategorie());
    }

    public static int deleteCategorieCompetance(Categorie_competance cc) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "DELETE FROM " + tableName + " WHERE id = ?";

        return dataAccess.executeSQL(con, sql, cc.getIdCompetanceCategorie());
    }

    public static int updateCategorieCompetance(Categorie_competance cc) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "UPDATE "+ tableName +
                " SET nomCompetanceCategorie =?, descriptionCompetanceCategorie=?" +
                "   WHERE idCompetanceCategorie = ?";

        return dataAccess.executeSQL(con, sql,
                cc.getNomCompetanceCategorie(),
                cc.getDescriptionCompetanceCategorie(),
                cc.getIdCompetanceCategorie());
    }

    public static Categorie_competance findCategorieCompetance(int id) throws dataAccessException, SQLException {
        Categorie_competance cc = null;
        // get database connection
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "SELECT * FROM " + tableName + " WHERE id = ?";
        ResultSet result = dataAccess.select(con, sql, id);

        if (result.next()) {
            cc = map(result);
        }

        return cc;
    }

}
