SET @d=0, @a=0, @p=0, @s=0;
SELECT MAX(Doctor),MAX(Professor),MAX(SINGER),MAX(Actor)
FROM
(SELECT IF(OCCUPATION='Actor',NAME,NULL) AS Actor,
        IF(OCCUPATION='Doctor',NAME,NULL) AS Doctor,
        IF(OCCUPATION='Professor',NAME,NULL) AS Professor,
        IF(OCCUPATION='Singer',NAME,NULL) AS SINGER,
 CASE OCCUPATION
    WHEN 'Actor' THEN @a:=@a+1
    WHEN 'Doctor' THEN @d:=@d+1
    WHEN 'Professor' THEN @p:=@p+1
    WHEN 'Singer' THEN @s:=@s+1
 END
AS idn FROM OCCUPATIONS ORDER BY NAME )
AS temp GROUP BY temp.idn;

/*
SET- UPDATE to specify which columns and values that should be updated in a table.
-----------------------------------------------------------------------------------
MAX- Maximum Value a columns
-------------------------------------------------------------------------------------
IF( CONDITION, VALUE_IF_TRUE, VALUE_IF_FALSE)
-----------------------------------------------------------------------------------------
CASE
WHEN CONDITION1 THEN RESULT1
WHEN CONDITION2 THEN RESULT2
END
-----------------------------------------------------------------------------------------

*/
