package model; /***********************************************************************
 * Module:  Categorie_competance.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Categorie_competance
 ***********************************************************************/

import java.util.*;

/** @pdOid 78f5a9fd-eaae-48c3-a524-9357c7087102 */
public class Categorie_competance {
   /** @pdOid c05bb679-4d34-4692-92b4-75e3f021d388 */
   private int idCompetanceCategorie;
   /** @pdOid fb5d0745-b0bf-45d8-ba85-584ffd99be35 */
   private String nomCompetanceCategorie;
   /** @pdOid a972b876-78ed-4c61-91b5-d69feda211ef */
   private String descriptionCompetanceCategorie;

   @Override
   public String toString() {
      return "Categorie_competance{" +
              "idCompetanceCategorie=" + idCompetanceCategorie +
              ", nomCompetanceCategorie='" + nomCompetanceCategorie + '\'' +
              ", descriptionCompetanceCategorie='" + descriptionCompetanceCategorie + '\'' +
              '}';
   }

   public void setIdCompetanceCategorie(int idCompetanceCategorie) {
      this.idCompetanceCategorie = idCompetanceCategorie;
   }

   public void setNomCompetanceCategorie(String nomCompetanceCategorie) {
      this.nomCompetanceCategorie = nomCompetanceCategorie;
   }

   public void setDescriptionCompetanceCategorie(String descriptionCompetanceCategorie) {
      this.descriptionCompetanceCategorie = descriptionCompetanceCategorie;
   }

   public int getIdCompetanceCategorie() {

      return idCompetanceCategorie;
   }

   public String getNomCompetanceCategorie() {
      return nomCompetanceCategorie;
   }

   public String getDescriptionCompetanceCategorie() {
      return descriptionCompetanceCategorie;
   }
}