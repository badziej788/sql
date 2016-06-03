SET client_encoding='utf-8';

drop table agecja_koncertowa;
drop table gatunek;
drop table koncert;
drop table support;
drop table wstep;
drop table wykonawca;
-- --------------------------------------------------------
drop table organizacja;
drop table wejscie;
drop table pomaga;
drop table udzial;
drop table rodzaj;
drop table gra;


CREATE TABLE agecja_koncertowa
(
    NIP INT PRIMARY KEY NOT NULL,
    nazwa VARCHAR(30) NOT NULL,
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
    sponsor VARCHAR(50)

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
CREATE TABLE wykonawca
(
    idwykonawca SERIAL PRIMARY KEY NOT NULL,
    nazwa VARCHAR(30) NOT NULL,
    wokalista VARCHAR(30) NOT NULL,
    data_zalozenia DATE NOT NULL

);
-- --------------------------------------------------------
CREATE TABLE pomaga
(
    idwykonawca INT,
    idsupport INT,
    CONSTRAINT pomaga_support_idsupport_fk FOREIGN KEY (idsupport) REFERENCES support (idsupport),
    CONSTRAINT pomaga_wykonawca_idwykonawca_fk FOREIGN KEY (idwykonawca) REFERENCES wykonawca (idwykonawca)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE udzial
(
    idkoncert INT,
    idwykonawca INT,
    CONSTRAINT udzial_koncert_idkoncert_fk FOREIGN KEY (idkoncert) REFERENCES koncert (idkoncert),
    CONSTRAINT udzial_wykonawca_idwykonawca_fk FOREIGN KEY (idwykonawca) REFERENCES wykonawca (idwykonawca)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE rodzaj
(
    idgatunek INT,
    idkoncert INT,
    CONSTRAINT rodzaj_gatunek_idgatunek_fk FOREIGN KEY (idgatunek) REFERENCES gatunek (idgatunek),
    CONSTRAINT rodzaj_koncert_idkoncert_fk FOREIGN KEY (idgatunek) REFERENCES koncert (idkoncert)
    ON DELETE CASCADE ON UPDATE CASCADE
);
;CREATE TABLE organizacja
(
    NIP INT,
    idkoncert INT,
    CONSTRAINT organizacja_agecja_koncertowa_NIP_fk FOREIGN KEY (NIP) REFERENCES agecja_koncertowa (NIP),
    CONSTRAINT organizacja_koncert_idkoncert_fk FOREIGN KEY (idkoncert) REFERENCES koncert (idkoncert)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE wejscie
(
    idwstep INT,
    idkoncert INT,
    CONSTRAINT wejscie_wstep_idwstep_fk FOREIGN KEY (idwstep) REFERENCES wstep (idwstep),
    CONSTRAINT wejscie_koncert_idkoncert_fk FOREIGN KEY (idwstep) REFERENCES koncert (idkoncert)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE gra
(
    idgatunek INT,
    idwykonawca INT,
    CONSTRAINT gra_gatunek_idgatunek_fk FOREIGN KEY (idgatunek) REFERENCES gatunek (idgatunek),
    CONSTRAINT gra_wykonawca_idwykonawca_fk FOREIGN KEY (idwykonawca) REFERENCES wykonawca (idwykonawca)
    ON DELETE CASCADE ON UPDATE CASCADE
);

