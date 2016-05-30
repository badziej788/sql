INSERT INTO agecja_koncertowa (NIP, przedstawiciel, siedziba, adres, glowny_organizator) VALUES
(148596232, 'Sapik', 'Jan_Kowalski', 'Szczecinek, Narutowicza 15', 'KonGroup'),
(229503672, 'Stefan Baucha', 'Koszalin', 'Pilska 75', 'GarBar'),
(358693044, 'Sapik', 'Jan_Kowalski', 'Szczecinek, Narutowicza 15', 'Garage_Pub'),
(412345231, 'Miasto_Bydgoszcz', 'Bydgoszcz', 'Bydgoszcz, Szafera 95', 'Burmistrz');

INSERT INTO gatunek (idgatunek, gatunek) VALUES
(1, 'rock'),
(2, 'elektroniczny'),
(3, 'rock'),
(4, 'jazz');

INSERT INTO koncert (idkoncert, data, typ, patron_medialny, godzina_rozpoczecia, Miejsce, Miejscowosc, Sponsor) VALUES
(1, '2016-04-30', 'koncert', 'GAWEX', '17:00:00', 'Kino Wolność', 'Szczecinek', 'SAPIK'),
(2, '2015-08-29', 'FESTIWAL', NULL, '16:00:00', 'Wieża Przemysława', 'Koszalin', NULL),
(3, '2016-04-30', 'koncert', 'GAWEX', '17:00:00', 'Kino Wolność', 'Szczecinek', 'SAPIK'),
(4, '2016-04-30', 'FESTIWAL', 'polKON', '17:00:00', 'Hala_Przemyslawa', 'Bydgoszcz', 'Miasto');

INSERT INTO support (idsupport, nazwa, data_zalozenia, wokalista) VALUES
(1, 'Pandora', '2010-12-07', 'Jan_Kowalski'),
(2, 'Adamantiuma', '2009-01-05', 'Anna_Czerska'),
(3, 'Metaligun', '2003-12-04', 'Krystian_Strach'),
(4, 'Kamikaze', '2007-02-26', 'Marek_Zaleski');

INSERT INTO wstep (idwstep, ograniczenie_wieku, cena, pula) VALUES
(1, NULL, 30, 300),
(2, 18, 50, 200),
(3, NULL, 30, 300),
(4, NULL, 50, 200);

INSERT INTO wykonawca (idwykonawca, nazwa, data_zalozenia, wokalista) VALUES
(1, 'Materia', '2000-03-12', 'Michal_Piesiak'),
(2, 'pokahontas', '2005-05-24', 'Sebastian_Farczynski'),
(3, 'JawRa', '1996-12-12', 'John_Ziggi'),
(4, 'Mephisto', '1994-09-12', 'Maciej_Sandrzycki');

ALTER TABLE wykonawca
ADD CONSTRAINT wykonawca_koncert_idkoncert_fk
FOREIGN KEY (idwykonawca) REFERENCES koncert (idkoncert) ON UPDATE CASCADE;
ALTER TABLE agecja_koncertowa
ADD CONSTRAINT agecja_koncertowa_koncert_sponsor_fk
FOREIGN KEY (NIP) REFERENCES koncert (idkoncert)ON UPDATE CASCADE;
ALTER TABLE support
ADD CONSTRAINT support_wykonawca__idwykonawca_fk
FOREIGN KEY (idsupport) REFERENCES wykonawca (idwykonawca) ON UPDATE CASCADE;
ALTER TABLE gatunek
ADD CONSTRAINT gatunek_koncert_miejsce_fk
FOREIGN KEY (idgatunek) REFERENCES koncert (idkoncert) ON UPDATE CASCADE;
ALTER TABLE gatunek
ADD CONSTRAINT gatunek_wykonawca_idwykonawca_fk
FOREIGN KEY (idgatunek) REFERENCES wykonawca (idwykonawca) ON UPDATE CASCADE;
ALTER TABLE koncert
ADD CONSTRAINT koncert_wstep_idwstep_fk
FOREIGN KEY (idkoncert) REFERENCES wstep (idwstep) ON UPDATE CASCADE;
