/* 
INSERT INTO GuideAreas (guideAreaName, description, approach, approachFromHobart, approachFromLaunceston, climbingBeta, amenities, tagging, warning, gpsLat, gpsLon, parentID)
	SELECT nameHere,
	descriptionHere,
	approachHere,
	approachFromHobartHere,
	approachFromLauncestonHere,
	climbingBetaHere,
	ammenitiesHere,
	taggingHere,
	warningsHere,
	gpsLatHere,
	hpsLonHere,
	id FROM Areas 
	WHERE areaName='Launceston';
*/
