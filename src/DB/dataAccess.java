package DB;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

/**
 * Created by Reda BENCHRAA on 10/12/2016.
 */
public class dataAccess {

    private static final String FILE_PROPERTIES   = "dataAccess/dataAccess.properties";
    private static final String PROPERTY_DRIVER   = "DB_DRIVER";
    private static final String PROPERTY_URL      = "DB_URL";
    private static final String PROPERTY_NAME     = "DB_NAME";
    private static final String PROPERTY_USER     = "DB_USER";
    private static final String PROPERTY_PASSWORD = "DB_PASS";

    public String db_url;
    public static String db_name;
    public String db_user;
    public String db_pass;

    public static void setDbname(String name){
        db_name = name;
    }

    public dataAccess(String db_url, String db_name,String db_user, String db_pass) {
        this.db_url = db_url;
        this.db_user = db_user;
        this.db_pass = db_pass;
    }
    public static dataAccess getInstance() throws dataAccessException {
        Properties properties = new Properties();
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        InputStream propertiesFile= classLoader.getResourceAsStream(FILE_PROPERTIES);
        try {
            properties.load(propertiesFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        if (propertiesFile == null) {
            throw new dataAccessException("File " + FILE_PROPERTIES + " not found.");
        }

        String url=properties.getProperty(PROPERTY_URL);
        String driver=properties.getProperty(PROPERTY_DRIVER);
        String name=properties.getProperty(PROPERTY_NAME);
        String user=properties.getProperty(PROPERTY_USER);
        String password=properties.getProperty(PROPERTY_PASSWORD);
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            throw new dataAccessException("Driver not found.", e);
        }
        dataAccess instance = new dataAccess(url, name, user, password);
        return instance;
    }
    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(db_url + db_name, db_user, db_pass);
    }

    public static int executeSQL(Connection conn, String sql, Object...params) throws dataAccessException{
        int rows = 0;
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++)
                stmt.setObject(i + 1, params[i]);
            rows = stmt.executeUpdate();

        } catch (Exception e) {
            throw new dataAccessException(e);
        }

        return rows;
    }
    public static ResultSet select(Connection conn, String sql, Object...params) throws dataAccessException, SQLException{
        ResultSet rs = null;
        try {
            PreparedStatement stmt = conn.prepareStatement(sql);
            for (int i = 0; i < params.length; i++)
                stmt.setObject(i + 1, params[i]);

            rs = stmt.executeQuery();
        } catch (Exception e) {
            throw new dataAccessException(e);
        }
        return rs;
    }

}
