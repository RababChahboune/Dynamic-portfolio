package model; /***********************************************************************
 * Module:  Visiteur.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Visiteur
 ***********************************************************************/

import java.util.*;

/** @pdOid 8001d369-d4a0-4886-89fe-c1ed627bedcd */
public class Visiteur extends Utilisateur {
   /** @pdOid e9361c8a-8b3f-499e-888c-9f336bcf358a */
   private String nomCompletVisiteur;
   
   /** @pdRoleInfo migr=no name=Courrier assc=Association_9 coll=java.util.Collection mult=* */
   public Collection<Courrier> courrier;
   
   
   /** @pdGenerated default getter */
   public Collection<Courrier> getCourrier() {
      if (courrier == null)
         courrier = new Vector<Courrier>();
      return courrier;
   }
   
   /** @pdGenerated default iterator getter */
   public Iterator getIteratorCourrier() {
      if (courrier == null)
         courrier = new Vector<Courrier>();
      return courrier.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newCourrier */
   public void setCourrier(Collection<Courrier> newCourrier) {
      removeAllCourrier();
      for (Iterator iter = newCourrier.iterator(); iter.hasNext();)
         addCourrier((Courrier)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newCourrier */
   public void addCourrier(Courrier newCourrier) {
      if (newCourrier == null)
         return;
      if (this.courrier == null)
         this.courrier = new Vector<Courrier>();
      if (!this.courrier.contains(newCourrier))
         this.courrier.add(newCourrier);
   }
   
   /** @pdGenerated default remove
     * @param oldCourrier */
   public void removeCourrier(Courrier oldCourrier) {
      if (oldCourrier == null)
         return;
      if (this.courrier != null)
         if (this.courrier.contains(oldCourrier))
            this.courrier.remove(oldCourrier);
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllCourrier() {
      if (courrier != null)
         courrier.clear();
   }

}