package TEST;

import dataAccess.domaineDA;
import model.Domaine;
import model.Domaine;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testDomaineDA {

    public static  void  main(String[] Args)throws SQLException{

        Domaine l = new Domaine();
        l.setNomDomaine("aaa");
        l.setImageDomaine("aaass.jpg");
        l.setDescriptionDomaine("we do stuff butt not so much");

        domaineDA.insertDomaine(l);
        domaineDA.insertDomaine(l);

        ArrayList<Domaine> ll = domaineDA.getDomaineList();
        System.out.println(ll);

        Domaine l1 =  domaineDA.findDomaine(2);
        if(l1 != null){
            domaineDA.deleteDomaine(l1);
        }
        else{
            System.out.println("Link not found");
        }

        ll = domaineDA.getDomaineList();
        System.out.println(ll);

        l1 =  domaineDA.findDomaine(1);
        l1.setImageDomaine("facebook.jpeg");
        domaineDA.updateDomaine(l1);
        System.out.println(l1);

    }
}
