package TEST;

import dataAccess.Categorie_competanceDA;
import dataAccess.CompetanceDA;
import model.Categorie_competance;
import model.Competance;
import model.Profile;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testCompetanceAndComCatDA {

    public static void main(String[] Args) throws SQLException {

        Categorie_competance cc1= new Categorie_competance();
        /*Categorie_competance cc2= new Categorie_competance();
        cc1.setNomCompetanceCategorie("Programming");
        cc1.setDescriptionCompetanceCategorie("You can do stuff with the computer");


        cc2.setNomCompetanceCategorie("Economics");
        cc2.setDescriptionCompetanceCategorie("You can do stuff with numbers");

        Categorie_competanceDA.insertCategorieCompetance(cc1);
        Categorie_competanceDA.insertCategorieCompetance(cc2)

        ArrayList<Categorie_competance> ccl = Categorie_competanceDA.getCategorieCompetanceList();
        for (Categorie_competance c : ccl){
            System.out.println(c);
        }*/

        cc1 = Categorie_competanceDA.findCategorieCompetance(3);
        /*
        if(cc1 != null){
            Categorie_competanceDA.deleteCategorieCompetance(cc1);
        }
        else{
            System.out.println("cc not found");
        }

        cc2 = Categorie_competanceDA.findCategorieCompetance(2);
        cc2.setDescriptionCompetanceCategorie("You can do stuff with stocks");

        if(cc2 != null){
            Categorie_competanceDA.updateCategorieCompetance(cc2);
        }
        else{
            System.out.println("cc not found");
        }

        cc2 = Categorie_competanceDA.findCategorieCompetance(2);
        System.out.println(cc2);*/

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
