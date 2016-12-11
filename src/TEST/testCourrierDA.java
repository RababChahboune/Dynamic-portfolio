package TEST;

import dataAccess.courrierDA;
import model.Courrier;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testCourrierDA {

    public static void main(String[] Args) throws SQLException {

        Courrier l = new Courrier();
        l.setSujetCourrier("test");
        l.setEmailCourrier("test@test.com");
        l.setMessageCourrier("hello");
        l.setNomComplet("harry poter");




        //courrierDA.insertCourrier(l);
        //courrierDA.insertCourrier(l);

        ArrayList<Courrier> ll = courrierDA.getCourrierList();
        System.out.println(ll);
        //should we really look things up only by name?
        Courrier l1 =  courrierDA.findCourrier(1);
        if(l1 != null){
            courrierDA.deleteCourrier(l1);
        }
        else{
            System.out.println("Courrier not found");
        }

        ll = courrierDA.getCourrierList();
        System.out.println(ll);

        l1 =  courrierDA.findCourrier(2);
        if(l1 != null){
            l1.setMessageCourrier("hello01");
            System.out.println(l1);
        }
        else{
            System.out.println("Courrier not found");
        }




    }


}
