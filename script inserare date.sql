-- Constrângerea detalii_donator_greutate_ck (greutate între 50 și 120):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada X', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 45, 170, 'Bucuresti', 'Bucuresti', 'M', '0712345678', 18, 'AB', 'A');
-- ORA-02290: check constraint (SCHEMA_NAME.DETALII_DONATOR_GREUTATE_CK) violated

-- Constrângerea detalii_donator_judet_ck (judet cu litere și posibile cratime sau spații):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada Y', TO_DATE('1985-06-15', 'YYYY-MM-DD'), 70, 175, 'Bucuresti123', 'Bucuresti', 'F', '0723456799', 20, 'BC', 'A');
-- ORA-02290: check constraint (SCHEMA_NAME.DETALII_DONATOR_JUDET_CK) violated

-- Constrângerea detalii_donator_oras_ck (oras cu litere și posibile cratime sau spații):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada Z', TO_DATE('1992-03-10', 'YYYY-MM-DD'), 80, 180, 'Cluj', 'Cluj123', 'M', '0734568890', 22, 'XY', 'A');
-- ORA-02290: check constraint (SCHEMA_NAME.DETALII_DONATOR_ORAS_CK) violated

-- Constrângerea detalii_donator_gen_ck (gen să fie 'M' sau 'F'):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada A', TO_DATE('1994-08-21', 'YYYY-MM-DD'), 65, 160, 'Timis', 'Timisoara', 'X', '0745670901', 23, 'GH', 'B');
-- ORA-02290: check constraint (SCHEMA_NAME.DETALII_DONATOR_GEN_CK) violated

-- Constrângerea detalii_donator_tel_ck (telefon să fie exact 10 cifre):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada B', TO_DATE('1989-09-12', 'YYYY-MM-DD'), 75, 170, 'Sibiu', 'Sibiu', 'M', '07123', 24, 'EF', 'AB');
--ORA-02290: check constraint (SCHEMA_NAME.DETALII_DONATOR_TEL_CK) violated

-- Constrângerea detalii_donator_serie_ck (serie validă în funcție de județ):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada C', TO_DATE('1996-12-05', 'YYYY-MM-DD'), 68, 165, 'Iasi', 'Iasi', 'F', '0781234567', 26, 'XT', 'A');
-- ORA-02290: check constraint (SCHEMA_NAME.DETALII_DONATOR_SERIE_CK) violated

-- Constrângerea grupa_sanguina (grupă sanguină să fie validă):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada D', TO_DATE('1993-07-25', 'YYYY-MM-DD'), 85, 180, 'Galati', 'Galati', 'M', '0798765432', 27, 'PQ', 'Z');
-- ORA-02290: check constraint (SCHEMA_NAME.DETALII_DONATOR_GRUPA_SANGUINA_CK) violated

-- Constrângerea detalii_donator_pk (id_donator unic):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada E', TO_DATE('1987-11-15', 'YYYY-MM-DD'), 72, 178, 'Bucuresti', 'Bucuresti', 'F', '0701122334', 1, 'GH', 'B');
-- ORA-00001: unique constraint (SCHEMA_NAME.DETALII_DONATOR_PK) violated

-- Constrângerea detalii_donator_telefon_uk (telefon unic):
INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina)
VALUES ('Strada C', TO_DATE('1996-12-05', 'YYYY-MM-DD'), 68, 165, 'Iasi', 'Iasi', 'F', '0781234567', 7, 'MX', 'A');
-- ORA-00001: unique constraint (SCHEMA_NAME.DETALII_DONATOR_TELEFON_UK) violated

-- Inserare invalidă, eroare pentru `status_programare` invalid
INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-07-10', 'YYYY-MM-DD'), 'În așteptare', 50, 1, 500);
-- ORA-02290: check constraint (BD165.PROGRAMARE_DONARE_STAT_PROG_CK) violated

-- Inserare invalidă, eroare pentru `id_tip_donatie` care nu există
INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-06-10', 'YYYY-MM-DD'), 'Programată', 999, 1, 500);
-- ORA-02291: integrity constraint (BD165.TIP_DONATIE_PROGRAMARE_FK) violated - parent key not found

-- -- Inserare invalidă, eroare pentru `nota` mai mare de 5.0
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Test Comentariu', 6.0, 1, 500);
-- ORA-02290: check constraint (BD165.FEEDBACK_NOTA_CK) violated

-- Inserare invalidă, eroare pentru `id_campanie` care nu există
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Test Comentariu', 4.5, 1, 999);
-- ORA-02291: integrity constraint (BD165.CAMP_FEEDBACK_FK) violated - parent key not found

-- Inserare invalidă, eroare pentru `id_locatie` care nu există
INSERT INTO campanie_donare (id_campanie, denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES (601, 'Campanie Buzău - Iulie', TO_DATE('2025-07-15', 'YYYY-MM-DD'), 50, 999);
-- ORA-02291: integrity constraint (BD165.LOCATIE_CAMPANIE_DONARE_FK) violated - parent key not found

-- Inserare invalidă, eroare pentru `denumire_campanie` NULL
INSERT INTO campanie_donare (id_campanie, denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES (600, NULL, TO_DATE('2025-06-20', 'YYYY-MM-DD'), 50, 100);
-- SQL Error: ORA-01400: cannot insert NULL into ("BD165"."CAMPANIE_DONARE"."DENUMIRE_CAMPANIE")

-- Inserare validă, eroare pentru duplicarea id_campanie
INSERT INTO campanie_donare (id_campanie, denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES (500, 'Test Campaign', TO_DATE('2025-12-15', 'YYYY-MM-DD'), 100, 100);
-- ORA-00001: unique constraint (BD165.CAMPANIE_DONARE_PK) violated



