package TEST;

import dataAccess.CompetanceDA;
import dataAccess.ProfileDA;
import dataAccess.cursusDA;
import dataAccess.lienDA;
import model.Competance;
import model.Cursus;
import model.Lien;
import model.Profile;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testProfileDA {

    public static void main(String[] Args) throws SQLException{

        Profile p = new Profile();
        p.setNomProfile("chahboune");
        p.setPrenomProfile("rabab");
        p.setBiographieProfile("I god damn rock");
        p.setEmailProfile("rabab.chahboune@gmail.com");
        p.setImageProfile("cute.jpeg");
        p.setTelephoneProfile("0618276271");

        Profile p2 = new Profile();
        p2.setNomProfile("Benchraa");
        p2.setPrenomProfile("Reda");
        p2.setBiographieProfile("I am the one who knocks");
        p2.setEmailProfile("medreda.benchraa@gmail.com");
        p2.setImageProfile("sexy.jpeg");
        p2.setTelephoneProfile("0618276271");

        //ProfileDA.insertProfile(p);
        //ProfileDA.insertProfile(p2);

        ArrayList<Profile> pl = ProfileDA.getProfileList();

        for(Profile profile : pl){
            System.out.println(profile);
        }

        /*p = ProfileDA.findProfile(1);
        if(p!= null){
            ProfileDA.deleteProfile(p);
        }
        else{
            System.out.println("Profile not found");
        }*/

        p = ProfileDA.findProfile(2);
        if(p== null){
            System.out.println("Profile not found");
        }
        else{

            p.setBiographieProfile("I am the one who kisses");
            ProfileDA.updateProfile(p);
            System.out.println(p);
        }


    }
}
