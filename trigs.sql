CREATE EXCEPTION dupZakaz 'Duplicate order detected!';

SET TERM ^;

RECREATE TRIGGER noDupZakaz BEFORE INSERT ON Zakaz AS
	DECLARE VARIABLE cnt int;
BEGIN
	SELECT count(*) FROM Zakaz WHERE (Tour_id = NEW.Tour_id) AND (Client_id = NEW.Client_id)
	INTO cnt;
	if(cnt <> 0) then EXCEPTION dupZakaz;
END^

SET TERM ;^

CREATE EXCEPTION limZakaz 'This client has reached maxium order limit!';

SET TERM ^;

RECREATE TRIGGER noDupZakaz BEFORE INSERT ON Zakaz AS
	DECLARE VARIABLE cnt int;
BEGIN
	SELECT count(*) FROM Zakaz WHERE Client_id = NEW.Client_id
	INTO cnt;
	if(cnt = 3) then EXCEPTION limZakaz;
END^

SET TERM ;^



