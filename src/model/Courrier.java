package model; /***********************************************************************
 * Module:  Courrier.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Courrier
 ***********************************************************************/

import java.util.*;

/** @pdOid 553d4039-c0b4-4958-9261-9d54c6f637e4 */
public class Courrier {
      /** @pdOid 48d3de20-0f2a-4444-b545-d5ab03730da0 */
      private int idCourrier;
      /** @pdOid e68b8ded-c2c5-4d55-a525-344a93056b39 */
      private String emailCourrier;
      /** @pdOid 41d9b3ef-63ee-4c42-a8ab-dfa6e2c307fc */
      private String sujetCourrier;
      /** @pdOid 12a02c05-e177-488d-aa3b-0e9137174d81 */
      private String messageCourrier;
      /** @pdOid 63a6339d-9237-4811-8628-90ea703a2187 */
      private String dateEnvoieCourrier;
      /** @pdOid 63a6339d-9237-4811-8628-90ea703a2125 */
      private String nomComplet;

    public int getIdCourrier() {
        return idCourrier;
    }

    public void setIdCourrier(int idCourrier) {
        this.idCourrier = idCourrier;
    }

    public String getEmailCourrier() {
        return emailCourrier;
    }

    public void setEmailCourrier(String emailCourrier) {
        this.emailCourrier = emailCourrier;
    }

    public String getSujetCourrier() {
        return sujetCourrier;
    }

    public void setSujetCourrier(String sujetCourrier) {
        this.sujetCourrier = sujetCourrier;
    }

    public String getMessageCourrier() {
        return messageCourrier;
    }

    public void setMessageCourrier(String messageCourrier) {
        this.messageCourrier = messageCourrier;
    }

    public String getDateEnvoieCourrier() {
        return dateEnvoieCourrier;
    }

    public void setDateEnvoieCourrier(String dateEnvoieCourrier) {
        this.dateEnvoieCourrier = dateEnvoieCourrier;
    }

    public String getNomComplet() {
        return nomComplet;
    }

    public void setNomComplet(String nomComplet) {
        this.nomComplet = nomComplet;
    }

    @Override
    public String toString() {
        return "Courrier{" +
                "idCourrier=" + idCourrier +
                ", emailCourrier='" + emailCourrier + '\'' +
                ", sujetCourrier='" + sujetCourrier + '\'' +
                ", messageCourrier='" + messageCourrier + '\'' +
                ", dateEnvoieCourrier='" + dateEnvoieCourrier + '\'' +
                ", nomComplet='" + nomComplet + '\'' +
                '}';
    }
}