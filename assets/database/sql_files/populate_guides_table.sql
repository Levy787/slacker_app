INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Cataract Gorge', 
	'Launceston is a city in the north of Tasmania and home to Cataract Gorge. The gorge is situated within walking distance from the City of Launceston. Launceston is one of Australia’s oldest cities and the first city to be lit by hydroelectricity. Cataract Gorge provided means to generate the hydroelectricity. The power station is now decommissioned and the once privately owned section of the land was sold back to the Tasmanian Government on the provision that it remain a free recreation space for the people of Tasmania.', 
	'The gorge can be accessed from a range of entry points. The closest car park to the highlines is at the end of Basin Road. There is a huge paid car park between 8am - 6pm and free outside of these hours. Security had tipped us off that despite the car park gates being locked after hours, no fines or trouble will be issued for any campers who ‘forgot’ to get their vehicles out before the gate was locked. Amenities: 24hr/ 7 days shower, toilet and change room facilities under the main cafe at the ducks reach gorge. Locate the ‘Alexander Suspension Bridge’ crossing the river, the highline is located just 30m upstream to this bridge. Anchor positions are obvious.',
	NULL,
	-41.446994,
	147.118169,
	id FROM Areas 
	WHERE areaName='Launceston';

INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Jacob’s Ladder', 
	'Weirdly for a highline location the main attraction here is not all nature. Built in… Jacob’s Ladder is an incredible engineering feat, a dirt road winding steeply up the mountainside allowing vehicular access to the plateau. The spectacle also provides an auditory experience as cars slowly make their way up the switchbacks, the gravel crunch rising and falling as pillars of dolerite block the sound waves.',
	'The established lines here are inside a large, open and stepped gully that faces the bottom of jacobs ladder. Park at the top of the switchbacks and rock hop for 500m+ along the cliffs to the left of the road (looking downhill) until you arrive on the big amphitheatre. There will be some sections of wading though very prickly bushes between the boulders so wear long pants and bring a keen sense of route finding.',
	NULL,
	NULL,
	NULL,
	id FROM Areas 
	WHERE areaName='Ben Lomond';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Flews Flutes', 
	'The main climbing area in ‘The Ben’. Huge hexagonal pillars rise up to 150m above the scree slope below forming continuous crack lines of incredibly uniform width. There are a couple big V gaps in the area and potential for many many more lines than listed here, all with great exposure and direct height.', 
	'Park at Carr Villa and take the summit walking track. After 500m or so turn off right and begin to boulder hop for the next 20min to gain the top of the cliffs out right. On top the going gets easier with flat grassy sections and a few scrubby prickly bush bashes. It takes roughly 1hr from the car park to the prominent V gap in the middle of the flutes. 
An alternative, less scrubby and shorter, but more physical approach is to take the climbers access to the base of the cliffs themselves. From here the descent gully can be used to gain to the top of the hill (total of just under an hour).',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Ben Lomond';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Near the Bridge', 
	NULL, 
	NULL,
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='North Esk';

INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Whitewater Wall', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Freycinet';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'The Underworld', 
	'', 
	'',
	NULL,
	NULL,
	NULL,
	id FROM Areas 
	WHERE areaName='Freycinet';

INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Nicholas Needle', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Freycinet';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Mt Geryon and The Acropolis', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Cradle Mountain - Lake St Clair National Park';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Devils Gullet Guide', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Devils Gullet';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Sisters Beach', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tarkine and the North West';

INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Sumac Blockade', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tarkine and the North West';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Trowutta Arch', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tarkine and the North West';

INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Frenchmans Cap', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Frenchmans Cap';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Tyndalls', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tyndall Ranges';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Suburban', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Hobart';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Mt Wellington', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Hobart';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Wellington', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Hobart';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Tinderbox', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Hobart';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Capy Hauy', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tasman Peninsula';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'The Moai', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tasman Peninsula';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Cape Pillar', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tasman Peninsula';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Mt Brown', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tasman Peninsula';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Cape Raoul', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tasman Peninsula';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Waterfall Bay', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Tasman Peninsula';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Big Tree Reserve', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Mt Field National Park';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Bluegum Forest', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Lonnavale';
	
INSERT INTO Guides (guideName, description, approach, warning, gpsLat, gpsLon, parentID)
	SELECT 'Fed Peak', 
	'', 
	'',
	NULL,
	NULL,
	NULL,	
	id FROM Areas 
	WHERE areaName='Federation Peak';