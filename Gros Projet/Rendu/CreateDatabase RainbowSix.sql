USE master ;
-- D�connexion des utilisateurs pour drop
IF (EXISTS (SELECT name
FROM master.dbo.sysdatabases
WHERE name = 'RainbowSix'))
BEGIN 
    USE master;
    ALTER DATABASE RainbowSix SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE RainbowSix;
END 
-- cr�ation
CREATE DATABASE RainbowSix;
GO


 --Cr�ation de la table Pendants
use RainbowSix;
drop table if EXISTS Pendants
CREATE TABLE Pendants (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Rarity VARCHAR(45) NOT NULL,
  Definition VARCHAR(45) NOT NULL,
  )

  SELECT * FROM Pendants;
  
   --Cr�ation de la table Skins


drop table if EXISTS Skins
CREATE TABLE Skins (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Color VARCHAR(45) NOT NULL,
  Rarity VARCHAR(45) NOT NULL,
  Pattern VARCHAR(45) NOT NULL,
  )
  
  SELECT * FROM Skins;

   --Cr�ation de la table Accessories


drop table if EXISTS Accessories
CREATE TABLE Accessories (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Type VARCHAR(45) NOT NULL,
  Location VARCHAR(45) NOT NULL,
  Stat VARCHAR(100) NOT NULL,
  Descript VARCHAR(45) NOT NULL,
  )
  
  SELECT * FROM Accessories;

   --Cr�ation de la table Weapons


drop table if EXISTS Weapons
CREATE TABLE Weapons (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Category VARCHAR(45) NOT NULL,
  Damage INT NOT NULL,
  Recoil VARCHAR(45) NOT NULL,
  ADS VARCHAR(45) NOT NULL,
  Capacity INT NOT NULL,
  Accessories_id INT,
)

  SELECT * FROM Weapons;

   --Cr�ation de la table Mods


drop table if EXISTS Mods
CREATE TABLE Mods (
  id INT NOT NULL   identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL ,
  Duration INT NOT NULL,
  -- Contrainte de domaine -que 60min 
  Special INT NOT NULL,
  Definition VARCHAR(100) NOT NULL,
 )

  SELECT * FROM Mods;

   --Cr�ation de la table Stat


drop table if EXISTS Stat
CREATE TABLE Stat (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Defense VARCHAR(45) NOT NULL UNIQUE,
  Speed VARCHAR(45) NOT NULL UNIQUE,
 )   
  
  SELECT * FROM Stat;

   --Cr�ation de la table Characters


drop table if EXISTS Characters
CREATE TABLE Characters (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL UNIQUE,
  Part VARCHAR(7) NOT NULL ,
  Ability_name VARCHAR(20) NOT NULL ,
  Ability_definition VARCHAR(200) NOT NULL ,
  Passive_ability VARCHAR(20)  NULL ,
  Passif_definition VARCHAR(200)  NULL ,
  Gender VARCHAR(10) NULL ,
  Country VARCHAR(45) NULL ,
  Special_force VARCHAR(80) NULL ,
  Weapons_id INT,
  Rewards_id INT,
  Gadgets_id INT,

 )  
 SELECT * FROM Characters;
  
  --Cr�ation de la table Maps


drop table if EXISTS Maps
CREATE TABLE Maps (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL ,
  Country VARCHAR(45) NOT NULL ,
  Size INT NOT NULL ,
  Nb_spawns VARCHAR(45) NOT NULL ,
  Nb_floors VARCHAR(45) NOT NULL ,
  Mods_id INT,
  
 )

  SELECT * FROM Maps;
   --Cr�ation de la table Rewards

drop table if EXISTS Rewards
CREATE TABLE Rewards (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL ,
  Type VARCHAR(45) NOT NULL ,
   
 )

   SELECT * FROM Rewards;
   
 --Cr�ation de la table Gadgets

drop table if EXISTS Gadgets
CREATE TABLE Gadgets (
  id INT NOT NULL identity(1,1)  PRIMARY KEY ,
  Name VARCHAR(45) NOT NULL ,
  Definition VARCHAR(200) NOT NULL ,
  Part VARCHAR(200) NOT NULL ,
   
 )
    SELECT * FROM Gadgets;

--Contraintes r�f�rencielles

 ALTER TABLE Weapons WITH CHECK ADD  CONSTRAINT FK_Weapons_Accessories FOREIGN KEY(Accessories_id)
REFERENCES Accessories(id)

 ALTER TABLE Characters WITH CHECK ADD  CONSTRAINT FK_Characters_Weapons FOREIGN KEY(Weapons_id)
REFERENCES Weapons(id)

 ALTER TABLE Characters WITH CHECK ADD  CONSTRAINT FK_Characters_Rewards FOREIGN KEY(Rewards_id)
REFERENCES Rewards(id)

 ALTER TABLE Characters WITH CHECK ADD  CONSTRAINT FK_Characters_Gadgets FOREIGN KEY(Gadgets_id)
REFERENCES Gadgets(id)

 ALTER TABLE Maps WITH CHECK ADD  CONSTRAINT FK_Maps_Mods FOREIGN KEY(Mods_id)
REFERENCES Mods(id)

--Contrainte de domaine
ALTER TABLE Mods
ADD CHECK (duration<=60);

ALTER TABLE Weapons
ADD CHECK (Damage<=100);
