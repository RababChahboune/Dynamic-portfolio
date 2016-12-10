package model; /***********************************************************************
 * Module:  Administrateur.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Administrateur
 ***********************************************************************/

import java.util.*;

/** @pdOid c2271bda-f40f-4c83-a038-65ba920c0346 */
public class Administrateur extends Utilisateur {
   /** @pdOid c80f72e1-54c7-426a-89cb-2525117434ba */
   private String username;
   /** @pdOid bcc6dff0-d000-45fc-800d-b892dead8521 */
   private String password;
   
   /** @pdRoleInfo migr=no name=Portfolio assc=association10 mult=1..1 type=Aggregation */
   public Portfolio portfolio;
   /** @pdRoleInfo migr=no name=Profile assc=association12 coll=java.util.Collection impl=java.util.HashSet mult=0..* type=Aggregation */
   public Collection<Profile> profile;
   /** @pdRoleInfo migr=no name=Projet assc=association9 coll=java.util.Collection impl=java.util.HashSet mult=0..* type=Aggregation */
   public Collection<Projet> projet;
   /** @pdRoleInfo migr=no name=Experience assc=association18 coll=java.util.Collection impl=java.util.HashSet mult=0..* type=Aggregation */
   public Collection<Experience> experience;
   /** @pdRoleInfo migr=no name=Domaine assc=association17 coll=java.util.Collection impl=java.util.HashSet mult=0..* type=Aggregation */
   public Collection<Domaine> domaine;
   
   
   /** @pdGenerated default getter */
   public Collection<Profile> getProfile() {
      if (profile == null)
         profile = new HashSet<Profile>();
      return profile;
   }
   
   /** @pdGenerated default iterator getter */
   public Iterator getIteratorProfile() {
      if (profile == null)
         profile = new HashSet<Profile>();
      return profile.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newProfile */
   public void setProfile(Collection<Profile> newProfile) {
      removeAllProfile();
      for (Iterator iter = newProfile.iterator(); iter.hasNext();)
         addProfile((Profile)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newProfile */
   public void addProfile(Profile newProfile) {
      if (newProfile == null)
         return;
      if (this.profile == null)
         this.profile = new HashSet<Profile>();
      if (!this.profile.contains(newProfile))
         this.profile.add(newProfile);
   }
   
   /** @pdGenerated default remove
     * @param oldProfile */
   public void removeProfile(Profile oldProfile) {
      if (oldProfile == null)
         return;
      if (this.profile != null)
         if (this.profile.contains(oldProfile))
            this.profile.remove(oldProfile);
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllProfile() {
      if (profile != null)
         profile.clear();
   }
   /** @pdGenerated default getter */
   public Collection<Projet> getProjet() {
      if (projet == null)
         projet = new HashSet<Projet>();
      return projet;
   }
   
   /** @pdGenerated default iterator getter */
   public Iterator getIteratorProjet() {
      if (projet == null)
         projet = new HashSet<Projet>();
      return projet.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newProjet */
   public void setProjet(Collection<Projet> newProjet) {
      removeAllProjet();
      for (Iterator iter = newProjet.iterator(); iter.hasNext();)
         addProjet((Projet)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newProjet */
   public void addProjet(Projet newProjet) {
      if (newProjet == null)
         return;
      if (this.projet == null)
         this.projet = new HashSet<Projet>();
      if (!this.projet.contains(newProjet))
         this.projet.add(newProjet);
   }
   
   /** @pdGenerated default remove
     * @param oldProjet */
   public void removeProjet(Projet oldProjet) {
      if (oldProjet == null)
         return;
      if (this.projet != null)
         if (this.projet.contains(oldProjet))
            this.projet.remove(oldProjet);
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllProjet() {
      if (projet != null)
         projet.clear();
   }
   /** @pdGenerated default getter */
   public Collection<Experience> getExperience() {
      if (experience == null)
         experience = new HashSet<Experience>();
      return experience;
   }
   
   /** @pdGenerated default iterator getter */
   public Iterator getIteratorExperience() {
      if (experience == null)
         experience = new HashSet<Experience>();
      return experience.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newExperience */
   public void setExperience(Collection<Experience> newExperience) {
      removeAllExperience();
      for (Iterator iter = newExperience.iterator(); iter.hasNext();)
         addExperience((Experience)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newExperience */
   public void addExperience(Experience newExperience) {
      if (newExperience == null)
         return;
      if (this.experience == null)
         this.experience = new HashSet<Experience>();
      if (!this.experience.contains(newExperience))
         this.experience.add(newExperience);
   }
   
   /** @pdGenerated default remove
     * @param oldExperience */
   public void removeExperience(Experience oldExperience) {
      if (oldExperience == null)
         return;
      if (this.experience != null)
         if (this.experience.contains(oldExperience))
            this.experience.remove(oldExperience);
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllExperience() {
      if (experience != null)
         experience.clear();
   }
   /** @pdGenerated default getter */
   public Collection<Domaine> getDomaine() {
      if (domaine == null)
         domaine = new HashSet<Domaine>();
      return domaine;
   }
   
   /** @pdGenerated default iterator getter */
   public Iterator getIteratorDomaine() {
      if (domaine == null)
         domaine = new HashSet<Domaine>();
      return domaine.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newDomaine */
   public void setDomaine(Collection<Domaine> newDomaine) {
      removeAllDomaine();
      for (Iterator iter = newDomaine.iterator(); iter.hasNext();)
         addDomaine((Domaine)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newDomaine */
   public void addDomaine(Domaine newDomaine) {
      if (newDomaine == null)
         return;
      if (this.domaine == null)
         this.domaine = new HashSet<Domaine>();
      if (!this.domaine.contains(newDomaine))
         this.domaine.add(newDomaine);
   }
   
   /** @pdGenerated default remove
     * @param oldDomaine */
   public void removeDomaine(Domaine oldDomaine) {
      if (oldDomaine == null)
         return;
      if (this.domaine != null)
         if (this.domaine.contains(oldDomaine))
            this.domaine.remove(oldDomaine);
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllDomaine() {
      if (domaine != null)
         domaine.clear();
   }

}