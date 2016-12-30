SET TERM ^;

RECREATE PROCEDURE qTourCount (reqYear smallint)
RETURNS (tourfirm TYPE OF COLUMN Tourfirm.Name, quart smallint, tourCount int, delta int)
AS
	DECLARE VARIABLE targetYear smallint;
	DECLARE VARIABLE cTourfirmID int;
	DECLARE VARIABLE prevTourfirmID int;
	DECLARE VARIABLE prevCnt int;
BEGIN
	if(reqYear IS NULL) then targetYear = EXTRACT(YEAR FROM date 'TODAY');
	else targetYear = reqYear;
	
	FOR
		SELECT Tourfirm_ID, (EXTRACT(MONTH FROM Out_date)-1)/3+1 AS qNo, COUNT(*)
		FROM Tour WHERE EXTRACT(YEAR FROM Out_date) = :targetYear
		GROUP BY Tourfirm_ID, qNo
		INTO cTourfirmID, quart, tourCount
	DO BEGIN
		if((prevCnt IS NULL) OR (prevTourfirmID IS NULL) OR (prevTourfirmID <> cTourfirmID))
		then begin delta = 0; prevCnt = tourCount; prevTourfirmID = cTourfirmID; end
		else begin delta = tourCount - prevCnt; prevCnt = tourCount; end
		SELECT Name FROM Tourfirm WHERE ID = :cTourfirmID INTO tourfirm;
		SUSPEND;
	END
END^

SET TERM ;^

select * from qTourCount(2016);