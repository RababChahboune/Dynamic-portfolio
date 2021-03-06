package model; /***********************************************************************
 * Module:  Lien.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Lien
 ***********************************************************************/

import java.util.*;

/** @pdOid 66420e6c-b14e-4184-8288-2202c543ba1e */
public class Lien {
   /** @pdOid 2dbfc8de-2c10-4f90-b552-add8a8f265bf */
   private int idLien;
   /** @pdOid d05e074e-655f-42e4-a853-776dcbfaf28b */
   private String nomLien;
   /** @pdOid e04fb298-6b87-4683-b41e-5eab112905f4 */
   private String urlLien;
   /** @pdOid b800e25e-bc33-4640-bba5-011aeaeb0fd8 */
   private String imageLien;

   public int getIdLien() {
      return idLien;
   }

   public void setIdLien(int idLien) {
      this.idLien = idLien;
   }

   public String getNomLien() {
      return nomLien;
   }

   public void setNomLien(String nomLien) {
      this.nomLien = nomLien;
   }

   public String getUrlLien() {
      return urlLien;
   }

   public void setUrlLien(String urlLien) {
      this.urlLien = urlLien;
   }

   public String getImageLien() {
      return imageLien;
   }

   public void setImageLien(String imageLien) {
      this.imageLien = imageLien;
   }

   @Override
   public String toString() {
      return "Lien{" +
              "idLien=" + idLien +
              ", nomLien='" + nomLien + '\'' +
              ", urlLien='" + urlLien + '\'' +
              ", imageLien='" + imageLien + '\'' +
              '}';
   }
}