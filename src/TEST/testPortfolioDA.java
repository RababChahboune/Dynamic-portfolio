package TEST;

import dataAccess.portfolioDA;
import model.Portfolio;
import model.Theme;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/11/2016.
 */
public class testPortfolioDA {

    public static void main(String[] Args) throws SQLException {
        Portfolio l = new Portfolio();
        Theme t = new Theme();
        t.setNomTheme("Theme2");
        /*
        l.setNomPortfolio("Portfolio");
        l.setaProposPortfolio("I am a portfolio");
        l.setSalutationPortfolio("I am the one who knocks");
        l.setTheme(t);
        l.setLogoPortfolio("portf.jpeg");*/

        //portfolioDA.insertPortfolio(l);



        Portfolio l1 =  portfolioDA.getPortfolio();
        if(l1 == null) {
            System.out.println("Portfolio not found");
        }
        else{
            System.out.println(l1);
        }

        l1.setNomPortfolio("newPortfolio");
        l1.setLogoPortfolio("port.jpeg");
        l1.setSalutationPortfolio("Hello there");
        l1.setTheme(t);
        portfolioDA.updatePortfolio(l1);
        l1 = portfolioDA.getPortfolio();
        System.out.println(l1);
    }
}
