package TEST;

import dataAccess.CompetanceDA;
import model.Competance;
import model.Profile;

import java.sql.SQLException;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testCompetanceDA {

    public static void main(String[] Args) throws SQLException {
        Profile p = new Profile();
        p.setIdProfile(1);
        Competance c1 = new Competance();

        /*c1.setNomCompetance("java");
        c1.setPourcentageCompetance(50);
        c1.setCategorie_competance(cc1);

        Competance c2 = new Competance();

        c2.setNomCompetance("C");
        c2.setPourcentageCompetance(60);
        c2.setCategorie_competance(cc1);

        CompetanceDA.insertCompetance(c2,p);
        CompetanceDA.insertCompetance(c1,p);
        ArrayList<Competance> cl = CompetanceDA.getCompetanceList();

        for(Competance c:cl){
            System.out.println(c);
        }*/

        Competance c3 = new Competance();

        c3 = CompetanceDA.findCompetance(1);

        c3.setNomCompetance("Python");
        c3.setPourcentageCompetance(65);


        /*if(c3 !=null){
            CompetanceDA.deleteCompetance(c3);
        }
        else{
            System.out.println("c not found");
        }*/
        if(c3 !=null){
            CompetanceDA.updateCompetance(c3,p);
        }
        else{
            System.out.println("c not found");
        }



    }

}
