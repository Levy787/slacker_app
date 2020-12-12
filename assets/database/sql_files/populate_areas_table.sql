INSERT INTO Areas (areaName, parentID)
	SELECT 'Launceston', id FROM Regions 
	WHERE regionName='North East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Ben Lomond', id FROM Regions 
	WHERE regionName='North East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'North Esk', id FROM Regions 
	WHERE regionName='North East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Freycinet', id FROM Regions 
	WHERE regionName='North East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Cradle Mountain - Lake St Clair National Park', id FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Devils Gullet', id FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Tarkine and the North West', id FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Frenchmans Cap', id FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Tyndall Ranges', id FROM Regions 
	WHERE regionName='North West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Hobart', id FROM Regions 
	WHERE regionName='South East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Tasman Peninsula', id FROM Regions 
	WHERE regionName='South East';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Mt Field National Park', id FROM Regions 
	WHERE regionName='South West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Lonnavale', id FROM Regions 
	WHERE regionName='South West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Federation Peak', id FROM Regions 
	WHERE regionName='South West';
	
INSERT INTO Areas (areaName, parentID)
	SELECT 'Bruny Island', id FROM Regions 
	WHERE regionName='Islands';