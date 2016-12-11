package model;
/***********************************************************************
 * Module:  Categorie_projet.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Categorie_projet
 ***********************************************************************/

import java.util.*;

/** @pdOid 76e9cb2a-a8bb-4f56-8560-ebe43f039dd3 */
public class Categorie_projet {
   /** @pdOid 08a2e4ff-636d-4dff-9b23-a97002d69fd8 */
   private int idProjetCategorie;
   /** @pdOid f9f60a7e-c803-4c5f-b130-89bd7cca4ed2 */
   private String nomProjetCategorie;
   /** @pdOid 921eeeae-b6e3-429c-9e40-d3503c596a2b */
   private String descriptionProjetCategorie;
   /** @pdOid 1cc6b7ff-45b9-49ba-828f-d90bc2131ebd */
   private String imageProjetCategorie;

   @Override
   public String toString() {
      return "Categorie_projet{" +
              "idProjetCategorie=" + idProjetCategorie +
              ", nomProjetCategorie='" + nomProjetCategorie + '\'' +
              ", descriptionProjetCategorie='" + descriptionProjetCategorie + '\'' +
              ", imageProjetCategorie='" + imageProjetCategorie + '\'' +
              '}';
   }

   public int getIdProjetCategorie() {
      return idProjetCategorie;
   }

   public void setIdProjetCategorie(int idProjetCategorie) {
      this.idProjetCategorie = idProjetCategorie;
   }

   public String getNomProjetCategorie() {
      return nomProjetCategorie;
   }

   public void setNomProjetCategorie(String nomProjetCategorie) {
      this.nomProjetCategorie = nomProjetCategorie;
   }

   public String getDescriptionProjetCategorie() {
      return descriptionProjetCategorie;
   }

   public void setDescriptionProjetCategorie(String descriptionProjetCategorie) {
      this.descriptionProjetCategorie = descriptionProjetCategorie;
   }

   public String getImageProjetCategorie() {
      return imageProjetCategorie;
   }

   public void setImageProjetCategorie(String imageProjetCategorie) {
      this.imageProjetCategorie = imageProjetCategorie;
   }
}