SET client_encoding='utf-8';
-- Baza danych: `agkoncertowa`
-- --------------------------------------------------------
CREATE TABLE agecjakoncertowa (
  NIP                   int            NOT NULL,
  Przedstawiciel        char           NOT NULL,
  Siedziba              char           NOT NULL,
  Adres                 char           NOT NULL,
  GlownyOrganizator     char           NOT NULL,
CONSTRAINT       	agecjakoncertowa_fk FOREIGN KEY(NIP)
                         	REFERENCES koncert(idkoncert)
                          ON UPDATE CASCADE ON DELETE SET NULL
                          );
-- --------------------------------------------------------

CREATE TABLE gatunek(
  idgatunek    int  INCREMENT               NOT NULL,
  gatunek      Char(50)                    NOT NULL,
CONSTRAINT       	gatunek_fk FOREIGN KEY(gatunek)
                         	REFERENCES wykonawca(nazwa)
                          ON UPDATE CASCADE ON DELETE SET NULL,

CONSTRAINT       	gatunek_fk FOREIGN KEY(gatunek)
             	REFERENCES koncert(idkoncert)
              ON UPDATE CASCADE ON DELETE SET NULL
                          )
-- --------------------------------------------------------


CREATE TABLE support (
  idsupport       serial,
  Nazwa           char       NOT NULL,
  DataZalozenia   date   DEFAULT NULL,
  Wokalista       char,
CONSTRAINT       support_fk FOREIGN KEY(idsupport)
                         	REFERENCES wykonawca(nazwa)
                          ON UPDATE CASCADE ON DELETE SET NULL
                          );
-- --------------------------------------------------------

CREATE TABLE wstep (
  idwstep    serial,
  Wiek       integer      DEFAULT NULL COMMENT 'ograniczenie wiekowe',
  Cena       numeric(7,2) DEFAULT NULL,
  Pula       numeric(7,2) DEFAULT NULL COMMENT 'pula biletow',

CONSTRAINT       	 wstep_fk FOREIGN KEY(idwstep)
                         	REFERENCES koncert(idnazwa)
                          ON UPDATE CASCADE ON DELETE SET NULL
                          );
-- --------------------------------------------------------

CREATE TABLE wykonawca (
  idwykonawca          serial,
  Nazwa                char                    NOT NULL,
  DataZalozenia        date                    NOT NULL,
  Wokalista            char                    NOT NULL,
CONSTRAINT       	wykonawca_fk FOREIGN KEY(idwykonawca)
                         	REFERENCES koncert(idkoncert)
                          ON UPDATE CASCADE ON DELETE SET NULL
                          );

-- --------------------------------------------------------
CREATE TABLE koncert (
  idkoncert           INT  INCREMENT       NOT NULL,
  Data                date                 NOT NULL,
  Typ                 char                 NOT NULL,
  PatronMedialny      char,
  GodzinaRozpoczecia  TIME                 NOT NULL,
  Miejsce             char                 NOT NULL,
  Miejscowosc         char                 NOT NULL,
  Sponsor             char,

    CONSTRAINT       	koncert_wykonawca_fk FOREIGN KEY(idkoncert)
                       	REFERENCES kraj(nazwa)
                        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT       	koncert_wstep_fk FOREIGN KEY(idkoncert)
                       	REFERENCES trener(id)
                        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT       	koncert_gatunek_fk FOREIGN KEY(idkoncert)
                       	REFERENCES zawodnik(id)
                        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT       	koncert_agecjakoncertowa_fk FOREIGN KEY(idkoncert)
                       	REFERENCES liga(nazwa)
                        ON UPDATE CASCADE ON DELETE SET NULL
                        );
-- --------------------------------------------------------
