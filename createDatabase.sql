/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/12/2016 18:26:09                          */
/* Created by:     Reda Benchraa                                */
/*==============================================================*/

create database if not exists Portfolio;
use Portfolio;

drop table if exists Administrateur;

drop table if exists Categorie_competance;

drop table if exists Categorie_projet;

drop table if exists Competance;

drop table if exists Courrier;

drop table if exists Cursus;

drop table if exists Domaine;

drop table if exists Experience;

drop table if exists Lien;

drop table if exists Portfolio;

drop table if exists Profile;

drop table if exists Projet;

drop table if exists Theme;

/*==============================================================*/
/* Table: Administrateur                                        */
/*==============================================================*/
create table Administrateur
(
   username             varchar(254),
   password             varchar(254)
);

/*==============================================================*/
/* Table: Categorie_competance                                  */
/*==============================================================*/
create table Categorie_competance
(
   idCompetanceCategorie int not null,
   nomCompetanceCategorie varchar(254),
   descriptionCompetanceCategorie varchar(254),
   primary key (idCompetanceCategorie)
);

/*==============================================================*/
/* Table: Categorie_projet                                      */
/*==============================================================*/
create table Categorie_projet
(
   idProjetCategorie    int not null,
   nomProjetCategorie   varchar(254),
   descriptionProjetCategorie varchar(254),
   imageProjetCategorie varchar(254),
   primary key (idProjetCategorie)
);

/*==============================================================*/
/* Table: Competance                                            */
/*==============================================================*/
create table Competance
(
   idCompetance         int not null,
   idProfile            int,
   idCompetanceCategorie int not null,
   nomCompetance        varchar(254) not null,
   pourcentageCompetance int,
   primary key (idCompetance)
);

/*==============================================================*/
/* Table: Courrier                                              */
/*==============================================================*/
create table Courrier
(
   idCourrier           int not null,
   emailCourrier        varchar(254),
   sujetCourrier        varchar(254),
   messageCourrier      varchar(254),
   dateEnvoieCourrier   datetime,
   nomCompletCourrier   varchar(254),
   primary key (idCourrier)
);

/*==============================================================*/
/* Table: Cursus                                                */
/*==============================================================*/
create table Cursus
(
   id_cursus            int not null,
   idProfile            int,
   nomCursus            varchar(254),
   annee_debutCursus    varchar(254),
   annee_finCursus      varchar(254),
   etablissementCursus  varchar(254),
   remarqueCursus       varchar(254),
   primary key (id_cursus)
);

/*==============================================================*/
/* Table: Domaine                                               */
/*==============================================================*/
create table Domaine
(
   idDomaine            int not null,
   nomDomaine           varchar(254),
   descriptionDomaine   varchar(254),
   imageDomaine         varchar(254),
   primary key (idDomaine)
);

/*==============================================================*/
/* Table: Experience                                            */
/*==============================================================*/
create table Experience
(
   nomExperience        varchar(254) not null,
   logoExperience       varchar(254),
   primary key (nomExperience)
);

/*==============================================================*/
/* Table: Lien                                                  */
/*==============================================================*/
create table Lien
(
   idLien               int not null,
   idProfile            int,
   nomLien              varchar(254),
   urlLien              varchar(254),
   imageLien            varchar(254),
   primary key (idLien)
);

/*==============================================================*/
/* Table: Portfolio                                             */
/*==============================================================*/
create table Portfolio
(
   nomTheme             varchar(254) not null,
   nomPortfolio         varchar(254),
   aProposPortfolio     varchar(254),
   logoPortfolio        varchar(254),
   salutationPortfolio  varchar(254)
);

/*==============================================================*/
/* Table: Profile                                               */
/*==============================================================*/
create table Profile
(
   idProfile            int not null,
   nomProfile           varchar(254),
   prenomProfile        varchar(254),
   emailProfile         varchar(254),
   telephoneProfile     varchar(254),
   imageProfile         varchar(254),
   biographieProfile    varchar(254),
   primary key (idProfile)
);

/*==============================================================*/
/* Table: Projet                                                */
/*==============================================================*/
create table Projet
(
   idProjet             int not null,
   idProjetCategorie    int not null,
   nomProjet            varchar(254),
   descriptionProjet    varchar(254),
   projetProjet         varchar(254),
   imageProjet          varchar(254),
   etoileProjet         bool,
   primary key (idProjet)
);

/*==============================================================*/
/* Table: Theme                                                 */
/*==============================================================*/
create table Theme
(
   nomTheme             varchar(254) not null,
   lienTheme            varchar(254),
   paletteTheme         varchar(254),
   primary key (nomTheme)
);

alter table Competance add constraint FK_ASSOCIATION13 foreign key (idProfile)
      references Profile (idProfile) on delete restrict on update restrict;

alter table Competance add constraint FK_ASSOCIATION15 foreign key (idCompetanceCategorie)
      references Categorie_competance (idCompetanceCategorie) on delete restrict on update restrict;

alter table Cursus add constraint FK_ASSOCIATION14 foreign key (idProfile)
      references Profile (idProfile) on delete restrict on update restrict;

alter table Lien add constraint FK_ASSOCIATION16 foreign key (idProfile)
      references Profile (idProfile) on delete restrict on update restrict;

alter table Portfolio add constraint FK_ASSOCIATION11 foreign key (nomTheme)
      references Theme (nomTheme) on delete restrict on update restrict;

alter table Projet add constraint FK_ASSOCIATION8 foreign key (idProjetCategorie)
      references Categorie_projet (idProjetCategorie) on delete restrict on update restrict;

