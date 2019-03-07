/*1*/
SELECT COUNT(*) as registres FROM  flights;

/*2*/
SELECT Origin, AVG(ArrDelay), AVG(DepDelay) FROM flights
GROUP BY Origin;

/*3*/
SELECT Origin, AVG(ArrDelay) as retard, colMonth FROM flights
GROUP BY Origin, colMonth
ORDER BY Origin, colMonth;

/*4*/
SELECT  a.City, AVG(f.ArrDelay) as retard, f.colMonth
FROM flights f
INNER JOIN usairports a
ON f.Origin = a.IATA
GROUP BY a.City, f.colMonth
ORDER BY a.City, retard, f.colMonth;

/*5*/
SELECT c.Description, f.cancelled 
FROM flights f
INNER JOIN carriers c
ON f.UniqueCarrier = c.CarrierCode
WHERE f.cancelled >0
ORDER BY f.cancelled desc;

/*6*/
SELECT flightiD, Distance FROM flights
ORDER BY Distance desc
LIMIT 10;

/*7*/
SELECT UniqueCarrier, avg(ArrDelay) as retras from flights
group by UniqueCarrier
having retras>10
ORDER BY retras desc;