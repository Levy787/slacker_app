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

INSERT INTO GuideAreas (guideAreaName, description, approach, climbingBeta, tagging, warning, gpsLat, gpsLon, parentID)
	SELECT "Bluestone Bay",
	"There is potential here for a 120m ish line about 25m high, beautiful and great for training on.",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	id FROM Guides
	WHERE guideName="Whitewater Wall";


INSERT INTO GuideAreas (guideAreaName, description, approach, climbingBeta, tagging, warning, gpsLat, gpsLon, parentID)
	SELECT "Whitewater Wall",
	"There is potential here for a 70-80m line running parallel with the large slab of “Whitewater Wall” . It would be roughly 10m away from the wall the entire length, a bit of a weird line that might not actually go with a closer inspection.",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	id FROM Guides
	WHERE guideName="Whitewater Wall";

INSERT INTO GuideAreas (guideAreaName, description, approach, climbingBeta, tagging, warning, gpsLat, gpsLon, parentID)
	SELECT "Beowulf / Deep Water Zawn",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	id FROM Guides
	WHERE guideName="Whitewater Wall";

INSERT INTO GuideAreas (guideAreaName, description, approach, climbingBeta, tagging, warning, gpsLat, gpsLon, parentID)
	SELECT "Lassie’s Wall / Big Zawn",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	id FROM Guides
	WHERE guideName="Whitewater Wall";

INSERT INTO GuideAreas (guideAreaName, description, approach, climbingBeta, tagging, warning, gpsLat, gpsLon, parentID)
	SELECT "White Stack Area",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	id FROM Guides
	WHERE guideName="Whitewater Wall";

INSERT INTO GuideAreas (guideAreaName, description, approach, climbingBeta, tagging, warning, gpsLat, gpsLon, parentID)
	SELECT "Little Bluestone Bay",
	"There is potential here for a 180ish meter + water-midline. It would make for a very scenic and beautiful walk. It is only 15-20m high so would require a little bit of tension but not much.",
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	id FROM Guides
	WHERE guideName="Whitewater Wall";