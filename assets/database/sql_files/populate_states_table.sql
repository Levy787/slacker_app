INSERT INTO States (stateName, parentID)
	SELECT 'Tasmania', id FROM Countries 
	WHERE countryName='Australia';
	
INSERT INTO States (stateName, parentID)
	SELECT 'Queensland', id FROM Countries 
	WHERE countryName='Australia';

INSERT INTO States (stateName, parentID)
	SELECT 'South Australia', id FROM Countries 
	WHERE countryName='Australia';

INSERT INTO States (stateName, parentID)
	SELECT 'New South Wales', id FROM Countries 
	WHERE countryName='Australia';
	
INSERT INTO States (stateName, parentID)
	SELECT 'Victoria', id FROM Countries 
	WHERE countryName='Australia';

INSERT INTO States (stateName, parentID)
	SELECT 'Western Australia', id FROM Countries 
	WHERE countryName='Australia';
	
INSERT INTO States (stateName, parentID)
	SELECT 'Australian Capital Territory', id FROM Countries 
	WHERE countryName='Australia';

INSERT INTO States (stateName, parentID)
	SELECT 'Nothern Territory', id FROM Countries 
	WHERE countryName='Australia';
	