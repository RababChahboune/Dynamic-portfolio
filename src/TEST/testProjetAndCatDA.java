package TEST;

import dataAccess.Categorie_projetDA;
import dataAccess.ProjetDA;
import model.Categorie_projet;
import model.Projet;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Reda BENCHRAA on 10/12/2016.
 */
public class testProjetAndCatDA {

    public static void main(String [] args) throws SQLException {
        Categorie_projet cp = new Categorie_projet();
        cp.setNomProjetCategorie("3D");
        cp.setDescriptionProjetCategorie("All 3d Work");
        cp.setImageProjetCategorie("3D.jpg");

        Categorie_projet cp2 = new Categorie_projet();
        cp2.setNomProjetCategorie("4D");
        cp2.setDescriptionProjetCategorie("All 3d Work");
        cp2.setImageProjetCategorie("4D.jpg");

        Categorie_projetDA.insertCategorie_projet(cp);
        Categorie_projetDA.insertCategorie_projet(cp2);

        ArrayList<Categorie_projet> listCat = Categorie_projetDA.getCategorie_projetList();
        System.out.println("Liste des cat: ");
        for (Categorie_projet c:listCat){
            System.out.println(c);
        }

        Categorie_projet f= Categorie_projetDA.findCategorie_projet("idProjetCategorie",2);
        if(f == null) System.out.println("Caté not found");
        else {
            System.out.println(f);
            int i = Categorie_projetDA.deleteCategorie_projet(f);
            if(i>0) System.out.println("Caté deleted");
            else System.out.println("Caté not deleted");
            Categorie_projet fa= Categorie_projetDA.findCategorie_projet("idProjetCategorie",3);
            if(fa == null) System.out.println("Caté not found");
            else {
                System.out.println(fa);
            }
        }
        listCat = Categorie_projetDA.getCategorie_projetList();
        System.out.println("Liste des cat: ");
        for (Categorie_projet c:listCat){
            System.out.println(c);
        }

        Projet p = new Projet();

        p.setCategorie_projet(f);
        p.setEtoileProjet(true);
        p.setImageProjet("z.jpg");
        p.setNomProjet("z");
        p.setProjetProjet("THIS IS SMTH");
        p.setDescriptionProjet("z");

        ProjetDA.insertProjet(p);

        p.setCategorie_projet(f);
        p.setEtoileProjet(true);
        p.setImageProjet("pp.jpg");
        p.setNomProjet("Hzzzz");
        p.setProjetProjet("Tzzzz");
        p.setDescriptionProjet("Tzzzzzzz");

        ProjetDA.insertProjet(p);


        ArrayList<Projet> listProjet = ProjetDA.getProjetList();
        System.out.println("Liste des projets: ");
        for (Projet c:listProjet){
            System.out.println(c);
        }

        Projet ff= ProjetDA.findProjet(4);
        if(ff == null) System.out.println("Projet not found");
        else {
            System.out.println(ff);
            int i = ProjetDA.deleteProjet(ff);
            if(i>0) System.out.println("Projet deleted");
            else System.out.println("Projet not  deleted");
            Projet fff= ProjetDA.findProjet(4);
            if(fff == null) System.out.println("Projet not found");
            else {
                System.out.println(fff);
            }
        }
    }
}
