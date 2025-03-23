-- 1. CREAREA UNUI CONT DE DONATOR

BEGIN
  SAVEPOINT start_transaction;

  -- Verificăm dacă donatorul există deja pe baza adresei de email sau numărului de CI
  DECLARE
    donator_existent INTEGER;
  BEGIN
    -- Verificăm dacă există deja un donator cu același email sau număr CI
    SELECT COUNT(*)
    INTO donator_existent
    FROM donator d
    WHERE d.email = 'ion.popescu@email.com'  -- Emailul donatorului
    OR d.numar_ci = '123456';  -- Numarul CI al donatorului

    -- Dacă există deja, aruncăm o eroare
    IF donator_existent > 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Donatorul există deja în sistem!');
    END IF;
  END;

  -- Inserăm datele donatorului în tabela donator
  INSERT INTO donator (id_donator, nume, email, numar_ci)
  VALUES (donator_id_donator_seq.NEXTVAL, 'Ion Popescu', 'ion.popescu@email.com', '123456');

  -- Inserăm detalii suplimentare ale donatorului în tabela detalii_donator
  INSERT INTO detalii_donator (id_donator, adresa, data_nasterii, greutate, inaltime, judet, oras, gen, telefon, serie)
  VALUES (donator_id_donator_seq.CURRVAL, 'Str. Exemplu 123', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 70, 1.75, 'Bucuresti', 'Bucuresti', 'M', '1234567890', 'AB');

  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    -- Dacă apare o eroare, anulează tranzacția și afișează mesajul
    ROLLBACK TO start_transaction;
    RAISE;
END;


-- 2.	Programarea unei donații 

BEGIN

  SAVEPOINT start_transaction;

  -- Verificăm dacă donatorul există în sistem
  DECLARE
    donator_existent INTEGER;
  BEGIN
    -- Verificăm dacă donatorul există în tabelul 'donator'
    SELECT COUNT(*)
    INTO donator_existent
    FROM donator d
    WHERE d.id_donator = 11;  -- ID-ul donatorului

    -- Dacă donatorul nu există, aruncăm o eroare
    IF donator_existent = 0 THEN
      RAISE_APPLICATION_ERROR(-20003, 'Donatorul nu este înregistrat în sistem!');
    END IF;
  END;

  -- Verificăm dacă donatorul a donat în ultimele 3 luni
  DECLARE
    ultima_donatie DATE;
  BEGIN
    -- Selectăm data ultimei donații a donatorului din tabelul 'detalii_donator'
    SELECT data_ultimei_donatii
    INTO ultima_donatie
    FROM detalii_donator
    WHERE id_donator = 8;

    -- Dacă ultima donație este mai recentă de 3 luni, interzicem o nouă donație
    IF ultima_donatie IS NOT NULL AND ultima_donatie > ADD_MONTHS(SYSDATE, -3) THEN
      RAISE_APPLICATION_ERROR(-20004, 'Donatorul nu poate face o nouă donație decât la 3 luni după ultima donație!');
    END IF;
  END;

  -- Verificăm dacă există locuri disponibile pentru campania respectivă
  DECLARE
    locuri_disponibile INTEGER;
  BEGIN
    -- Folosim LEFT JOIN pentru a obține numărul de programări pentru campania respectivă
    SELECT c.numar_maxim_donatori - NVL(COUNT(p.id_programare), 0) AS locuri_disponibile
    INTO locuri_disponibile
    FROM campanie_donare c
    LEFT JOIN programare p ON c.id_campanie = p.id_campanie
    AND p.data_programare = TO_DATE('2025-01-10', 'YYYY-MM-DD')
    WHERE c.id_campanie = 900
    GROUP BY c.numar_maxim_donatori;

    -- Verificăm dacă există locuri disponibile in campania respectiva
    IF locuri_disponibile <= 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'Nu mai sunt locuri disponibile pentru această dată!');
    END IF;
  END;

  -- Verificăm dacă donatorul are deja o programare la această dată
  DECLARE
    programare_existentă INTEGER; 
  BEGIN
    -- Verificăm dacă donatorul are deja o programare
    SELECT COUNT(*)
    INTO programare_existentă
    FROM programare p
    WHERE p.id_donator = 8
    AND p.data_programare = TO_DATE('2025-01-7', 'YYYY-MM-DD');

    -- Dacă donatorul are deja o programare la aceleași date, aruncăm o eroare
    IF programare_existentă > 0 THEN
      RAISE_APPLICATION_ERROR(-20002, 'Donatorul are deja o programare pentru această dată!');
    END IF;
  END;

  -- Creăm programarea pentru donator
  INSERT INTO programare (data_programare, status_programare, id_tip_donatie, id_donator, id_campanie)
  VALUES (TO_DATE('2025-01-7', 'YYYY-MM-DD'), 'Programata', 150, 8, 902);

  -- Actualizăm numărul de locuri disponibile pentru campania respectivă
  UPDATE campanie_donare
  SET numar_maxim_donatori = numar_maxim_donatori - 1
  WHERE id_campanie = 902;

  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    -- Dacă apare o eroare, anulează tranzacția și afișează mesajul
    ROLLBACK TO start_transaction;
    RAISE; 
END;

-- 3. Lăsarea unui feedback pentru o campanie 

BEGIN

  SAVEPOINT start_transaction;

  -- Verificăm dacă donatorul a donat efectiv
  DECLARE
    donator_donator INTEGER;
  BEGIN
    -- Verificăm dacă donatorul are o programare finalizată
    SELECT COUNT(*)
    INTO donator_donator
    FROM programare p
    WHERE p.id_donator = 11  -- ID-ul donatorului
    AND p.status_programare = 'Finalizata'
    AND p.data_programare < SYSDATE;  -- Asigurăm că donația a avut loc

    -- Dacă nu există o programare finalizată, aruncăm o eroare
    IF donator_donator = 0 THEN
      RAISE_APPLICATION_ERROR(-20006, 'Donatorul trebuie să fi finalizat o donație înainte de a lăsa un feedback!');
    END IF;
  END;

  -- Verificăm dacă donatorul a lăsat deja un feedback pentru această campanie
  DECLARE
    feedback_existent INTEGER;
  BEGIN
    -- Verificăm dacă donatorul a lăsat deja un feedback pentru campania respectivă
    SELECT COUNT(*)
    INTO feedback_existent
    FROM feedback f
    WHERE f.id_donator = 11  -- ID-ul donatorului
    AND f.id_campanie = 900;  -- ID-ul campaniei

    -- Dacă feedback-ul există deja, aruncăm o eroare
    IF feedback_existent > 0 THEN
      RAISE_APPLICATION_ERROR(-20005, 'Donatorul a lăsat deja un feedback pentru această campanie!');
    END IF;
  END;

  -- Verificăm dacă programarea donatorului este recentă (în ultimele 30 de zile)
  DECLARE
    data_programare DATE;
  BEGIN
    -- Selectăm data programării finalizate
    SELECT p.data_programare
    INTO data_programare
    FROM programare p
    WHERE p.id_donator = 11  -- ID-ul donatorului
    AND p.status_programare = 'Finalizata'
    AND p.data_programare < SYSDATE
    ORDER BY p.data_programare DESC
    FETCH FIRST 1 ROWS ONLY;  -- Luăm doar cea mai recentă programare finalizată

    -- Verificăm dacă programarea este în ultimele 30 de zile
    IF data_programare < SYSDATE - 30 THEN
      RAISE_APPLICATION_ERROR(-20007, 'Feedback-ul poate fi lăsat doar pentru programările din ultimele 30 de zile!');
    END IF;
  END;

  -- Lăsăm feedback-ul
  INSERT INTO feedback (id_donator, id_campanie, comentariu, nota)
  VALUES (11, 900, 'Super!', 5);

  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    -- Dacă apare o eroare, anulează tranzacția și afișează mesajul
    ROLLBACK TO start_transaction;
    RAISE; 
END;

-- 4.	Permiterea vizualizării de către utilizatorii platformei de donare de sânge a feedback-urilor  disponibile pentru toate campaniile de donare 

SELECT 
    c.denumire_campanie,
    f.comentariu,
    f.nota,
    f.id_donator,
    d.nume AS nume_donator,
    f.id_campanie
FROM 
    feedback f
JOIN 
    campanie_donare c ON f.id_campanie = c.id_campanie
JOIN 
    donator d ON f.id_donator = d.id_donator
ORDER BY 
    c.denumire_campanie, f.id_donator;
    
    
-- 5.	Anularea unei programări 

UPDATE programare
SET status_programare = 'Anulata'
WHERE id_donator = 2  -- ID-ul donatorului care solicita anularea programarii
  AND status_programare = 'Programata';
  
-- 6.	Ștergerea unui cont de donator 

BEGIN
    -- Șterge întâi feedback-ul asociat donatorului
    DELETE FROM feedback
    WHERE id_donator = 10;

    -- Șterge întâi programările asociate donatorului din tabela programare
    DELETE FROM programare
    WHERE id_donator = 10;

    -- Șterge înregistrările din tabelul detalii_donator pentru același donator
    DELETE FROM detalii_donator
    WHERE id_donator = 10;

    -- În final, șterge donatorul din tabelul donator
    DELETE FROM donator
    WHERE id_donator = 10;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        -- Dacă apare o eroare, anulează tranzacția
        ROLLBACK;
        RAISE;
END;


-- 7.	Actualizarea statusului unei programări 

BEGIN

  SAVEPOINT start_transaction;

  -- Verificăm dacă există programări cu statusul 'Programată' și data programării trecută
  DECLARE
    programare_existentă INTEGER;
  BEGIN
    -- Verificăm dacă există programări cu data mai mică decât data curentă și statusul 'Programată'
    SELECT COUNT(*)
    INTO programare_existentă
    FROM programare p
    WHERE p.data_programare < SYSDATE
    AND p.status_programare = 'Programata';

    -- Dacă există, actualizăm statusul acestora
    IF programare_existentă > 0 THEN
      UPDATE programare
      SET status_programare = 'Finalizata'
      WHERE data_programare < SYSDATE
      AND status_programare = 'Programata';
      
      COMMIT;
    ELSE
      -- Dacă nu există programări de acest tip, anulați tranzacția
      ROLLBACK TO start_transaction;
    END IF;
  END;

EXCEPTION
  WHEN OTHERS THEN
    -- Dacă apare o eroare, anulează tranzacția și afișează mesajul
    ROLLBACK TO start_transaction;
    RAISE;
END;

-- 8.	Actualizare data ultimei donatii unui donator 

BEGIN
  -- Start tranzacție
  SAVEPOINT start_transaction;

  -- Verificăm și actualizăm datele ultimei donații
  FOR programare_rec IN (
    SELECT p.id_donator, p.data_programare
    FROM programare p
    WHERE p.status_programare = 'Finalizata'
  )
  LOOP
    -- Actualizăm data ultimei donații pentru donatorul corespunzător
    UPDATE detalii_donator
    SET data_ultimei_donatii = programare_rec.data_programare
    WHERE id_donator = programare_rec.id_donator
    AND (data_ultimei_donatii IS NULL OR data_ultimei_donatii < programare_rec.data_programare);
  END LOOP;

  COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    -- În caz de eroare, anulăm tranzacția
    ROLLBACK TO start_transaction;

    RAISE; 
END;

-- 9.	Permiterea vizualizării de către toți utilizatorii platformei a campaniilor disponibile, 
         -- a locatiilor disponibile de donare, dar si a numarului maxim de donatori suportat.
         
SELECT 
    c.denumire_campanie AS Campanie,
    l.denumire AS Locatie,
    c.numar_maxim_donatori AS Numar_Maxim_Donatori
FROM campanie_donare c
JOIN locatie l ON c.id_locatie = l.id_locatie
WHERE c.data >= SYSDATE -- Selectează doar campaniile viitoare sau active
ORDER BY c.data;





