# Practice Select, Join and Create View functions in MYSQL
# Kenneth Shafer 11-4-17

USE deals;  
# Execute a test query  
SELECT *
FROM Companies
WHERE CompanyName like "%Inc.";

# Select companies sorted by CompanyName
SELECT *
FROM Companies
ORDER BY CompanyID;

# Select Deal Parts with dollar values
SELECT DealName, PartNumber, DollarValue
FROM Deals,DealParts
WHERE Deals.DealID = DealParts.DealID;

# Select Deal Parts with dollar values using a join
SELECT DealName, PartNumber, DollarValue
FROM Deals JOIN DealParts on (Deals.DealID=DealParts.DealID);

# Show each company involved in each deal.
SELECT DealName,RoleCode,CompanyName
FROM Companies
JOIN Players ON (Companies.CompanyID = Players.CompanyID)
JOIN Deals ON (Players.DealID = Deals.DealID)
ORDER BY DealName;

# Create a vewi that matches companies to deals
CREATE View CompanyDeals AS
SELECT DealName,RoleCode,CompanyName
FROM Companies
JOIN players ON (Companies.CompanyID = Players.CompanyID)
JOIN Deals ON (PLayers.DealID = Deals.DealID)
ORDER BY DealName;

# A test of the CompanyDeals view
SELECT * FROM CompanyDeals;

# Create a view that lists the DealID, total dollar value & # of parts for each deal
DROP VIEW IF EXISTS DealValues;
CREATE VIEW DealValues AS
SELECT Deals.DealID, SUM(DollarValue) AS TotalDollarValue, COUNT(PartNumber) AS NumParts
FROM DEALS JOIN DEALPARTS ON (DEALS.DealID = DEALPARTS.DealID)
GROUP BY DEALS.DealID
ORDER BY DEALS.DealID;

# A test of the DealValues view
SELECT * FROM DealValues;

# 10. Create a view that lists the DealID, DealName, # of players, total dollar value and # of parts for each deal
DROP VIEW IF EXISTS dealsummary;
CREATE VIEW DealSummary AS
SELECT Deals.DealID, Deals.DealName, COUNT(PlayerID) AS PlayerNum, SUM(DollarValue) AS TotalDollarValue, COUNT(PartNumber) AS NumParts
FROM DEALS JOIN DEALPARTS ON (DEALS.DealID = DEALPARTS.DealID) 
JOIN Players ON (DEALS.DealID = Players.DealID)
GROUP BY DEALS.DealID;

# A test of the DealSummary view
SELECT * FROM DealSummary;

# 11. Create a view that lists the TypeCode, # of deals and total value of deals for each deal
DROP VIEW IF EXISTS dealsbytype;
CREATE VIEW DealsByType AS
SELECT DISTINCT DealTypes.TypeCode, COUNT(Deals.DealID) AS NumDeals, SUM(DollarValue) AS TotalDollarValue
FROM DEALS JOIN DEALTYPES ON (DEALS.DealID = DEALTYPES.DealID) 
JOIN DealParts ON (DEALS.DealID = DealParts.DealID)
GROUP BY DealTypes.typecode;

# A test of the DealsByType view
SELECT * FROM DealsByType;

# 12. Create a view that lists the CompanyID, Name and RoleCode for each deal.  Sort by RoleSortOrder
DROP VIEW IF EXISTS DealPlayers;
CREATE VIEW DealPlayers AS
SELECT DealID, CompanyID, CompanyName, rolecode
FROM PLayers
	JOIN Deals USING (DealID)
    JOIN COMPANIES USING (CompanyID)
    JOIN ROLECODES USING (RoleCode)
ORDER BY RoleSortOrder;
    
# A test of the DealPlayers view
SELECT * FROM DealPlayers;

# 13. Creat a view that lists the FirmID, Name, # of deals and total value of deals from each firm
CREATE VIEW DealsByFirm AS
SELECT FirmID, Name AS Firmname, COUNT(PLAYERS.DealID) AS NumDeals, SUM(TotalDollarValue) AS TotValue
FROM FIRMS
	LEFT JOIN PLAYERSUPPORTS USING (FirmID)
    LEFT JOIN PLAYERS USING (PlayerID)
    LEFT JOIN DealValues USING (DealID)
GROUP BY FirmID, Name;

# A test of the DealsByFirm view
SELECT * FROM DealsByFirm;
