package dataAccess;

import model.Categorie_projet;
import model.Projet;
import DB.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 10/12/2016.
 */
public class ProjetDA {
    private final static String tableName = "projet";
    private final static String tableName2 = "categorie_projet";
    public static ArrayList<Projet> getProjetList()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "
                + tableName + " INNER JOIN "
                +tableName2 + " on "
                + tableName2 + ".idProjetCategorie = " + tableName + ".idProjetCategorie";
        ResultSet result = dataAccess.select(con, sql);
        ArrayList<Projet> list = new ArrayList<Projet>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertProjet(Projet p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (nomProjet, descriptionProjet,projetProjet,imageProjet,etoileProjet,idProjetCategorie) "
                + "VALUES ( ?, ? , ?, ? , ?, ? )";
        return dataAccess.executeSQL(con, sql,
                p.getNomProjet(),
                p.getDescriptionProjet(),
                p.getProjetProjet(),
                p.getImageProjet(),
                p.isEtoileProjet(),
                p.getCategorie_projet().getIdProjetCategorie()
        );
    }
    public static int deleteProjet(Projet p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE idProjet = ?";
        return dataAccess.executeSQL(con, sql, p.getIdProjet());
    }
    public static Projet findProjet(int id) throws dataAccessException,SQLException {
        Projet p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName +"," + tableName2 + " WHERE idProjet = ? and " + tableName+".idProjetCategorie = "+ tableName2+".idProjetCategorie";
        ResultSet result = dataAccess.select(con, sql, id);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateProjet(Projet p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
                +" SET nomProjet = ? , descriptionProjet = ?,projetProjet = ?,imageProjet = ?,etoileProjet = ?, idProjetCategorie = ?"
                +" where idProjet = ?";
        return dataAccess.executeSQL(con, sql,
                p.getNomProjet(),
                p.getDescriptionProjet(),
                p.getProjetProjet(),
                p.getImageProjet(),
                p.isEtoileProjet(),
                p.getCategorie_projet().getIdProjetCategorie(),
                p.getIdProjet()
                );
    }
    private static Projet map(ResultSet resultSet) throws SQLException {
        Projet p = new Projet();
        Categorie_projet pp = new Categorie_projet();
        p.setIdProjet(resultSet.getInt("idProjet"));
        p.setNomProjet(resultSet.getString("nomProjet"));
        p.setImageProjet(resultSet.getString("imageProjet"));
        p.setDescriptionProjet(resultSet.getString("descriptionProjet"));
        p.setProjetProjet(resultSet.getString("projetProjet"));
        p.setEtoileProjet(resultSet.getBoolean("etoileProjet"));
        p.setCategorie_projet(pp);
        pp.setIdProjetCategorie(resultSet.getInt("idProjetCategorie"));
        pp.setNomProjetCategorie(resultSet.getString("nomProjetCategorie"));
        pp.setDescriptionProjetCategorie(resultSet.getString("descriptionProjetCategorie"));
        pp.setImageProjetCategorie(resultSet.getString("imageProjetCategorie"));
        return p;
    }

}
