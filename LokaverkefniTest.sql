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
    land VARCHAR(255),
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
    seld_eintok INT,
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
(2, "Plötusnúður"),
(3, "Rappari"),
(4, "Poppstjarna"),
(5, "Sólóisti");
INSERT INTO
tegund(ID, nafn)
VALUES
(1, "Rokk"),
(2, "Trance"),
(3, "Europop"),
(4, "rapp"),
(5, "Disco"),
(6, "Country"),
(7, "House");
INSERT INTO
utgefandi(ID, nafn)
VALUES
(1, "Groovemaster Studios"),
(2, "Armada Music"),
(3, "PolyGram"),
(5, "Paul Oscar Productions");
INSERT INTO
flytjandi(ID, nafn, faedingardagur, land, lysing, danardagur, flokkur_flytjanda)
VALUES
(1, "Disturbed", "1994-03-30", "Bandaríkin", "Disturbed er marg platinum þúngarokkshljómsveit sem samanstendur af David Draiman, Dan Donegan, Mike Wengren og John Moyer", NULL, 1),
(2, "Armin Van Buuren", "1976-12-25", "Holland", "Armin Van Buuren er markverðlaunaður Hollenskur dj og hefur hann verið númer 1 á top Dj mag list fimm sinnum.", NULL, 2),
(3, "ABBA", "1973-10-16", "Svíþjóð", "ABBA er sænsk, margverðlaunuð og ein af vinsælustu pop hljómsveitum allra tíma", NULL, 1),
(4, "Eminem", "1972-10-17", "Bandaríkin", "Eminem er Bandarískur rappari og er einn þekktasti í sínum geira", NULL, 3),
(5, "Páll Óskar", "1970-03-16", "Ísland", "Páll Óskar er íslenskur söngvari, lagahöfundur og plötusnúður og er þekktastur fyrir að syngja ballöður, diskó, hefðbundin íslensk lög og teknó", NULL, 4),
(6, "Johnny Cash", "1932-02-26", "Bandaríkin", "Johnny Cash var Bandarískur söngvari og er talin hafa verið einn helsti tónlistar áhrifavaldur 19.aldar", "1961-10-21", 5),
(7, "Fedde Le Grand", "1977-09-7", "Holland", "Fedde Le Grand er Hollenskur plötusnúður og er hann þekktastur fyrir lagið sitt put your hands up for detroyed", Null, 2),
(8, "Breaking Benjamin", "1999-12-03", "Bandaríkin", "Breakin benjamin er Bandarísk rokk hljómsveit sem hefur gefið 3 RIAA platinum plötur", NULL, 1);
INSERT INTO
Diskur(ID, nafn, utgafudagur, seld_eintok, tegund_disks, flytjandi_disks, utgefandi_disks)
VALUES
(1, "Asylum", "2010-08-31", 179000, 1, 1, 1),
(2, "Intense", "2013-05-03", 3000000, 2, 2, 2),
(3, "Gold: Greatest Hits", "1992-09-21", 30000000, 3, 3, 3),
(4, "Curtain Call: The Hits", "2005-12-06", 13502500, 4, 4, 2),
(5, "Allt fyrir ástina", "2007-11-07",20000, 5, 5, 5),
(6, "Now Here's Johnny Cash", "1961-10-21", 1000000, 6, 6, 3),
(7, "Output", "2009-09-14",100000, 7, 7, 2),
(8, "Phobia", "2006-08-08", 300000, 1, 8, 1);
INSERT INTO 
lag(ID, nafn, lengd, texti, tegund, diskur)
VALUES
(1, "Asylum", 276, "David Draiman", 1, 1),
(2, "The Infection", 248, "David Draiman", 1, 1),
(3, "Another Wat to Die", 253, "David Draiman", 1, 1),
(4, "This is What it Feels Like", 203, "Armin van Buuren, Benno de Goeij, Jenson Vaughan, Trevor Guthrie, John Ewbank", 2, 2),
(5, "Beautiful Life", 368, "Armin Van Buuren, Benno de Goeij, Cindy Alma, Paul Barry", 2, 2),
(6, "Waiting for the Night", 269, "Armin Van Buuren, Benno de Goeij, Fiora Cutler", 2, 2),
(7, "Dancing Queen", 232, "Andersson, Stig Anderson, Ulvaeus", 3, 3),
(8, "Mamma Mia", 213, "Andersson, Anderson, Ulvaeus", 3, 3),
(9, "Super Trouper", 254, "Benny Andersson, Björn Ulvaeus", 3, 3),
(10, "FACK", 206, "Marshell Mathers, Luis, Resto, Steve King", 4, 4),
(11, "Stan", 404, "Mathers, Dido Armstrong, Paul Herman", 4, 4),
(12, "Lose Yourself", 326, "Mathers, Jeff Bass, Resto", 4, 4),
(13, "Allt fyrir ástina", 214, "Páll Óskar", 5, 5),
(14, "Þú komst við hjartað í mér", 304, "Páll Óskar", 5, 5),
(15, "Betra líf", 220, "Páll Óskar", 5, 5),
(16, "Sugartime", 108, "Odis Echols, Charlie Phillips", 6, 6),
(17, "Down the street to 301", 126, "Jack Clement", 6, 6),
(18, "Life Goes On", 122, "Cash, Clement", 6, 6),
(19, "Feel alive", 251, "Will.I.Am, Fedde le Grand", 7, 7),
(20, "Shotgun", 378, "Camille Jones, Fedde le Grand", 7, 7),
(21, "Let Me Be Real", 200, "Fedde le Grand, Mitch Kroon, Robin M", 7, 7),
(22, "The Way I am", 290, "Mathers", 4, 4),
(23, "My name is", 267, "Mathers, Andre Young", 4, 4),
(24, "Take a Chance on Me", 244, "Andersson, Ulvaeus", 3, 3),
(25, "The Winner Takes it all", 295, "Andersson, Ulvaeus", 3, 3);


 #A
SELECT diskur.nafn as 'Diskur', lag.nafn as 'Lög á diski'
FROM lag
JOIN diskur
ON diskur.nafn = 'Asylum';


 #B
SELECT flytjandi.nafn as 'Flytjandi', lag.nafn as 'Lag eftir flytjanda'
FROM lag
JOIN flytjandi
ON flytjandi.nafn = 'Disturbed';


 #C
SELECT tegund.nafn as 'Tegund', lag.nafn as 'Tegund lags'
FROM lag
JOIN tegund
ON tegund.nafn = 'Rokk';


 #D
SELECT lag.nafn as 'Lag', lag.lengd as 'Lengd'
FROM lag
WHERE lengd > 300;


 #E
select diskur.nafn as 'Diskur' , utgafudagur as 'Útgáfudagur' 
from diskur 
where utgafudagur >= '2010-01-01' 
order by utgafudagur desc;


#F á eftir að klara
SELECT diskur.nafn as 'diskur', flytjandi.nafn as 'Flytjandi', utgefandi.nafn as 'Utgefandi'
from diskur
inner join tegund ON diskur.tegund_disks = tegund.ID
inner join flytjandi ON diskur.flytjandi_disks = flytjandi.ID
inner join utgefandi ON diskur.utgefandi_disks = utgefandi.ID
ORDER BY utgefandi.nafn ASC
LIMIT 2;

 #G
SELECT lag.nafn as 'Lag', lag.lengd as 'Lengd', flytjandi.nafn as 'Flytjandi', utgefandi.nafn as 'Utgefandi'
FROM lag
inner join diskur ON lag.diskur = diskur.ID
inner join flytjandi ON diskur.flytjandi_disks = flytjandi.ID
inner join utgefandi ON diskur.utgefandi_disks = utgefandi.ID
ORDER BY lag.lengd DESC
LIMIT 5;



 #H
SELECT tegund.nafn, count(diskur.ID)
from tegund
inner join diskur ON tegund.ID = diskur.tegund_disks
GROUP BY tegund.ID;


 #I
SELECT utgefandi.nafn, min(diskur.utgefandi_disks)
from utgefandi
inner join diskur ON diskur.utgefandi_disks = utgefandi.ID;

 #J
SELECT diskur.nafn as 'diskur', flytjandi.nafn as 'Flytjandi', utgefandi.nafn as 'Utgefandi', diskur.utgafudagur as 'Utgafudagur'
from diskur
inner join flytjandi ON diskur.flytjandi_disks = flytjandi.ID
inner join utgefandi ON diskur.utgefandi_disks = utgefandi.ID
WHERE utgafudagur between '1998-01-01' and '2017-01-01';

 #K
SELECT lag.nafn
from lag
WHERE lag.nafn like 'A%' or lag.nafn like '%s%';

 #L
SELECT flytjandi.nafn, timestampdiff(year, flytjandi.faedingardagur, CURDATE()) as 'Aldur', flytjandi.danardagur as 'Danardagur'
from flytjandi;

 #M
SELECT AVG(lag.lengd) as 'Meðal lengd í sekondum'
from lag;

 #N
SELECT flytjandi.nafn, COUNT(flytjandi.nafn) AS 'Hve margir eiga fleiri en 4 lög'
FROM lag
INNER JOIN diskur ON lag.diskur = diskur.ID
INNER JOIN flytjandi ON diskur.flytjandi_disks = flytjandi.ID
GROUP BY flytjandi.nafn
HAVING count(flytjandi.nafn) > 4;



 #O
SELECT lag.nafn as 'Lag', flytjandi.nafn as 'Flytjandi'
FROM lag
inner join diskur ON lag.diskur = diskur.ID
inner join flytjandi ON diskur.flytjandi_disks = flytjandi.ID
WHERE flytjandi.faedingardagur = (
SELECT Min(flytjandi.faedingardagur)
FROM flytjandi
);

