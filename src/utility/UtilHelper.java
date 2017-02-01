package utility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Reda BENCHRAA on 2/1/2017.
 */
public class UtilHelper {
    public static void close(ResultSet ob){
        if(ob != null) try {
            ob.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void close(Connection ob){
        if(ob != null) try {
            ob.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
