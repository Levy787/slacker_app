INSERT INTO Highlines (highlineName, length, height, stars, gpsLat, gpsLon, 
warnings, description, tensionEnd, tensionEndMainAnchor, tensionEndBackupAnchor, 
staticEndMainAnchor, staticEndBackupAnchor, parentID)
	SELECT '?', 
	id FROM Guides 
	WHERE areaName='?';