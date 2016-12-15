package model; /***********************************************************************
 * Module:  Domaine.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Domaine
 ***********************************************************************/

import java.util.*;

/** @pdOid 5a245c12-a164-4f03-9e0a-588f702a0328 */
public class Domaine {
   /** @pdOid f5c73849-ba97-4a86-b0b5-4786e6d803c8 */
   private int idDomaine;
   /** @pdOid 9e6af542-d99a-417e-a09c-93197f3f5fcd */
   private String nomDomaine;
   /** @pdOid b0de1771-bdb4-40ce-9105-175c74c1ecf3 */
   private String descriptionDomaine;
   /** @pdOid 5b293ff8-6f26-4541-8925-e21861c7e50b */
   private String imageDomaine;

   public Domaine(){

   }
   public Domaine(String nomDomaine, String descriptionDomaine, String imageDomaine) {
      idDomaine=0;
      this.nomDomaine = nomDomaine;
      this.descriptionDomaine = descriptionDomaine;
      this.imageDomaine = imageDomaine;
   }

   public int getIdDomaine() {
      return idDomaine;
   }

   public void setIdDomaine(int idDomaine) {
      this.idDomaine = idDomaine;
   }

   public String getNomDomaine() {
      return nomDomaine;
   }

   public void setNomDomaine(String nomDomaine) {
      this.nomDomaine = nomDomaine;
   }

   public String getDescriptionDomaine() {
      return descriptionDomaine;
   }

   public void setDescriptionDomaine(String descriptionDomaine) {
      this.descriptionDomaine = descriptionDomaine;
   }

   public String getImageDomaine() {
      return imageDomaine;
   }

   public void setImageDomaine(String imageDomaine) {
      this.imageDomaine = imageDomaine;
   }

   @Override
   public String toString() {
      return "Domaine{" +
              "idDomaine=" + idDomaine +
              ", nomDomaine='" + nomDomaine + '\'' +
              ", descriptionDomaine='" + descriptionDomaine + '\'' +
              ", imageDomaine='" + imageDomaine + '\'' +
              '}';
   }
}