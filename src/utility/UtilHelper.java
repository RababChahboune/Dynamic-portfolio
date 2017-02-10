package utility;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.concurrent.TimeUnit;

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
    public static long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
        long diffInMillies = date2.getTime() - date1.getTime();
        return timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS);
    }
}
