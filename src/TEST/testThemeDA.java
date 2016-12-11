package TEST;

import dataAccess.themeDA;
import model.Theme;
import model.Theme;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testThemeDA {

    public static void main(String[] Args) throws SQLException{
        Theme l = new Theme();
        l.setNomTheme("theme1");
        l.setLienTheme("theme.css");
        l.setPaletteTheme("info");

        //themeDA.insertTheme(l);
        l.setNomTheme("theme2");
        //themeDA.insertTheme(l);

        ArrayList<Theme> ll = themeDA.getThemeList();
        System.out.println(ll);

        Theme l1 =  themeDA.findTheme("theme1");
        if(l1 != null){
            themeDA.deleteTheme(l1);
        }
        else{
            System.out.println("theme not found");
        }

        ll = themeDA.getThemeList();
        System.out.println(ll);

        l1 =  themeDA.findTheme("theme2");
        l1.setNomTheme("newTheme");
        themeDA.updateTheme(l1);
        System.out.println(l1);
    }

}
