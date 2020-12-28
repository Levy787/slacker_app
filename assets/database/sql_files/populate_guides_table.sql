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

INSERT INTO Guides (guideName, description, approach, approachFromHobart, approachFromLaunceston, camping, amenities, warning, gpsLat, gpsLon, parentID)
	SELECT "Whitewater Wall", 
	"Tassies answer to the question “Where can I camp, highline, climb and swim all in one spot?” Beautiful granite formations drop directly into the sea while orange, red and yellow lichen paint themselves onto the rounded boulders. On a typical day here you can expect sunshine, ambient waves and some creative rigging. Please do not place additional bolts without community consultation. This area has been a hub for climbing over the last 50 years and is rich with history and tradition. With hundreds of routes packed into such a small area it may be a surprise to see so few bolts. The ethics have been clear and should remain so for highlining. It is possible to rig just about anything here and with such a short walk in and stable weather there is no excuse not to take extra time to equalise a few more trees or carry a few more spansets for that boulder wrap.", 
	"From the entrance of Freycinet National Park, take the signage towards the lighthouse on Cape Tourville Rd. About 500m before the lighthouse a small dirt road with large speed humps turns left with signs saying “4WD ONLY” and “Access to Bluestone Bay” Follow this track for 2.5km to Bluestone Bay taking the right turn to Whitewater Wall Campground just before the tack heads steeply downhill to the small bay. The 4WD track although bumpy can be navigated by 2WD easily ONLY if you have sufficient clearance. The first hump on the track is one of the biggest.",
	"head north-east. Sorrel (30min from hobart) is the last major area where you can expect to buy cheap food or alcohol. Freycient is 1h 45min north of here. There are a couple taps in Coles Bay however these are from tank water and prone to runout, fill up as much water as you can in Sorrel.",
	"head south-east. As for the above directions Launceston is the last major town and all food/water must be bought from here.",
	"The camping at Whitewater Wall is free however it is due to the generosity and hard work of climbers over many years, please respect this place and do not leave any food waste or rubbish in the bush. Take note of all signage and allow other campers a full night's rest especially when it is busy. Mobile phone signals are poor at best. Expect to receive some messages (The RHS of tipper dipper and back up the 4WD track are best) but do not rely on the ability to send anything out.",
	"Amenities at the Whitewater Wall include a longdrop toilet which is generally stocked with toilet paper (it may be worth brining your own just in case). Apart from that there are a few benches and tables for sitting and eating at. There is no drinking water nearby.",
	"Some access to the anchors has extremely loose ground and rocks, it is reccomended you avoid trying to scale the gully's eventhough it may not 'look to bad'",
	-42.104149,
	148.340346,
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