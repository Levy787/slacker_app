INSERT INTO Regions (regionName, parentID)
	SELECT 'North East', id FROM States 
	WHERE stateName='Tasmania';

INSERT INTO Regions (regionName, parentID)
	SELECT 'North West', id FROM States 
	WHERE stateName='Tasmania';
	
INSERT INTO Regions (regionName, parentID)
	SELECT 'South East', id FROM States 
	WHERE stateName='Tasmania';
	
INSERT INTO Regions (regionName, parentID)
	SELECT 'South West', id FROM States 
	WHERE stateName='Tasmania';
	
INSERT INTO Regions (regionName, parentID)
	SELECT 'Islands', id FROM States 
	WHERE stateName='Tasmania';