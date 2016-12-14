package utility;

/**
 * Created by Rabab Chahboune on 12/13/2016.
 */
public class Check {
    
    public static String checkInput(String parameter) {
        if (parameter == null) {
            return "0";
        } else{
            return parameter;
        }
    }
}
