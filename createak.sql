SET client_encoding='utf-8';

drop table agecja_koncertowa;
drop table gatunek;
drop table koncert;
drop table support;
drop table wstep;
drop table wykonawca;


CREATE TABLE agecja_koncertowa
(
    NIP INT PRIMARY KEY NOT NULL,
    przedstawiciel VARCHAR(30) NOT NULL,
    siedziba VARCHAR(30) NOT NULL,
    adres VARCHAR(50) NOT NULL,
    glowny_organizator VARCHAR(50) NOT NULL

);
-- --------------------------------------------------------


CREATE TABLE koncert
(
    idkoncert SERIAL PRIMARY KEY NOT NULL,
    data DATE NOT NULL,
    typ VARCHAR(30) NOT NULL,
    patron_medialny VARCHAR(50),
    godzina_rozpoczecia TIME NOT NULL,
    miejsce VARCHAR(50) NOT NULL,
    miejscowosc VARCHAR(30) NOT NULL,
    sponsor INT

);
-- --------------------------------------------------------



CREATE TABLE wstep
(
    idwstep SERIAL PRIMARY KEY,
    ograniczenie_wieku INT,
    cena FLOAT,
    Pula INT

);
-- --------------------------------------------------------
CREATE TABLE gatunek
(
    idgatunek SERIAL PRIMARY KEY NOT NULL,
    gatunek VARCHAR(30) NOT NULL

);
-- --------------------------------------------------------



CREATE TABLE support
(
    idsupport SERIAL PRIMARY KEY NOT NULL,
    nazwa VARCHAR(30) NOT NULL,
    data_zalozenia DATE,
    wokalista VARCHAR(30)

);
-- --------------------------------------------------------


CREATE TABLE wykonawca
(
    idwykonawca SERIAL PRIMARY KEY NOT NULL,
    nazwa VARCHAR(30) NOT NULL,
    wokalista VARCHAR(30) NOT NULL,
    data_zalozenia DATE NOT NULL

);
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
