package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Administrateur;
import model.Categorie_competance;
import model.Competance;
import model.Profile;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class AdministrateurDA {
    private final static String tableName = "administrateur";
    public static Administrateur getAdministrateur()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName;
        ResultSet result = dataAccess.select(con, sql);
        if (result.next())
            return map(result);
        else
            return null;
    }
    public static int updateAdministrateur(String password) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName + " SET password = ? where 1=1 ";
        return dataAccess.executeSQL(con, sql,password);
    }

    private static Administrateur map(ResultSet resultSet) throws SQLException {
        Administrateur c = new Administrateur();
        c.setUsername(resultSet.getString("username"));
        c.setPassword(resultSet.getString("password"));
        return c;
    }
}