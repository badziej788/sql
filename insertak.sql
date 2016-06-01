INSERT INTO agecja_koncertowa (NIP, nazwa, siedziba, adres, glowny_organizator) VALUES
(148596232, 'Sapik', 'Jan_Kowalski', 'Szczecinek, Narutowicza 15', 'KonGroup'),
(229503672, 'Stefan Baucha', 'Koszalin', 'Pilska 75', 'GarBar'),
(358693044, 'Sapik', 'Jan_Kowalski', 'Szczecinek, Narutowicza 15', 'Garage Pub'),
(358692044, 'Federico', 'Kazimierz_Kowalik', 'Szczecin, Traugutta 1', 'Avanti'),
(351193044, 'Suprimo', 'Marcin Michalik', 'Zamość, Matusewicz 152', 'Metro'),
(358667044, 'EDM', 'Michał Piaseczny', 'Poznań, Kocia 37', 'Renomo'),
(412345231, 'Miasto_Bydgoszcz', 'Bydgoszcz', 'Bydgoszcz, Szafera 95', 'Burmistrz');

INSERT INTO gatunek (gatunek) VALUES
('rock'),
('reggae'),
('rock'), 
('techno'), 
('blues'),
('house'),
('raga'),
('ludowy'),
('hip hop'),
('jazz');

INSERT INTO koncert (data, typ, patron_medialny, godzina_rozpoczecia, Miejsce, Miejscowosc, Sponsor) VALUES
('2016-04-30', 'koncert', 'GAWEX', '17:00:00', 'Kino Wolność', 'Szczecinek', 'SAPIK'),
('2015-08-29', 'FESTIWAL', NULL, '16:00:00', 'Wieża Przemysława', 'Koszalin', NULL),
  ('2016-04-30', 'koncert', 'Garni', '17:00:00', 'Kino Wolność', 'Gwda', 'SAPIK'),
  ('2016-07-15', 'koncert', 'MLM', '19:00:00', 'Stary rynek', 'Barkowo', 'SAPIK'),
  ('2016-05-28', 'FESTIWAK', 'GAWEX', '17:00:00', 'U PAWLA', 'Wałcz', 'SAPIK'),
  ('2016-08-07', 'koncert', 'Looks', '18:00:00', 'Kino Wolność', 'Czarne', 'SAPIK'),
  ('2016-09-11', 'FESIWAL', 'Gambit', '17:00:00', 'Stadion miejski', 'Chojnice', 'SAPIK'),
('2016-04-30', 'koncert', 'GAWEX', '17:00:00', 'Kino Wolność', 'Szczecinek', 'SAPIK'),
('2016-04-30', 'FESTIWAL', 'polKON', '13:00:00', 'Hala_Przemyslawa', 'Bydgoszcz', 'Miasto'),
('2016-05-01', 'FESTIWAL', 'polKON', '13:00:00', 'Hala_Przemyslawa', 'Bydgoszcz', 'Miasto');

INSERT INTO support (nazwa, data_zalozenia, wokalista) VALUES
('Pandora', '2010-12-07', 'Jan_Kowalski'),
('Adamantiuma', '2009-01-05', 'Anna_Czerska'),

  ('Amarant', '2000-02-17', 'Krystyna_Czubuwna'),
  ('Jungle', '2003-01-04', 'Mateusz_Wise'),
  ('DJ Gieniu', '2005-04-28', 'Eugeniusz Hydraulik'),
  ('Jam Raw', '2010-10-10', 'Andrzej Kleks'),
  ('Dj koollin', '2011-12-04', 'Martyna Szaliczyńska'),
  
  
('Kamikaze', '2007-02-26', 'Marek_Zaleski');

INSERT INTO wstep (ograniczenie_wieku, cena, pula) VALUES
( NULL, 30, 300),
( 18, 50, 200),

  ( NULL, 15, 2000),
  ( 15, 20, 150),
  ( NULL, 30, 300),
  ( 18, 30, 380),
  ( NULL, 30, 300),
  ( 18, 30, 380),
( NULL, 50, 200)
( 18, 30, 380),
( NULL, 50, 200);

INSERT INTO wykonawca (nazwa, data_zalozenia, wokalista) VALUES
('Materia', '2000-03-12', 'Michal_Piesiak'),

  ('Mathematic', '2003-07-22', 'Patryk Mrau'),
  ('pokahontas', '2001-05-27', 'Krzysztof Czyk'),
  ('ponkis', '2007-08-25', 'Karol Mazuruk'),
  ('pass', '2005-09-15', 'Szymon Sobocki'),
  ('pomarancz', '2009-10-19', 'Klaudia Czaniczewska'),
( 'JawRa', '1996-12-12', 'John_Ziggi'),
('Mephisto', '1994-09-12', 'Maciej_Sandrzycki'),
('Matisa', '2005-09-15', 'Marcin Koracki'),
 ('Bostos', '2001-09-15', 'Bolesław Marać');

ALTER TABLE wykonawca
ADD CONSTRAINT wykonawca_koncert_idkoncert_fk
FOREIGN KEY (idwykonawca) REFERENCES koncert (idkoncert) ON UPDATE CASCADE;
ALTER TABLE agecja_koncertowa
ADD CONSTRAINT agecja_koncertowa_koncert_sponsor_fk
FOREIGN KEY (idak) REFERENCES koncert (idkoncert)ON UPDATE CASCADE;
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
