package TEST;

import dataAccess.experienceDA;
import model.Experience;
import model.Profile;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testExperienceDA {

    public static void main(String[] Args) throws SQLException {

        Experience l = new Experience();
        l.setNomExperience("hello");
        l.setLogoExperience("hello.jpeg");



        //experienceDA.insertExperience(l);
        //l.setNomExperience("hola");
        //experienceDA.insertExperience(l);


        ArrayList<Experience> ll = experienceDA.getExperienceList();
        System.out.println(ll);

        Experience l1 =  experienceDA.findExperience("hello");
        if(l1 != null){
            experienceDA.deleteExperience(l1);
        }
        else{
            System.out.println("Link not found");
        }

        ll = experienceDA.getExperienceList();
        System.out.println(ll);

        l1 =  experienceDA.findExperience("hola");
        l1.setNomExperience("Welcome");
        experienceDA.updateExperience(l1);
        System.out.println(l1);



    }


}
