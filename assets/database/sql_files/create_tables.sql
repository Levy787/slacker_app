CREATE TABLE Countries (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	countryName TEXT NOT NULL,
	briefDescription TEXT
);

CREATE TABLE States (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	stateName TEXT NOT NULL,
	briefDescription TEXT
);

CREATE TABLE Regions (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	regionName TEXT NOT NULL,
	briefDescription TEXT
);

CREATE TABLE Areas (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	areaName TEXT NOT NULL,
	briefDescription TEXT
);

CREATE TABLE Guides (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
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
	id INTEGER PRIMARY KEY AUTOINCREMENT,
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
	id INTEGER PRIMARY KEY AUTOINCREMENT,
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
	id INTEGER PRIMARY KEY AUTOINCREMENT,
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
	id INTEGER PRIMARY KEY AUTOINCREMENT,
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
	id INTEGER PRIMARY KEY AUTOINCREMENT,
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
	tensionAnchor TEXT,
	staticAnchor TEXT
);