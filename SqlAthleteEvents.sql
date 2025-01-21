--create database AthleteEvent;

--Select * from athlete_events;

--ALTER TABLE athlete_events
--ADD new_id INT IDENTITY(1,1);

--ALTER TABLE athlete_events
--ADD CONSTRAINT PK_athlete_events PRIMARY KEY (new_id);

--1.	Write a SQL query to list down all the Olympic Games held so far.

SELECT DISTINCT games FROM athlete_events;

--2.	SQL query to fetch total no of countries participated in each olympic games.

SELECT Games, COUNT(DISTINCT NOC) AS TotalCountries
FROM athlete_events
GROUP BY Games;

--3.	Write a SQL query to return the Olympic Games which had the highest participating countries and the lowest participating countries.

--highest participating countries
SELECT TOP 1 Games, COUNT(DISTINCT NOC) AS TotalCountries
FROM athlete_events
GROUP BY Games
ORDER BY COUNT(DISTINCT NOC) DESC; -- Order by the actual aggregate

--lowest participating countries
SELECT TOP 1 Games, COUNT(DISTINCT NOC) AS TotalCountries
FROM athlete_events
GROUP BY Games
ORDER BY COUNT(DISTINCT NOC) ASC;

--=========================== OR ====================

WITH CountryCounts AS (
    SELECT Games, COUNT(DISTINCT NOC) AS TotalCountries
    FROM athlete_events
    GROUP BY Games
)
SELECT TOP 1 Games, TotalCountries
FROM CountryCounts
ORDER BY TotalCountries DESC;  -- Highest

--4. Return the list of countries that have been part of every Olympic game

SELECT NOC
FROM athlete_events
GROUP BY NOC
HAVING COUNT(DISTINCT Games) = (SELECT COUNT(DISTINCT Games) FROM athlete_events);

--5.	SQL query to fetch total no of countries participated in each olympic games. (same as second)

SELECT Games, COUNT(DISTINCT NOC) AS TotalCountries
FROM athlete_events
GROUP BY Games;

--6.	SQL query to fetch the list of all sports which have been part of every olympics.

SELECT Sport
FROM athlete_events
GROUP BY Sport
HAVING COUNT(DISTINCT Games) = (SELECT COUNT(DISTINCT Games) FROM athlete_events);

--7.	Using SQL query, Identify the sport which were just played once in all of olympics.

SELECT Sport ,COUNT(DISTINCT Games) As Games
FROM athlete_events
GROUP BY Sport
HAVING COUNT(DISTINCT Games) = 1;

--8.	Write SQL query to fetch the total no of sports played in each olympics.

SELECT Games, COUNT(DISTINCT Sport) AS TotalSports
FROM athlete_events
GROUP BY Games;

--9.	SQL Query to fetch the details of the oldest athletes to win a gold medal at the olympics.

SELECT ID, Name, Age, Medal
FROM  athlete_events 
WHERE Medal = 'Gold'
ORDER BY Age DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;


--10.	Write a SQL query to get the ratio of male and female participants

SELECT COUNT(*) AS MaleCount
FROM athlete_events 
WHERE Sex = 'M';

SELECT COUNT(*) AS FemaleCount
FROM athlete_events 
WHERE Sex = 'F';

--11.  Fetch the top 5 athletes who have won the most gold medals

SELECT TOP 5 Name, COUNT(Medal) AS GoldMedals	
From athlete_events
WHERE Medal = 'Gold'
GROUP BY Name
ORDER BY GoldMedals DESC;

--12.  Fetch the top 5 athletes who have won the most medals (Gold, Silver, and Bronze)

SELECT TOP 5 Name, COUNT(Medal) AS TotalMedals
FROM athlete_events
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY Name
ORDER BY TotalMedals DESC;

--13. Fetch the top 5 most successful countries in Olympics (Success is defined by number of medals won)

SELECT TOP 5 NOC, COUNT(Medal) AS TotalMedals
FROM athlete_events
WHERE Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY NOC
ORDER BY TotalMedals DESC;

--14.	Write a SQL query to list down the total gold, silver and bronze medals won by each country.

--Gold Medals:

SELECT NOC, COUNT(*) AS Gold
FROM athlete_events
WHERE Medal = 'Gold'
GROUP BY NOC;

--Silver Medals:

SELECT NOC, COUNT(*) AS Silver
FROM athlete_events
WHERE Medal = 'Silver'
GROUP BY NOC;

--Bronze Medals:

SELECT NOC, COUNT(*) AS Bronze
FROM athlete_events
WHERE Medal = 'Bronze'
GROUP BY NOC;

--15.	Write a SQL query to list down the total gold, silver and bronze medals won by each country corresponding to each olympic games.

--Query for Gold Medals:

SELECT Games, NOC, COUNT(*) AS Gold
FROM athlete_events
WHERE Medal = 'Gold'
GROUP BY Games, NOC;

--Query for Silver Medals:

SELECT Games, NOC, COUNT(*) AS Silver
FROM athlete_events
WHERE Medal = 'Silver'
GROUP BY Games, NOC;

--Query for Bronze Medals:

SELECT Games, NOC, COUNT(*) AS Bronze
FROM athlete_events
WHERE Medal = 'Bronze'
GROUP BY Games,NOC;

--16.	Write SQL query to display for each Olympic Games, which country won the highest gold, silver and bronze medals.

--Highest Gold Medal for Each Olympic Games

SELECT Games, NOC, COUNT(*) AS Gold
FROM athlete_events
WHERE Medal = 'Gold'
GROUP BY Games, NOC
ORDER BY Gold DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

--Highest Silver Medal for Each Olympic Games

SELECT Games, NOC, COUNT(*) AS Silver
FROM athlete_events
WHERE Medal = 'Silver'
GROUP BY Games, NOC
ORDER BY  Silver DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

--Highest Bronze Medal for Each Olympic Games

SELECT Games, NOC, COUNT(*) AS Bronze
FROM athlete_events
WHERE Medal = 'Bronze'
GROUP BY Games, NOC
ORDER BY  Bronze DESC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

--17.	Identify during each Olympic Games, which country won the highest gold, silver and bronze medals. 
--Along with this, identify also the country with the most medals in each olympic games.

SELECT Games, NOC, COUNT(*) AS TotalMedals
FROM athlete_events
GROUP BY Games, NOC
ORDER BY  TotalMedals DESC;

--18.	Write a SQL Query to fetch details of countries which have won silver or bronze medal but never won a gold medal.
	
SELECT NOC 
FROM athlete_events
WHERE Medal IN ('Silver', 'Bronze')
GROUP BY NOC
HAVING COUNT(Medal) > 0;


--19.	Write SQL Query to return the sport which has won India the highest no of medals.

SELECT TOP 1 Sport, COUNT(*) AS MedalCount
FROM athlete_events
WHERE NOC = 'IND' AND Medal IN ('Gold', 'Silver', 'Bronze')
GROUP BY Sport
ORDER BY MedalCount DESC;

--20.	Write an SQL Query to fetch details of all Olympic Games where India won medal(s) in hockey.

SELECT DISTINCT Games, Year, Season, City ,Medal,Sport
FROM athlete_events
WHERE NOC = 'IND' AND Sport = 'Hockey' AND Medal IN ('Gold', 'Silver', 'Bronze');
