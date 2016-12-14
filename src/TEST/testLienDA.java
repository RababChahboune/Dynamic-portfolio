package TEST;

import dataAccess.lienDA;
import model.Lien;
import model.Profile;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testLienDA {

    public static void main(String[] Args) throws SQLException{

        Lien l = new Lien();
        l.setNomLien("facebook");
        l.setImageLien("facebook.jpg");
        l.setUrlLien("www.facebook.com/profile1");
        Profile p = new Profile();
        p.setIdProfile(1);

       // lienDA.insertLien(l,p);
       // lienDA.insertLien(l,p);


        ArrayList<Lien> ll = lienDA.getLienList(p);
        System.out.println(ll);

        Lien l1 =  lienDA.findLien(2);
        if(l1 != null){
            lienDA.deleteLien(l1);
        }
        else{
            System.out.println("Link not found");
        }

        ll = lienDA.getLienList(p);
        System.out.println(ll);

        l1 =  lienDA.findLien(7);
        l1.setUrlLien("facebook.com/dynamicPortfolio");
        lienDA.updateLien(l1,p);
        System.out.println(l1);



    }

}
