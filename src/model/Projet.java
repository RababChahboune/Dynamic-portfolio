package model; /***********************************************************************
 * Module:  Projet.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Projet
 ***********************************************************************/

import java.util.*;

/** @pdOid 45fc35bb-0b8a-4bce-85e1-1f42e8c633f6 */
public class Projet {
   /** @pdOid e9c6b2b5-4bc1-4bbc-a71e-161f5f5a28e3 */
   private int idProjet;
   /** @pdOid 69eb90a0-8cf7-47bb-860c-61830402a7df */
   private String nomProjet;
   /** @pdOid 0c9faefe-dad2-45fa-9e47-3e2390e1ed00 */
   private String descriptionProjet;
   /** @pdOid 9554b77b-842b-4dff-a5e5-94c4901f31a2 */
   private String projetProjet;
   /** @pdOid 3d60be2b-df38-4cb0-a1aa-acba907b5760 */
   private String imageProjet;
   /** @pdOid 1eb27f25-3867-4151-9e44-f3597f59effa */
   private boolean etoileProjet;
   
   /** @pdRoleInfo migr=no name=Categorie_projet assc=association8 mult=1..1 type=Aggregation */
   public Categorie_projet categorie_projet;

}