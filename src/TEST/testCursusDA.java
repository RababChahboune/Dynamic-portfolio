package TEST;

import dataAccess.cursusDA;
import model.Cursus;
import model.Profile;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testCursusDA {

    public static void main(String[] Args) throws SQLException {

        Cursus l = new Cursus();
        l.setNomCursus("ingeneering");
        l.setAnnee_debutCursus("2015");
        l.setAnnee_finCursus("2018");
        l.setEtablissementCursus("Hell");
        l.setRemarqueCursus("do not make the same mistake");

        Profile p = new Profile();
        p.setIdProfile(1);



        //cursusDA.insertCursus(l,p);
        //l.setNomCursus("something");
        //cursusDA.insertCursus(l,p);

        ArrayList<Cursus> ll = cursusDA.getCursusList(p);
        System.out.println(ll);
        //should we really look things up only by name?
        Cursus l1 =  cursusDA.findCursus(5);
        if(l1 != null){
            cursusDA.deleteCursus(l1);
        }
        else{
            System.out.println("Cursus not found");
        }

        ll = cursusDA.getCursusList(p);
        System.out.println(ll);

        l1 =  cursusDA.findCursus(6);
        if(l1 != null){
            l1.setAnnee_debutCursus("2016");
            l1.setAnnee_finCursus("2019");
            System.out.println(cursusDA.updateCursus(l1,p));
            System.out.println(l1);
        }
        else{
            System.out.println("cursus not found");
        }




    }
}
