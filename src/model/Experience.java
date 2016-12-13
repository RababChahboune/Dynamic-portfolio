package model; /***********************************************************************
 * Module:  Experience.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Experience
 ***********************************************************************/

import java.util.*;

/** @pdOid 92091e55-7206-466d-99de-d49e6aac8e51 */
public class Experience {
   /** @pdOid 2d151617-25f1-4ac1-b53c-0cd7196dfb27 */
   private String nomExperience;
   /** @pdOid 77bf5897-9a06-4560-bb4b-9f429bac3a67 */
   private String logoExperience;
   private int idExperience;

   public String getNomExperience() {
      return nomExperience;
   }

   public void setNomExperience(String nomExperience) {
      this.nomExperience = nomExperience;
   }

   public String getLogoExperience() {
      return logoExperience;
   }

   public void setLogoExperience(String logoExperience) {
      this.logoExperience = logoExperience;
   }

   public int getIdExperience() {
      return idExperience;
   }

   public void setIdExperience(int idExperience) {
      this.idExperience = idExperience;
   }

   @Override
   public String toString() {
      return "Experience{" +
              "nomExperience='" + nomExperience + '\'' +
              ", logoExperience='" + logoExperience + '\'' +
              ", idExperience=" + idExperience +
              '}';
   }
}