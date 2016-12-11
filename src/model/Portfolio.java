package model; /***********************************************************************
 * Module:  Portfolio.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Portfolio
 ***********************************************************************/

import java.util.*;

/** @pdOid a038e666-20fa-4684-972c-127f8419eecd */
public class Portfolio {
   /** @pdOid e82fd971-59a5-43ce-8b2a-141057daaa19 */
   private String nomPortfolio;
   /** @pdOid e48918bb-adef-41b5-b70b-8818f24de20e */
   private String aProposPortfolio;
   /** @pdOid 7973f2b9-f99a-447e-997a-083142e6ec4f */
   private String logoPortfolio;
   /** @pdOid 1f3f182d-e888-442d-8864-8d31e9c5889a */
   private String salutationPortfolio;
   
   /** @pdRoleInfo migr=no name=Theme assc=association11 mult=1..1 type=Aggregation */
   public Theme theme;

   public String getNomPortfolio() {
      return nomPortfolio;
   }

   public void setNomPortfolio(String nomPortfolio) {
      this.nomPortfolio = nomPortfolio;
   }

   public String getaProposPortfolio() {
      return aProposPortfolio;
   }

   public void setaProposPortfolio(String aProposPortfolio) {
      this.aProposPortfolio = aProposPortfolio;
   }

   public String getLogoPortfolio() {
      return logoPortfolio;
   }

   public void setLogoPortfolio(String logoPortfolio) {
      this.logoPortfolio = logoPortfolio;
   }

   public String getSalutationPortfolio() {
      return salutationPortfolio;
   }

   public void setSalutationPortfolio(String salutationPortfolio) {
      this.salutationPortfolio = salutationPortfolio;
   }

   public Theme getTheme() {
      return theme;
   }

   public void setTheme(Theme theme) {
      this.theme = theme;
   }
}