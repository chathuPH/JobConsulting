
CREATE TABLE JOC_USERS(
	US_ID INT NOT NULL IDENTITY(1,1)
	,US_FIRST_NAME NVARCHAR(100) NULL
	,US_LAST_NAME NVARCHAR(100) NULL
	,US_EMAIL_NAME NVARCHAR(100) NOT NULL UNIQUE
	,US_PASSWORD_NAME NVARCHAR(100) NULL
	)