-- Popularea tabelului "locatie" 

INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Spitalul Universitar', 'Strada Universității 12, Iași', '47.1575, 27.5916');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Centrul de Donare Botoșani', 'Strada 1 Decembrie 25, Botoșani', '47.7467, 26.6656');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Spitalul Județean Cluj', 'Strada Vasile Alecsandri 5, Cluj-Napoca', '46.7719, 23.6236');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Spitalul Municipal București', 'Strada Făurei 33, București', '44.4268, 26.1025');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Centrul de Transfuzie Sânge Ploiești', 'Strada Prahova 10, Ploiești', '44.9480, 26.0213');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Centrul de Transfuzie Sânge Brașov', 'Strada Gării 28, Brașov', '45.6522, 25.6104');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Spitalul de Urgență Timișoara', 'Strada Bălcescu 45, Timișoara', '45.7489, 21.2087');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Centrul de Donare Constanța', 'Strada Tomis 15, Constanța', '44.4268, 28.0367');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Centrul de Transfuzie Sânge Craiova', 'Strada Libertății 33, Craiova', '44.3304, 23.7944');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Spitalul Județean Sibiu', 'Strada Avram Iancu 25, Sibiu', '45.7931, 24.1467');
INSERT INTO locatie (denumire, adresa, coordonate_geografice)
VALUES ('Spitalul Municipal Oradea', 'Strada Iosif Vulcan 45, Oradea', '47.0480, 21.9189');

select * from locatie;

-- Populare tabela "tip_donatie"

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Sânge integral', 'Donare de sânge integral', 'Vârsta 18-60 ani, Greutate minimă 50kg');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Plasmă', 'Donare de plasmă', 'Vârsta 18-60 ani, Fără afecțiuni cronice');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Trombocite', 'Donare de trombocite', 'Vârsta 18-55 ani, Greutate minimă 55kg');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Celule stem', 'Donare de celule stem hematopoietice', 'Vârsta 18-45 ani, sănătate generală bună');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Plasmă convalescentă', 'Donare de plasmă convalescentă COVID-19', 'Vârsta 18-60 ani, test COVID negativ');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Plasmă pentru bolile rare', 'Donare de plasmă pentru tratamente în cazuri rare', 'Vârsta 18-60 ani, Fără afecțiuni cronice');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Sânge pentru transplanturi', 'Donare de sânge pentru transplanturi', 'Vârsta 18-60 ani, Greutate minimă 50kg');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Hemoglobină dublă', 'Donare de hemoglobină dublă utilizată pentru pacienți cu anemie severă', 'Varsta 18-60 ani, Greutate minima 70kg');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Plasmă hiperimună', 'Donare de plasmă bogată în anticorpi pentru boli infecțioase', 'Varsta 18-60 ani, Teste medicale valide, Greutate minima 55kg');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Granulocite', 'Donare de granulocite pentru pacienți cu infecții severe', 'Varsta 18-50 ani, Greutate minima 60kg, Fără antecedente de boli cronice');

INSERT INTO tip_donatie (tip_donatie, descriere, criterii_eligibilitate)
VALUES ('Eritrocite', 'Donare de eritrocite utilizate pentru pacienți cu pierderi masive de sânge', 'Varsta 18-55 ani, Greutate minima 65kg, Analize compatibile');

select * from tip_donatie;


-- Populare tabela "donator"

-- Popularea tabelului "donator"
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Andrei Popescu', 'andrei.popescu@example.com', '123456');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Maria Ionescu', 'maria.ionescu@example.com', '654321');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Ioana Mihailescu', 'ioana.mihalescu@example.com', '345678');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('George Stanciu', 'george.stanciu@example.com', '456789');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Ana Cristea', 'ana.cristea@example.com', '567890');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Vlad Iordache', 'vlad.iordache@example.com', '678901');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Livia Georgescu', 'livia.georgescu@example.com', '789012');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Radu Rusu', 'radu.rusu@example.com', '890123');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Elena Popa', 'elena.popa@example.com', '901234');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Lucian Ionescu', 'lucian.ionescu@example.com', '012345');
INSERT INTO donator (nume, email, numar_ci)
VALUES ('Camelia Vasilescu', 'camelia.vasilescu@example.com', '123789');


-- Populare tabela "detalii_donator"

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Calea Moților 3, Cluj-Napoca', TO_DATE('1985-07-09', 'YYYY-MM-DD'), 80.0, 1.85, 'Cluj', 'Cluj-Napoca', 'M', '0734567890', 3, 'CX', '0', TO_DATE('2024-12-01', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Păcii 45, Timișoara', TO_DATE('1993-03-30', 'YYYY-MM-DD'), 65.4, 1.70, 'Timis', 'Timisoara', 'F', '0745678901', 4, 'CY', 'A', TO_DATE('2024-10-05', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Libertății 29, București', TO_DATE('1995-06-15', 'YYYY-MM-DD'), 72.0, 1.75, 'Bucuresti', 'Bucuresti', 'M', '0756789012', 5, 'CA', 'AB', TO_DATE('2024-09-23', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Sănătății 12, Brașov', TO_DATE('1980-02-11', 'YYYY-MM-DD'), 68.3, 1.68, 'Brasov', 'Brasov', 'F', '0767890123', 6, 'CB', '0', TO_DATE('2024-11-11', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Dorobantilor 5, Ploiesti', TO_DATE('1990-10-25', 'YYYY-MM-DD'), 60.5, 1.60, 'Prahova', 'Ploiesti', 'F', '0778901234', 7, 'DC', 'A', TO_DATE('2024-08-19', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Gării 14, Craiova', TO_DATE('1987-12-20', 'YYYY-MM-DD'), 77.5, 1.80, 'Dolj', 'Craiova', 'M', '0789012345', 8, 'DE', 'B', TO_DATE('2024-07-30', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Lăpuș 10, Constanta', TO_DATE('1996-01-18', 'YYYY-MM-DD'), 62.0, 1.65, 'Constanta', 'Constanta', 'F', '0790123456', 9, 'EF', 'AB', TO_DATE('2024-06-01', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Ștefan Cel Mare 23, Sibiu', TO_DATE('1983-11-03', 'YYYY-MM-DD'), 70.0, 1.77, 'Sibiu', 'Sibiu', 'M', '0801234567', 10, 'FG', '0', TO_DATE('2024-04-15', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Găsiti 22, Botosani', TO_DATE('1992-08-09', 'YYYY-MM-DD'), 79.0, 1.83, 'Botosani', 'Dorohoi', 'M', '0812345678', 11, 'XT', 'AB', TO_DATE('2024-03-30', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Tineretului 12, Brașov', TO_DATE('1991-05-25', 'YYYY-MM-DD'), 70.5, 1.80, 'Brasov', 'Brasov', 'M', '0723456789', 1, 'GH', '0', TO_DATE('2024-05-15', 'YYYY-MM-DD'));

INSERT INTO detalii_donator (adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, id_donator, serie, grupa_sanguina, data_ultimei_donatii)
VALUES ('Strada Mihai Eminescu 50, Cluj-Napoca', TO_DATE('1989-11-10', 'YYYY-MM-DD'), 75.0, 1.82, 'Cluj', 'Cluj-Napoca', 'F', '0739876543', 2, 'HI', 'AB', TO_DATE('2024-06-25', 'YYYY-MM-DD'));

select * from detalii_donator;


-- Populare tabela "campanie_donare"

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Campania de donare de sânge pentru bolnavii de leucemie', TO_DATE('2025-02-20', 'YYYY-MM-DD'), 350, 1000);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Donare de plasmă pentru recuperarea pacienților cu arsuri grave', TO_DATE('2025-03-25', 'YYYY-MM-DD'), 250, 1100);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Campania de donare de plasmă pentru cancer', TO_DATE('2025-05-12', 'YYYY-MM-DD'), 300, 1200);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Donare sânge pentru copii', TO_DATE('2025-06-25', 'YYYY-MM-DD'), 600, 1300);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Campanie de donare de organe pentru transplanturi', TO_DATE('2025-07-10', 'YYYY-MM-DD'), 200, 1400);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Donare sânge pentru spitale', TO_DATE('2025-08-15', 'YYYY-MM-DD'), 500, 1500);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Campania de donare de măduvă', TO_DATE('2025-09-12', 'YYYY-MM-DD'), 150, 1600);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Donare de sânge pentru urgențe', TO_DATE('2025-10-08', 'YYYY-MM-DD'), 400, 1700);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Campania de donare pentru salvarea copiilor', TO_DATE('2025-11-11', 'YYYY-MM-DD'), 300, 1800);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Donare de plasmă pentru bolile rare', TO_DATE('2025-12-03', 'YYYY-MM-DD'), 200, 1900);

INSERT INTO campanie_donare (denumire_campanie, data, numar_maxim_donatori, id_locatie)
VALUES ('Donare sânge pentru accidente', TO_DATE('2025-02-05', 'YYYY-MM-DD'), 600, 2000);

select * from campanie_donare;


-- Populare tabel "feedback"

-- Popularea tabelului "feedback"
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Foarte bună organizarea!', 5.0, 1, 900);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Totul a decurs perfect.', 5.0, 2, 901);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Recomand această campanie!', 4.5, 3, 902);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('O experiență plăcută.', 4.0, 4, 903);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Mulțumesc pentru suport!', 5.0, 5, 904);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Personalul este foarte amabil.', 5.0, 6, 905);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Un proces simplu și rapid.', 4.5, 7, 906);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Totul a fost la superlativ.', 5.0, 8, 907);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Am fost tratat cu respect.', 4.0, 9, 908);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('O experiență excelentă!', 5.0, 10, 909);
INSERT INTO feedback (comentariu, nota, id_donator, id_campanie)
VALUES ('Totul a fost bine organizat și eficient.', 4.5, 11, 905);

select * from feedback;

-- Populare tabel "programare"
select * from donator;
select * from campanie_donare;

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-09-12 10:00', 'YYYY-MM-DD HH24:MI'), 'Disponibila', 100, NULL, 908);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-08-19 11:00', 'YYYY-MM-DD HH24:MI'), 'Disponibila', 110, NULL, 909);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2024-03-03 12:00', 'YYYY-MM-DD HH24:MI'), 'Finalizata', 120, 11, 908);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2024-03-03 13:00', 'YYYY-MM-DD HH24:MI'), 'Finalizata', 130, 10, 907);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-08-18 14:00', 'YYYY-MM-DD HH24:MI'), 'Disponibila', 140, NULL, 906);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-07-13 15:00', 'YYYY-MM-DD HH24:MI'), 'Disponibila', 150, NULL, 905);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-08-09 16:00', 'YYYY-MM-DD HH24:MI'), 'Programata', 160, 9, 904);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-03-03 17:00', 'YYYY-MM-DD HH24:MI'), 'Disponibila', 170, 8, 906);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-08-27 18:00', 'YYYY-MM-DD HH24:MI'), 'Programata', 180, 7, 906);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-09-09 19:00', 'YYYY-MM-DD HH24:MI'), 'Programata', 190, 6, 905);

INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
VALUES (TO_DATE('2025-02-03 20:00', 'YYYY-MM-DD HH24:MI'), 'Programata', 200, 2, 904);

select * from programare;




































