--Arnaud Cojez, L3S5, G4
--E1Q1
CREATE VIEW Participations AS 
	SELECT aid AS artiste, COUNT(fid) AS nbpart FROM (
	SELECT aid, fid FROM Roles
	UNION
	SELECT realisateur AS aid, fid FROM Films) AS P1 GROUP BY aid;
SELECT artiste, nbpart FROM Participations WHERE nbpart >= ALL (SELECT nbpart FROM Participations); 

--E1Q2
UPDATE Films
	SET genre = 'film d''action'
	WHERE fid IN
	 	(SELECT fid FROM Roles
	 	 	WHERE protagoniste);

--E1Q3
SELECT aid FROM Roles WHERE
	NOT protagoniste;

--E1Q4
CREATE VIEW ArtisteFrancais AS
	SELECT aid FROM Artists WHERE nationalite='francais';

CREATE VIEW FilmNational AS
SELECT fid FROM Films WHERE realisateur IN
	(SELECT aid AS realisateur FROM ArtisteFrancais)
UNION
SELECT fid FROM Roles WHERE protagoniste AND aid IN (SELECT aid FROM ArtisteFrancais);

UPDATE Films
	SET genre = 'film national'
	WHERE fid IN
	 	(SELECT fid FROM FilmNational);

--E1Q5
