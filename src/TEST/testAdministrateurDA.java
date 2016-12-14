package TEST;

import dataAccess.AdministrateurDA;
import model.Administrateur;

import java.sql.SQLException;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testAdministrateurDA {

    public static void main(String[] Args) throws SQLException{

        Administrateur a = AdministrateurDA.getAdministrateur();

        System.out.println(a.getProjet().size());
        AdministrateurDA.updateAdministrateur(AdministrateurDA.getAdministrateur());
        a = AdministrateurDA.getAdministrateur();
        System.out.println(a);

    }
}
