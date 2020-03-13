ALTER DATABASE ntarango3 CHARACTER SET utf8 COLLATE utf8_unicode_ci;

create table user(
	userId Binary(16) NOT NULL,
	userActivationToken CHAR(32),
	userName VARCHAR(32) NOT NULL,
	userEmail VARCHAR(128) NOT NULL,
	UNIQUE(userEmail),
	INDEX(userEmail),
	PRIMARY KEY(userId)
);

create table profile(
	profileId BINARY(16) NOT NULL,
	profileDate DATETIME(6) NOT NULL,
	profileUserId BINARY(16) NOT NULL,
	PRIMARY KEY(profileId)
);

create table 'show'(
	showUserId BINARY(16) NOT NULL,
	showProfileId BINARY(16) NOT NULL,
	showContent VARCHAR(4000),
	INDEX(showUserId),
	INDEX(showProfileId),
	FOREIGN KEY(showUserId) REFERENCES user(userId),
	FOREIGN KEY(showProfileId) REFERENCES profile(profileId),
	PRIMARY KEY(showUserId, showProfileId)
);
