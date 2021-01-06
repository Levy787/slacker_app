INSERT INTO Regions (regionName, parentID)
	SELECT 'North East', stateId FROM States 
	WHERE stateName='Tasmania';

INSERT INTO Regions (regionName, parentID)
	SELECT 'North West', stateId FROM States 
	WHERE stateName='Tasmania';
	
INSERT INTO Regions (regionName, parentID)
	SELECT 'South East', stateId FROM States 
	WHERE stateName='Tasmania';
	
INSERT INTO Regions (regionName, parentID)
	SELECT 'South West', stateId FROM States 
	WHERE stateName='Tasmania';
	
INSERT INTO Regions (regionName, parentID)
	SELECT 'Islands', stateId FROM States 
	WHERE stateName='Tasmania';