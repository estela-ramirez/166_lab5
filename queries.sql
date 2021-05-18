SELECT S.sid, COUNT (*) AS pcount
FROM Parts P, Suppliers S, Catalog C
WHERE P.pid = C.pid AND S.sid = C.sid
GROUP BY S.sid;

SELECT S.sid, COUNT (*) AS pcount
FROM Parts P, Suppliers S, Catalog C
WHERE P.pid = C.pid AND S.sid = C.sid
GROUP BY S.sid
HAVING COUNT (*) > 2;



SELECT S3.sname, COUNT(*) AS pcount
FROM Suppliers S3
WHERE S3.sid IN (
SELECT S.sid
FROM Suppliers S, Parts P, Catalog C
WHERE P.pid = C.pid AND S.sid = C.sid AND P.color =  'Green'
EXCEPT
SELECT S2.sid
FROM Suppliers S2, Parts P2, Catalog C2
WHERE P2.pid = C2.pid AND S2.sid = C2.sid AND P2.color !=  'Green')
GROUP BY S3.sname;




SELECT S.sname, MAX(C.cost)
FROM Suppliers S, Catalog C
WHERE S.sid = C.sid AND S.sid IN (SELECT S.sid
                FROM Suppliers S, Parts P, Catalog C
                WHERE P.pid = C.pid AND S.sid = C.sid AND P.color =  'Green'
                INTERSECT
                SELECT S.sid
                FROM Suppliers S, Parts P, Catalog C
                WHERE P.pid = C.pid AND S.sid = C.sid AND P.color =  'Red' )
GROUP BY S.sname;