package model; /***********************************************************************
 * Module:  Theme.java
 * Author:  Reda BENCHRAA
 * Purpose: Defines the Class Theme
 ***********************************************************************/

import java.util.*;

/** @pdOid 7dcf3419-f695-4d31-b705-8a37e8cb271c */
public class Theme {
   /** @pdOid 7abf4881-ea73-49b7-9900-3716b9ddebb9 */
   private String nomTheme;
   /** @pdOid 535e8bd2-44dc-4051-a804-b3968cf67035 */
   private String lienTheme;
   /** @pdOid 23f424ed-dcdd-446f-b0da-e7519dbf961a */
   private String paletteTheme;

   public String getNomTheme() {
      return nomTheme;
   }

   public void setNomTheme(String nomTheme) {
      this.nomTheme = nomTheme;
   }

   public String getLienTheme() {
      return lienTheme;
   }

   public void setLienTheme(String lienTheme) {
      this.lienTheme = lienTheme;
   }

   public String getPaletteTheme() {
      return paletteTheme;
   }

   public void setPaletteTheme(String paletteTheme) {
      this.paletteTheme = paletteTheme;
   }

   @Override
   public String toString() {
      return "Theme{" +
              "nomTheme='" + nomTheme + '\'' +
              ", lienTheme='" + lienTheme + '\'' +
              ", paletteTheme='" + paletteTheme + '\'' +
              '}';
   }
}