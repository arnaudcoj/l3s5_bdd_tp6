---  TP6 BDD
DROP SCHEMA	 IF EXISTS Cojez_TP6 CASCADE;
CREATE SCHEMA Cojez_TP6;
SET SEARCH_PATH = Cojez_TP6;

DROP TABLE Roles;
DROP TABLE Films;
DROP TABLE Artists;


CREATE TABLE Artists (
 aid INTEGER PRIMARY KEY ,
 anom VARCHAR(30) NOT NULL ,
 nationalite VARCHAR(30) NOT NULL 
);


CREATE TABLE Films (
 fid INTEGER PRIMARY KEY ,
 titre VARCHAR(30) NOT NULL ,
 realisateur INTEGER REFERENCES Artists, 
 an DATE NOT NULL,
 genre VARCHAR(40)
);

 
CREATE TABLE Roles (
 fid INTEGER NOT NULL ,
 aid INTEGER NOT NULL,
 personnage VARCHAR(45),
 cout INTEGER,
 protagoniste BOOL, 
 PRIMARY KEY (fid,aid), 
 FOREIGN KEY (fid) 
 REFERENCES Films
 ON DELETE CASCADE 
 ON UPDATE CASCADE,
 FOREIGN KEY (aid) 
 REFERENCES Artists 
 ON DELETE CASCADE 
 ON UPDATE CASCADE
);




INSERT INTO Artists VALUES
(123,'JeanduJardin','francais');
INSERT INTO Artists VALUES
(415,'MarionCotillard','francais');
INSERT INTO Artists VALUES
(304,'ChiaraMuti','italien');
INSERT INTO Artists VALUES
(702,'LauraAntonelli','italien');
INSERT INTO Artists VALUES
(876,'MarcelloMastroianni','italien');

INSERT INTO Films
 VALUES (1,'De rouilles et des os',876,'2011-01-01','Dramatique');
INSERT INTO Films
 VALUES (2,'Cyrano en vrai',876,'2010-02-02','Comedie');
INSERT INTO Films
 VALUES (3,'Matrix2',876,'2014-04-04','Science Fiction');


INSERT INTO Roles
 VALUES (2,123,'Cyrano',10500,true);
INSERT INTO Roles
 VALUES (3,123,'Cyrano',20000,true);
INSERT INTO Roles
 VALUES (2,702,'FJacques',45000,false);
 INSERT INTO Roles
 VALUES (1,304,'Cecile',9000,false); 





