package dataAccess;

import DB.dataAccess;
import DB.dataAccessException;
import model.Theme;
import model.Portfolio;
import model.Profile;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class portfolioDA {
    private final static String tableName = "Portfolio";
    private final static String tableName1 = "Theme";
    public static Portfolio getPortfolio()throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();
        String sql = "SELECT * FROM " + tableName + " INNER JOIN "+tableName1+" ON "
                +tableName+".nomTheme="+tableName1+".nomTheme ;" ;
        ResultSet result = dataAccess.select(con, sql);
        ArrayList<Portfolio> list = new ArrayList<Portfolio>();

        if (result.next()) {
            return  map(result);
        }
        result.close();

        return null;
    }
    private static Portfolio map(ResultSet resultSet) throws SQLException {
        Portfolio c = new Portfolio();
        Theme cc = new Theme();
        c.setNomPortfolio(resultSet.getString("nomPortfolio"));
        c.setLogoPortfolio(resultSet.getString("logoPortfolio"));
        c.setaProposPortfolio(resultSet.getString("aProposPortfolio"));
        c.setSalutationPortfolio(resultSet.getString("salutationPortfolio"));
        cc.setNomTheme(resultSet.getString("nomTheme"));
        cc.setLienTheme(resultSet.getString("lienTheme"));
        cc.setPaletteTheme(resultSet.getString("paletteTheme"));
        c.setTheme(cc);
        return c;
    }

    public static int insertPortfolio(Portfolio Portfolio) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "INSERT INTO " + tableName +
                " (nomPortfolio, aProposPortfolio, logoPortfolio,salutationPortfolio,nomTheme) "+
                "VALUES (?, ? ,? , ? , ?)";

        return dataAccess.executeSQL(con, sql,
                Portfolio.getNomPortfolio() ,
                Portfolio.getaProposPortfolio(),
                Portfolio.getLogoPortfolio(),
                Portfolio.getSalutationPortfolio(),
                Portfolio.getTheme().getNomTheme()
        );
    }

    public static int updatePortfolio(Portfolio Portfolio) throws SQLException {
        dataAccess.setDbname("Portfolio");
        Connection con = dataAccess.getInstance().getConnection();

        String sql = "UPDATE "+ tableName +
                " SET nomPortfolio = ?,  aProposPortfolio= ?," +
                "logoPortfolio = ? , salutationPortfolio= ?, nomTheme= ?" +
                "   WHERE 1=1";

        return dataAccess.executeSQL(con, sql,
                Portfolio.getNomPortfolio() ,
                Portfolio.getaProposPortfolio(),
                Portfolio.getLogoPortfolio(),
                Portfolio.getSalutationPortfolio(),
                Portfolio.getTheme().getNomTheme()
        );
    }

}
