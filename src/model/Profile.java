package model; /***********************************************************************
 * Module:  Profile.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Profile
 ***********************************************************************/

import java.util.*;

/** @pdOid d3237ece-0ae2-4098-971d-8249511b3ddd */
public class Profile {
   /** @pdOid 868adc5f-c848-4900-a8e4-dcb247e5ff51 */
   private int idProfile;
   /** @pdOid dc1cd32b-af52-49e2-8833-e66d2da2d449 */
   private String nomProfile;
   /** @pdOid d4785d29-5b63-4bbd-b35d-6356ecc390d9 */
   private String prenomProfile;
   /** @pdOid b9f63a2c-4702-4736-aa99-60d3f83d8b14 */
   private String emailProfile;
   /** @pdOid def0152c-2eef-45b6-bf2e-5d089abf8a02 */
   private String telephoneProfile;
   /** @pdOid 2473b75e-ef44-469a-8e00-83241b8833d9 */
   private String imageProfile;
   /** @pdOid f318eb2a-78fc-435f-a481-bba43bd42d19 */
   private String biographieProfile;
   
   /** @pdRoleInfo migr=no name=Lien assc=association16 coll=java.util.Collection impl=java.util.HashSet mult=0..* type=Aggregation */
   public Collection<Lien> lien;
   /** @pdRoleInfo migr=no name=Cursus assc=association14 coll=java.util.Collection impl=java.util.HashSet mult=0..* type=Aggregation */
   public Collection<Cursus> cursus;
   /** @pdRoleInfo migr=no name=Competance assc=association13 coll=java.util.Collection impl=java.util.HashSet mult=0..* type=Aggregation */
   public Collection<Competance> competance;
   
   
   /** @pdGenerated default getter */
   public Collection<Lien> getLien() {
      if (lien == null)
         lien = new HashSet<Lien>();
      return lien;
   }
   
   /** @pdGenerated default iterator getter */
   public Iterator getIteratorLien() {
      if (lien == null)
         lien = new HashSet<Lien>();
      return lien.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newLien */
   public void setLien(Collection<Lien> newLien) {
      removeAllLien();
      for (Iterator iter = newLien.iterator(); iter.hasNext();)
         addLien((Lien)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newLien */
   public void addLien(Lien newLien) {
      if (newLien == null)
         return;
      if (this.lien == null)
         this.lien = new HashSet<Lien>();
      if (!this.lien.contains(newLien))
         this.lien.add(newLien);
   }
   
   /** @pdGenerated default remove
     * @param oldLien */
   public void removeLien(Lien oldLien) {
      if (oldLien == null)
         return;
      if (this.lien != null)
         if (this.lien.contains(oldLien))
            this.lien.remove(oldLien);
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllLien() {
      if (lien != null)
         lien.clear();
   }
   /** @pdGenerated default getter */
   public Collection<Cursus> getCursus() {
      if (cursus == null)
         cursus = new HashSet<Cursus>();
      return cursus;
   }
   
   /** @pdGenerated default iterator getter */
   public Iterator getIteratorCursus() {
      if (cursus == null)
         cursus = new HashSet<Cursus>();
      return cursus.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newCursus */
   public void setCursus(Collection<Cursus> newCursus) {
      removeAllCursus();
      for (Iterator iter = newCursus.iterator(); iter.hasNext();)
         addCursus((Cursus)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newCursus */
   public void addCursus(Cursus newCursus) {
      if (newCursus == null)
         return;
      if (this.cursus == null)
         this.cursus = new HashSet<Cursus>();
      if (!this.cursus.contains(newCursus))
         this.cursus.add(newCursus);
   }
   
   /** @pdGenerated default remove
     * @param oldCursus */
   public void removeCursus(Cursus oldCursus) {
      if (oldCursus == null)
         return;
      if (this.cursus != null)
         if (this.cursus.contains(oldCursus))
            this.cursus.remove(oldCursus);
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllCursus() {
      if (cursus != null)
         cursus.clear();
   }
   /** @pdGenerated default getter */
   public Collection<Competance> getCompetance() {
      if (competance == null)
         competance = new HashSet<Competance>();
      return competance;
   }
   
   /** @pdGenerated default iterator getter */
   public Iterator getIteratorCompetance() {
      if (competance == null)
         competance = new HashSet<Competance>();
      return competance.iterator();
   }
   
   /** @pdGenerated default setter
     * @param newCompetance */
   public void setCompetance(Collection<Competance> newCompetance) {
      removeAllCompetance();
      for (Iterator iter = newCompetance.iterator(); iter.hasNext();)
         addCompetance((Competance)iter.next());
   }
   
   /** @pdGenerated default add
     * @param newCompetance */
   public void addCompetance(Competance newCompetance) {
      if (newCompetance == null)
         return;
      if (this.competance == null)
         this.competance = new HashSet<Competance>();
      if (!this.competance.contains(newCompetance))
         this.competance.add(newCompetance);
   }
   
   /** @pdGenerated default remove
     * @param oldCompetance */
   public void removeCompetance(Competance oldCompetance) {
      if (oldCompetance == null)
         return;
      if (this.competance != null)
         if (this.competance.contains(oldCompetance))
            this.competance.remove(oldCompetance);
   }
   
   /** @pdGenerated default removeAll */
   public void removeAllCompetance() {
      if (competance != null)
         competance.clear();
   }

   public void setIdProfile(int idProfile) {
      this.idProfile = idProfile;
   }

   public void setNomProfile(String nomProfile) {
      this.nomProfile = nomProfile;
   }

   public void setPrenomProfile(String prenomProfile) {
      this.prenomProfile = prenomProfile;
   }

   public void setEmailProfile(String emailProfile) {
      this.emailProfile = emailProfile;
   }

   public void setTelephoneProfile(String telephoneProfile) {
      this.telephoneProfile = telephoneProfile;
   }

   public void setImageProfile(String imageProfile) {
      this.imageProfile = imageProfile;
   }

   public void setBiographieProfile(String biographieProfile) {
      this.biographieProfile = biographieProfile;
   }

   public int getIdProfile() {

      return idProfile;
   }

   public String getNomProfile() {
      return nomProfile;
   }

   public String getPrenomProfile() {
      return prenomProfile;
   }

   public String getEmailProfile() {
      return emailProfile;
   }

   public String getTelephoneProfile() {
      return telephoneProfile;
   }

   public String getImageProfile() {
      return imageProfile;
   }

   public String getBiographieProfile() {
      return biographieProfile;
   }
}