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

   CONSTRAINT agecja_koncertowa_koncert_idkoncert_fk FOREIGN KEY (NIP) REFERENCES koncert (idkoncert)

CONSTRAINT wykonawca_koncert_idkoncert_fk FOREIGN KEY (idwykonawca) REFERENCES koncert (idkoncert);
    CONSTRAINT wykonawca_gatunek_gatunek_fk FOREIGN KEY (idwykonawca) REFERENCES gatunek (gatunek);
 CONSTRAINT support_wykonawca_idwykonawca_fk FOREIGN KEY (idsupport) REFERENCES wykonawca (idwykonawca);
CONSTRAINT gatunek_koncert_idkoncert_fk FOREIGN KEY (idgatunek) REFERENCES koncert (idkoncert);
    CONSTRAINT gatunek_wykonawca_idwykonawca_fk FOREIGN KEY (idgatunek) REFERENCES wykonawca (idwykonawca);
 CONSTRAINT wstep_koncert_idkoncert_fk FOREIGN KEY (idwstep) REFERENCES koncert (idkoncert);
CONSTRAINT koncert_wstep_idwstep_fk FOREIGN KEY (idkoncert) REFERENCES wstep (idwstep) ON DELETE CASCADE;
    CONSTRAINT koncert_agecjakoncertowa_NIP_fk FOREIGN KEY (idkoncert) REFERENCES agecja_koncertowa (NIP) ON DELETE CASCADE;
    CONSTRAINT koncert_gatunek_idgatunek_fk FOREIGN KEY (idkoncert) REFERENCES gatunek (idgatunek) ON DELETE CASCADE;
    CONSTRAINT koncert_wykonawca_idwykonawca_fk FOREIGN KEY (idkoncert) REFERENCES wykonawca (idwykonawca);
