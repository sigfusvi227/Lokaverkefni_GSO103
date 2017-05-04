DROP DATABASE 0108952279_lokaverkefni;
CREATE DATABASE 0108952279_lokaverkefni;
use 0108952279_lokaverkefni;

CREATE TABLE flokkur
(
	ID INT PRIMARY KEY,
    nafn varchar(255)
);

CREATE TABLE flytjandi
(
	ID INT(11) PRIMARY KEY,
    nafn varchar(255),
    faedingardagur DATE NOT NULL,
    lysing TEXT,
    danardagur DATE NULL,
    flokkur_flytjanda INT,
    FOREIGN KEY (flokkur_flytjanda) REFERENCES flokkur(ID)
);

CREATE TABLE utgefandi
(
	ID INT PRIMARY KEY,
    nafn varchar(35)
);

CREATE TABLE tegund 
(
	ID INT PRIMARY KEY,
    nafn varchar(255)
);

CREATE TABLE diskur
(
	ID INT PRIMARY KEY,
    nafn varchar(255),
    utgafudagur DATE,
    tegund_disks int,
    flytjandi_disks int,
    utgefandi_disks	int,
    FOREIGN KEY (tegund_disks) REFERENCES tegund(ID),
    FOREIGN KEY (flytjandi_disks) REFERENCES flytjandi(ID),
    FOREIGN KEY (utgefandi_disks) REFERENCES utgefandi(ID)
);

CREATE TABLE lag 
(
	ID INT PRIMARY KEY,
    nafn varchar(255),
    texti varchar(255),
    lengd int,
    tegund int,
    diskur int,
    FOREIGN KEY (tegund) REFERENCES tegund(ID),
    FOREIGN KEY (diskur) REFERENCES diskur(ID)
);

USE 0108952279_lokaverkefni;
INSERT INTO
flokkur(ID, nafn)
VALUES
(1, "Hljómsveit"),
(2, "DJ");
INSERT INTO
tegund(ID, nafn)
VALUES
(1, "Rokk"),
(2, "Trance"),
(3, "Europop");
INSERT INTO
utgefandi(ID, nafn)
VALUES
(1, "Groovemaster Studios"),
(2, "Armada Music"),
(3, "PolyGram");
INSERT INTO
flytjandi(ID, nafn, faedingardagur, lysing, danardagur, flokkur_flytjanda)
VALUES
(1, "Disturbed", "1994-03-30", "Disturbed er marg platinum þúngarokkshljómsveit sem samanstendur af David Draiman, Dan Donegan, Mike Wengren og John Moyer", NULL, 1),
(2, "Armin Van Buuren", "1976-12-25","Armin Van Buuren er markverðlaunaður Hollenskur dj og hefur hann verið númer 1 á top Dj mag list fimm sinnum.", NULL, 2),
(3, "ABBA", "1973-10-16", "ABBA er sænsk, margverðlaunuð og ein af vinsælustu pop hljómsveitum allra tíma", NULL, 1);
INSERT INTO
Diskur(ID, nafn, utgafudagur, tegund_disks, flytjandi_disks, utgefandi_disks)
VALUES
(1, "Asylum", "2010-08-31", 1, 1, 1),
(2, "Intense", "2013-03-05", 2, 2, 2);
INSERT INTO 
lag(ID, nafn, lengd, texti, tegund, diskur)
VALUES
(1, "Asylum", 276, "David Draiman", 1, 1),
(2, "The Infection", 248, "David Draiman", 1, 1),
(3, "Another Wat to Die", 253, "David Draiman", 1, 1),
(4, "This is What it Feels Like", 203, "Armin van Buuren, Benno de Goeij, Jenson Vaughan, Trevor Guthrie, John Ewbank", 2, 2),
(5, "Beautiful Life", 368, "Armin Van Buuren, Benno de Goeij, Cindy Alma, Paul Barry", 2, 2),
(6, "Waiting for the Night", 269, "Armin Van Buuren, Benno de Goeij, Fiora Cutler", 2, 2);


SELECT diskur.nafn as 'Diskur', lag.nafn as 'Lög á diski'
FROM lag
JOIN diskur
ON diskur.nafn = 'Asylum';

SELECT flytjandi.nafn as 'Flytjandi', lag.nafn as 'Lag eftir flytjanda'
FROM lag
JOIN flytjandi
ON flytjandi.nafn = 'Disturbed';

SELECT tegund.nafn as 'Tegund', lag.nafn as 'Tegund lags'
FROM lag
JOIN tegund
ON tegund.nafn = 'Rokk';

SELECT lag.nafn as 'Lag', lag.lengd as 'Lengd'
FROM lag
WHERE lengd > 300;

select diskur.nafn as 'Diskur' , utgafudagur as 'Útgáfudagur' 
from diskur 
where utgafudagur >= '2010-01-01' 
order by utgafudagur desc;

#SELECT diskur.nafn as 'Diskur', flytjandi.nafn as 'Flytjandi', 
#	flytjandi.faedingardagur as 'Fæðingarár', 

SELECT lag.nafn as 'Lag', lag.lengd as 'Lengd'
FROM lag
LIMIT 5;



SELECT tegund_disks as 'Diskur', tegund_disks as 'Tegund'
FROM diskur
WHERE nafn



