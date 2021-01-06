CREATE TABLE Countries (
	countryId INTEGER PRIMARY KEY AUTOINCREMENT,
	countryName TEXT NOT NULL,
	briefDescription BLOB
);

CREATE TABLE States (
	stateId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	stateName TEXT NOT NULL,
	briefDescription TEXT
);

CREATE TABLE Regions (
	regionId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	regionName TEXT NOT NULL,
	briefDescription TEXT
);

CREATE TABLE Areas (
	areaId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	areaName TEXT NOT NULL,
	briefDescription TEXT
);

CREATE TABLE Guides (
	guideId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	guideName TEXT NOT NULL,
	description BLOB,
	approach BLOB,
	approachFromHobart BLOB,
	approachFromLaunceston BLOB,
	camping BLOB, 
	amenities BLOB,
	warning BLOB,
	gpsLat REAL,
	gpsLon REAL
);

CREATE TABLE GuideAreas (
	guideAreaId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	guideAreaName TEXT NOT NULL,
	description BLOB,
	approach BLOB,
	climbingBeta BLOB,
	tagging BLOB,
	warning BLOB,
	gpsLat REAL,
	gpsLon REAL
);

CREATE TABLE Highlines (
	highlineId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	highlineNumber INTEGER,
	highlineName TEXT NOT NULL,
	length INTEGER,
	height INTEGER,
	stars INTEGER,
	whoEstablished BLOB,
	whenEstablished BLOB,
	whoFA BLOB,
	whenFA BLOB,
	climbingBeta BLOB,
	warnings BLOB,
	description BLOB,
	tagging BLOB,
	tensionEnd TEXT,
	gpsLatTensionEnd REAL,
	gpsLonTensionEnd REAL,
	gpsLatStaticEnd REAL,
	gpsLonStaticEnd REAL,
	tensionEndMainAnchor TEXT,
	tensionEndBackupAnchor TEXT,
	staticEndMainAnchor TEXT,
	staticEndBackupAnchor TEXT
);

CREATE TABLE Midlines(
	midlineId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	midlineNumber INTEGER,
	midlineName TEXT NOT NULL,
	length INTEGER,
	height INTEGER,
	stars INTEGER,
	whoEstablished BLOB,
	whenEstablished BLOB,
	whoFA BLOB,
	whenFA BLOB,
	climbingBeta BLOB,
	warnings BLOB,
	description BLOB,
	tagging BLOB,
	tensionEnd TEXT,
	gpsLatTensionEnd REAL,
	gpsLonTensionEnd REAL,
	gpsLatStaticEnd REAL,
	gpsLonStaticEnd REAL,
	tensionEndMainAnchor TEXT,
	tensionEndBackupAnchor TEXT,
	staticEndMainAnchor TEXT,
	staticEndBackupAnchor TEXT
);

CREATE TABLE Waterlines(
	waterlineId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	waterlineNumber INTEGER,
	waterlineName TEXT NOT NULL,
	length INTEGER,
	height INTEGER,
	stars INTEGER,
	whoEstablished BLOB,
	whenEstablished BLOB,
	whoFA BLOB,
	whenFA BLOB,
	climbingBeta BLOB,
	warnings BLOB,
	description BLOB,
	tagging BLOB,
	tensionEnd TEXT,
	gpsLatTensionEnd REAL,
	gpsLonTensionEnd REAL,
	gpsLatStaticEnd REAL,
	gpsLonStaticEnd REAL,
	tensionEndMainAnchor TEXT,
	tensionEndBackupAnchor TEXT,
	staticEndMainAnchor TEXT,
	staticEndBackupAnchor TEXT
);

CREATE TABLE Parklines(
	parklineId INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	parklineNumber INTEGER,
	parklineName TEXT NOT NULL,
	length INTEGER,
	height INTEGER,
	stars INTEGER,
	warnings BLOB,
	description BLOB,
	tensionEnd TEXT,
	gpsLatTensionEnd REAL,
	gpsLonTensionEnd REAL,
	gpsLatStaticEnd REAL,
	gpsLonStaticEnd REAL,
	tensionEndMainAnchor TEXT,
	staticEndMainAnchor TEXT
);