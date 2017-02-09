package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Administrateur;
import model.Categorie_competance;
import model.Competance;
import model.Profile;
import utility.UtilHelper;

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
        if (result.next()){
            Administrateur administrateur = map(result);
            UtilHelper.close(result);
            UtilHelper.close(con);
            return administrateur;
        }
        else{
            UtilHelper.close(result);
            UtilHelper.close(con);
            return null;
        }
    }
    public static int updateAdministrateur(Administrateur admin) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName + " SET password = ?,username = ? where 1=1 ";
        int i = dataAccess.executeSQL(con, sql,
                admin.getPassword(),
                admin.getUsername());
        UtilHelper.close(con);
        return i;
    }

    private static Administrateur map(ResultSet resultSet) throws SQLException {
        Administrateur c = new Administrateur();
        c.setUsername(resultSet.getString("username"));
        c.setPassword(resultSet.getString("password"));
        c.setExperience(experienceDA.getExperienceList());
        c.setDomaine(domaineDA.getDomaineList());
        c.setProfile(ProfileDA.getProfileList());
        c.setProjet(ProjetDA.getProjetList());
        c.setPortfolio(portfolioDA.getPortfolio());
        return c;
    }
}
