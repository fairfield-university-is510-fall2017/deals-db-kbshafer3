# Add Foreign Keys to each table in deals database
# Kenneth Shafer 	11-18-17

# Add Foreign Keys to DealTypes from TypeCodes
ALTER TABLE `DealTypes`
	ADD FOREIGN KEY (`TypeCode`)
		REFERENCES `TypeCodes` (`TypeCode`);

# Add Foreign Key to DealTypes from Deals
ALTER TABLE `DealTypes`       
	ADD FOREIGN KEY (`DealID`)
		REFERENCES `Deals` (`DealID`);
        
# Add Foreign Key to DealParts from Deals
ALTER TABLE `DealParts`
	ADD FOREIGN KEY (`DealID`)
		REFERENCES `Deals` (`DealID`);

# Add Foreign Key to Players from Deals        
ALTER TABLE `Players`
	ADD FOREIGN KEY (`DealID`)
		REFERENCES `Deals` (`DealID`);
        
# Add Foreign Key to Players from Companies        
ALTER TABLE `Players`
	ADD FOREIGN KEY (`CompanyID`)
		REFERENCES `Companies` (`CompanyID`);
        
# Add Foreign Key to Players from RoleCodes        
ALTER TABLE `Players`
	ADD FOREIGN KEY (`RoleCode`)
		REFERENCES `RoleCodes` (`RoleCode`);
        
# Add Foreign Key to PlayerSupports from Players        
ALTER TABLE `PlayerSupports`
	ADD FOREIGN KEY (`PlayerID`)
		REFERENCES `Players` (`PlayerID`);        

# Add Foreign Key to PlayerSupports from SupportCodes        
ALTER TABLE `PlayerSupports`
	ADD FOREIGN KEY (`SupportCodeID`)
		REFERENCES `SupportCodes` (`SupportCodeID`);
        
# Add Foreign Key to PlayerSupports from FIrms        
ALTER TABLE `PlayerSupports`
	ADD FOREIGN KEY (`FirmID`)
		REFERENCES `Firms` (`FirmID`);

