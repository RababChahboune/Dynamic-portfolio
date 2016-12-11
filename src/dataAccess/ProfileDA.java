package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Profile;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class ProfileDA {
    private final static String tableName = "Profile";
    public static ArrayList<Profile> getProfileList()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM "+tableName;
        ResultSet result = dataAccess.select(con, sql);
        ArrayList<Profile> list = new ArrayList<Profile>();
        while (result.next()) {
            list.add(map(result));
        }
        result.close();
        return list;
    }
    public static int insertProfile(Profile p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "INSERT INTO " + tableName
                + " (nomProfile,prenomProfile,emailProfile,telephoneProfile,imageProfile,biographieProfile) "
                + "VALUES ( ?, ? , ?, ?, ? , ? )";
        return dataAccess.executeSQL(con, sql,
                p.getNomProfile(),
                p.getPrenomProfile(),
                p.getEmailProfile(),
                p.getTelephoneProfile(),
                p.getImageProfile(),
                p.getBiographieProfile()
        );
    }
    public static int deleteProfile(Profile p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "DELETE FROM " + tableName + " WHERE idProfile = ?";
        return dataAccess.executeSQL(con, sql, p.getIdProfile());
    }
    public static Profile findProfile(int id) throws dataAccessException,SQLException {
        Profile p = null;
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " WHERE idProfil = ?";
        ResultSet result = dataAccess.select(con, sql,id);
        if (result.next()) {
            p = map(result);
        }
        return p;
    }
    public static int updateProfile(Profile p) throws SQLException {
        dataAccess.setDbname("portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "UPDATE "+ tableName
                +" SET nomProfile= ?,prenomProfile= ?,emailProfile= ?,telephoneProfile= ?,imageProfile= ?,biographieProfile= ?"
                +" where idProfile = ?";
        return dataAccess.executeSQL(con, sql,
                p.getNomProfile(),
                p.getPrenomProfile(),
                p.getEmailProfile(),
                p.getTelephoneProfile(),
                p.getImageProfile(),
                p.getBiographieProfile(),
                p.getIdProfile()
        );
    }
    private static Profile map(ResultSet resultSet) throws SQLException {
        Profile p = new Profile();
        p.setNomProfile(resultSet.getString("nomProfile"));
        p.setPrenomProfile(resultSet.getString("prenomProfile"));
        p.setEmailProfile(resultSet.getString("emailProfile"));
        p.setTelephoneProfile(resultSet.getString("telephoneProfile"));
        p.setImageProfile(resultSet.getString("imageProfile"));
        p.setBiographieProfile(resultSet.getString("biographieProfile"));
        p.setIdProfile(resultSet.getInt("idProfile"));
        return p;
    }
}