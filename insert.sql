-- Baza danych: `agkoncertowa`
-- --------------------------------------------------------
CREATE TABLE agecjakoncertowa (
  NIP                   int                     INCREMENT       NOT NULL,
  Przedstawiciel        char COLLATE utf8_polish_ci             NOT NULL,
  Siedziba              char COLLATE utf8_polish_ci             NOT NULL,
  Adres                 char COLLATE utf8_polish_ci             NOT NULL,
  GlownyOrganizator     char COLLATE utf8_polish_ci             NOT NULL
)
-- --------------------------------------------------------

CREATE TABLE gatunek (
  idgatunek int INCREMENT NOT NULL,
  gatunek Char(50) NOT NULL
)
-- --------------------------------------------------------

CREATE TABLE koncert (
  idkoncert  INT  INCREMENT NOT NULL,
  Data date NOT NULL,
  Typ char NOT NULL,
  PatronMedialny char,
  GodzinaRozpoczecia TIME NOT NULL,
  Miejsce char NOT NULL,
  Miejscowosc char NOT NULL,
  Sponsor char
)
-- --------------------------------------------------------

CREATE TABLE support (
  idsupport serial,
  Nazwa char NOT NULL,
  DataZalozenia date DEFAULT NULL,
  Wokalista char
)
-- --------------------------------------------------------

CREATE TABLE wstep (
  idwstep serial,
  Wiek integer DEFAULT NULL COMMENT 'ograniczenie wiekowe',
  Cena numeric(7,2) DEFAULT NULL,
  Pula numeric(7,2) DEFAULT NULL COMMENT 'pula biletow'
)
-- --------------------------------------------------------

CREATE TABLE wykonawca (
  idwykonawca serial,
  Nazwa char NOT NULL,
  DataZalozenia date NOT NULL,
  Wokalista char NOT NULL
)
