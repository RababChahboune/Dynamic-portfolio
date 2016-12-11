package model; /***********************************************************************
 * Module:  Competance.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Competance
 ***********************************************************************/

import java.util.*;

/** @pdOid 23af3615-a629-4257-b8b5-292f2f4f3a05 */
public class Competance {
   /** @pdOid 8d99237d-c9f9-4e95-b07c-bb121a3d4638 */
   private int idCompetance;
   /** @pdOid f7a131ee-18ea-471e-9710-e52c22e57b3b */
   private String nomCompetance;
   /** @pdOid 2f117e31-61bc-4620-a5e2-7c7053a3e692 */
   private int pourcentageCompetance;


   /** @pdRoleInfo migr=no name=Categorie_competance assc=association15 mult=1..1 type=Aggregation */
   public Categorie_competance categorie_competance;

   public void setIdCompetance(int idCompetance) {
      this.idCompetance = idCompetance;
   }

   public void setNomCompetance(String nomCompetance) {
      this.nomCompetance = nomCompetance;
   }

   public void setPourcentageCompetance(int pourcentageCompetance) {
      this.pourcentageCompetance = pourcentageCompetance;
   }

   public void setCategorie_competance(Categorie_competance categorie_competance) {
      this.categorie_competance = categorie_competance;
   }

   public int getIdCompetance() {

      return idCompetance;
   }

   public String getNomCompetance() {
      return nomCompetance;
   }

   public int getPourcentageCompetance() {
      return pourcentageCompetance;
   }

   public Categorie_competance getCategorie_competance() {
      return categorie_competance;
   }
   @Override
   public String toString() {
      return "Competance{" +
              "idCompetance=" + idCompetance +
              ", nomCompetance='" + nomCompetance + '\'' +
              ", pourcentageCompetance=" + pourcentageCompetance +
              ", categorie_competance=" + categorie_competance +
              '}';
   }
}