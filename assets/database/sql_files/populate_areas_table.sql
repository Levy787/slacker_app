INSERT INTO Areas (areaName, parentID)
	SELECT 'Launceston', regionId FROM Regions 
	WHERE regionName='North East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Ben Lomond', regionId FROM Regions 
	WHERE regionName='North East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'North Esk', regionId FROM Regions 
	WHERE regionName='North East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Freycinet', regionId FROM Regions 
	WHERE regionName='North East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Cradle Mountain - Lake St Clair National Park', regionId FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Devils Gullet', regionId FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Tarkine and the North West', regionId FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Frenchmans Cap', regionId FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Tyndall Ranges', regionId FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Hobart', regionId FROM Regions 
	WHERE regionName='South East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Tasman Peninsula', regionId FROM Regions 
	WHERE regionName='South East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Mt Field National Park', regionId FROM Regions 
	WHERE regionName='South West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Lonnavale', regionId FROM Regions 
	WHERE regionName='South West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Federation Peak', regionId FROM Regions 
	WHERE regionName='South West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Bruny Island', regionId FROM Regions 
	WHERE regionName='Islands';