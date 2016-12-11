package model; /***********************************************************************
 * Module:  Cursus.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Cursus
 ***********************************************************************/

import java.util.*;

/** @pdOid 997c9cde-94b4-4cc2-9e05-f148923fa078 */
public class Cursus {
   /** @pdOid 3f7446f2-1331-45a5-b14d-25e1d938c86b */
   private int id_cursus;
   /** @pdOid d9ca363e-51ca-46e3-9e88-28bcce31f12a */
   private String nomCursus;
   /** @pdOid 2d4ad5e6-d075-43ec-9700-6fde57363452 */
   private String annee_debutCursus;
   /** @pdOid 89303d69-a5d5-43bf-9e68-4081d3030372 */
   private String annee_finCursus;
   /** @pdOid 55c46d35-0dec-4954-acd1-560b4e325736 */
   private String etablissementCursus;
   /** @pdOid 0d458ac7-a9a2-4ed6-86b1-afc8da144a21 */
   private String remarqueCursus;

   public int getId_cursus() {
      return id_cursus;
   }

   public void setId_cursus(int id_cursus) {
      this.id_cursus = id_cursus;
   }

   public String getNomCursus() {
      return nomCursus;
   }

   public void setNomCursus(String nomCursus) {
      this.nomCursus = nomCursus;
   }

   public String getAnnee_debutCursus() {
      return annee_debutCursus;
   }

   public void setAnnee_debutCursus(String annee_debutCursus) {
      this.annee_debutCursus = annee_debutCursus;
   }

   public String getAnnee_finCursus() {
      return annee_finCursus;
   }

   public void setAnnee_finCursus(String annee_finCursus) {
      this.annee_finCursus = annee_finCursus;
   }

   public String getEtablissementCursus() {
      return etablissementCursus;
   }

   public void setEtablissementCursus(String etablissementCursus) {
      this.etablissementCursus = etablissementCursus;
   }

   public String getRemarqueCursus() {
      return remarqueCursus;
   }

   public void setRemarqueCursus(String remarqueCursus) {
      this.remarqueCursus = remarqueCursus;
   }
}