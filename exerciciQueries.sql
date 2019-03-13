/*1*/
SELECT COUNT(*) as registres FROM  flights;

/*2*/
SELECT Origin, AVG(ArrDelay), AVG(DepDelay) FROM flights
GROUP BY Origin;

/*3*/
SELECT Origin, colYear, colMonth, AVG(ArrDelay) as retard FROM flights
GROUP BY Origin, colYear, colMonth
ORDER BY Origin, colYear, colMonth;

/*4*/
SELECT  a.City, f.colYear, f.colMonth, AVG(f.ArrDelay) as retard
FROM flights f
LEFT JOIN usairports a
ON f.Origin = a.IATA
GROUP BY a.City, f.colYear, f.colMonth
ORDER BY a.City, f.colYear, f.colMonth;



/*5*/
SELECT c.Description, f.cancelled 
FROM flights f
INNER JOIN carriers c
ON f.UniqueCarrier = c.CarrierCode
WHERE f.cancelled >0
GROUP BY c.Description
ORDER BY f.cancelled desc;

/*5 new */
SELECT UniqueCarrier, sum(cancelled) as cancelados
FROM flights f
GROUP BY UniqueCarrier;


SELECT c.Description, sum(f.cancelled) as cancelados
FROM flights f
INNER JOIN carriers c
ON f.UniqueCarrier = c.CarrierCode
WHERE cancelados >0
GROUP BY c.Description
ORDER BY cancelados;

/*5 ok*/

SELECT c.Description, sum(f.cancelled) as cancelados
FROM flights f
INNER JOIN carriers c
ON f.UniqueCarrier = c.CarrierCode
GROUP BY c.Description
HAVING cancelados >0
ORDER BY cancelados desc;




/*6*/
SELECT flightNum, Distance FROM flights
GROUP BY flightNum
ORDER BY Distance desc
LIMIT 10;



/*7*/
SELECT UniqueCarrier, avg(ArrDelay) as retras from flights
group by UniqueCarrier
having retras>10
ORDER BY retras desc;