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
    przedstawiciel CHAR NOT NULL,
    siedziba CHAR NOT NULL,
    adres CHAR NOT NULL,
    glowny_organizator CHAR NOT NULL

);
-- --------------------------------------------------------


CREATE TABLE koncert
(
    idkoncert SERIAL PRIMARY KEY NOT NULL,
    data DATE NOT NULL,
    typ BOOLEAN NOT NULL,
    patron_medialny CHAR,
    godzina_rozpoczecia TIME NOT NULL,
    miejsce CHAR NOT NULL,
    miejscowosc CHAR NOT NULL,
    sponsor INT

);
-- --------------------------------------------------------



CREATE TABLE wstep
(
    idwstep SERIAL PRIMARY KEY,
    ograniczenie_wieku BOOLEAN,
    cena FLOAT,
    Pula INT

);
-- --------------------------------------------------------
CREATE TABLE gatunek
(
    idgatunek SERIAL PRIMARY KEY NOT NULL,
    gatunek CHAR NOT NULL

);
-- --------------------------------------------------------



CREATE TABLE support
(
    idsupport SERIAL PRIMARY KEY NOT NULL,
    nazwa CHAR NOT NULL,
    data_zalozenia DATE,
    wokalista CHAR

);
-- --------------------------------------------------------


CREATE TABLE wykonawca
(
    idwykonawca SERIAL PRIMARY KEY NOT NULL,
    nazwa CHAR NOT NULL,
    wokalista CHAR NOT NULL,
    data_zalozenia DATE NOT NULL

);
ALTER TABLE wykonawca
ADD CONSTRAINT wykonawca_koncert_idkoncert_fk
FOREIGN KEY (idwykonawca) REFERENCES koncert (idkoncert);
ALTER TABLE agecja_koncertowa
ADD CONSTRAINT agecja_koncertowa_koncert_sponsor_fk
FOREIGN KEY (NIP) REFERENCES koncert (idsponsor);
ALTER TABLE support
ADD CONSTRAINT support_wykonawca__idwykonawca_fk
FOREIGN KEY (idsupport) REFERENCES wykonawca (idwykonawca);
ALTER TABLE gatunek
ADD CONSTRAINT gatunek_koncert_miejsce_fk
FOREIGN KEY (idgatunek) REFERENCES koncert (idkoncert);
ALTER TABLE gatunek
ADD CONSTRAINT gatunek_wykonawca_idwykonawca_fk
FOREIGN KEY (idgatunek) REFERENCES wykonawca (idwykonawca);
ALTER TABLE koncert
ADD CONSTRAINT koncert_wstep_idwstep_fk
FOREIGN KEY (idkoncert) REFERENCES wstep (idwstep);
