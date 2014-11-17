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
