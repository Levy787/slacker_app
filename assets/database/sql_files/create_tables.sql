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
	amenities BLOB,
	tagging BLOB,
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
	approachFromHobart BLOB,
	approachFromLaunceston BLOB,
	climbingBeta BLOB,
	amenities BLOB,
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
	gpsLat REAL,
	gpsLon REAL,
	whoEstablished BLOB,
	whenEstablished BLOB,
	whoFA BLOB,
	whenFA BLOB,
	climbingBeta BLOB,
	warnings BLOB,
	description BLOB,
	tagging BLOB,
	tensionEnd TEXT,
	tensionEndMainAnchor TEXT,
	tensionEndBackupAnchor TEXT,
	staticEndMainAnchor TEXT,
	staticEndBackupAnchor TEXT
);

CREATE TABLE Midlines(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	highlineNumber INTEGER,
	highlineName TEXT NOT NULL,
	length INTEGER,
	height INTEGER,
	stars INTEGER,
	gpsLat REAL,
	gpsLon REAL,
	whoEstablished BLOB,
	whenEstablished BLOB,
	whoFA BLOB,
	whenFA BLOB,
	climbingBeta BLOB,
	warnings BLOB,
	description BLOB,
	tagging BLOB,
	tensionEnd TEXT,
	tensionEndMainAnchor TEXT,
	tensionEndBackupAnchor TEXT,
	staticEndMainAnchor TEXT,
	staticEndBackupAnchor TEXT
);

CREATE TABLE Waterlines(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	highlineNumber INTEGER,
	highlineName TEXT NOT NULL,
	length INTEGER,
	height INTEGER,
	stars INTEGER,
	gpsLat REAL,
	gpsLon REAL,
	whoEstablished BLOB,
	whenEstablished BLOB,
	whoFA BLOB,
	whenFA BLOB,
	climbingBeta BLOB,
	warnings BLOB,
	description BLOB,
	tagging BLOB,
	tensionEnd TEXT,
	tensionEndMainAnchor TEXT,
	tensionEndBackupAnchor TEXT,
	staticEndMainAnchor TEXT,
	staticEndBackupAnchor TEXT
);

CREATE TABLE Parklines(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	parentID INTEGER NOT NULL,
	highlineNumber INTEGER,
	highlineName TEXT NOT NULL,
	length INTEGER,
	height INTEGER,
	stars INTEGER,
	gpsLat REAL,
	gpsLon REAL,
	whoEstablished BLOB,
	whenEstablished BLOB,
	whoFA BLOB,
	whenFA BLOB,
	climbingBeta BLOB,
	warnings BLOB,
	description BLOB,
	tagging BLOB,
	tensionEnd TEXT,
	tensionEndMainAnchor TEXT,
	tensionEndBackupAnchor TEXT,
	staticEndMainAnchor TEXT,
	staticEndBackupAnchor TEXT
);