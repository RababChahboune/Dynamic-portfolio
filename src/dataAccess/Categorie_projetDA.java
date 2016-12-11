package dataAccess;
import model.Categorie_projet;
import DB.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 * Created by Reda BENCHRAA on 10/12/2016.
 */
public class Categorie_projetDA
{
    private final static String tableName = "Categorie_projet";
    public static ArrayList<Categorie_projet> getCategorie_projetList()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "+tableName;
        ResultSet result = dataAccess.select(con, sql);
        ArrayList<Categorie_projet> list = new ArrayList<Categorie_projet>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertCategorie_projet(Categorie_projet p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (nomProjetCategorie,descriptionProjetCategorie,imageProjetCategorie) "
                + "VALUES ( ?, ? , ? )";
        return dataAccess.executeSQL(con, sql,
                p.getNomProjetCategorie(),
                p.getDescriptionProjetCategorie(),
                p.getImageProjetCategorie()
        );
    }
    public static int deleteCategorie_projet(Categorie_projet p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE idProjetCategorie = ?";
        return dataAccess.executeSQL(con, sql, p.getIdProjetCategorie());
    }
    public static Categorie_projet findCategorie_projet(String key,Object value) throws dataAccessException,SQLException {
        Categorie_projet p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE "+key+" = ?";
        ResultSet result = dataAccess.select(con, sql,value);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateCategorie_projet(Categorie_projet p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
                +" SET nomProjetCategorie = ? , descriptionProjetCategorie = ?,imageProjetCategorie = ?"
                +" where idProjetCategorie = ?";
        return dataAccess.executeSQL(con, sql,
                p.getNomProjetCategorie(),
                p.getDescriptionProjetCategorie(),
                p.getImageProjetCategorie(),
                p.getIdProjetCategorie()
        );
    }
    private static Categorie_projet map(ResultSet resultSet) throws SQLException {
        Categorie_projet pp = new Categorie_projet();
        pp.setIdProjetCategorie(resultSet.getInt("idProjetCategorie"));
        pp.setNomProjetCategorie(resultSet.getString("nomProjetCategorie"));
        pp.setDescriptionProjetCategorie(resultSet.getString("descriptionProjetCategorie"));
        pp.setImageProjetCategorie(resultSet.getString("imageProjetCategorie"));
        return pp;
    }
}
