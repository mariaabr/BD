USE p8g9
GO

CREATE TABLE Voos_Airport (
	[Name] [varchar](256) NOT NULL,
	[State] [varchar](128) NOT NULL,
	[City] [varchar](128) NOT NULL,
	[Airport_Code][varchar](8) NOT NULL PRIMARY KEY,
)
GO

CREATE TABLE Voos_Airplane_Type (
	[Type_Name] [varchar](16) NOT NULL PRIMARY KEY,
	[Max_Seats] [int] NOT NULL,
	[Company] [varchar](64) NOT NULL,
)
GO

CREATE TABLE Voos_Flight (
	[Number] [int] NOT NULL PRIMARY KEY,
	[Airline] [varchar](16) NOT NULL,
	[Company] [varchar](64) NOT NULL,
)
GO

CREATE TABLE Voos_Airplane (
	[Airplane_ID] [varchar] (8) NOT NULL PRIMARY KEY,
	[Total_no_of_seats] [int] NOT NULL,
	[Type_Name] [varchar](16) NOT NULL REFERENCES Voos_Airplane_Type([Type_Name]),
)
GO

CREATE TABLE Voos_CAN_LAND (
	[Air_Airport_code] [varchar] (8) NOT NULL REFERENCES Voos_Airport([Airport_Code]),
	[AirTy_Airplane_Type_Name] [varchar] (16) NOT NULL REFERENCES Voos_Airplane_Type([Type_Name]),
	PRIMARY KEY ([Air_Airport_code],[AirTy_Airplane_Type_Name]), 
)
GO

CREATE TABLE Voos_Fare (
	[Restrictions][varchar] (256) NOT NULL,
	[Amount][int] NOT NULL,
	[flight_Number][int] NOT NULL REFERENCES Voos_Flight([Number]),
	[Code] [varchar] (8) NOT NULL,
	PRIMARY KEY ([Code],[flight_Number]), 
)
GO

CREATE TABLE Voos_Flight_Leg (
	[Leg_no][int] NOT NULL,
	[Airport_code_Dep][varchar](8) NOT NULL REFERENCES Voos_Airport([Airport_Code]),
	[Airport_code_Arr][varchar](8) NOT NULL REFERENCES Voos_Airport([Airport_Code]),
	[flight_Number][int] NOT NULL REFERENCES Voos_Flight([Number]),
	PRIMARY KEY ([Leg_no],[Airport_code_Dep],[Airport_code_Arr],[flight_Number]), 
)
GO

CREATE TABLE Voos_Leg_Instance (
	[FL_Leg_no][int] NOT NULL,
	[FL_Airport_code_Dep][varchar](8) NOT NULL,
	[FL_Airport_code_Arr][varchar](8) NOT NULL,
	[FL_flight_Number][int] NOT NULL ,
	[Air_Airport_code_Dep][varchar](8) NOT NULL REFERENCES Voos_Airport([Airport_Code]),
	[Air_Airport_code_Arr][varchar](8) NOT NULL REFERENCES Voos_Airport([Airport_Code]),
	[Dep_time][time] NOT NULL,
	[Arr_time][time] NOT NULL,
	[Airplane_ID][varchar] (8) NOT NULL,
	[No_of_avail_seats] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	PRIMARY KEY ([Date], [FL_Leg_no], [FL_Airport_code_Dep],[FL_Airport_code_Arr],[FL_flight_Number],[Air_Airport_code_Dep],[Air_Airport_code_Arr], [Airplane_ID]),
	FOREIGN KEY ([FL_Leg_no], [FL_Airport_code_Dep],[FL_Airport_code_Arr],[FL_flight_Number]) REFERENCES Voos_Flight_Leg([Leg_no],[Airport_code_Dep],[Airport_code_Arr],[flight_Number]),
	FOREIGN KEY ([Airplane_ID]) REFERENCES Voos_Airplane([Airplane_ID]),
)
GO

CREATE TABLE Voos_Seat (
	[Seat_no][varchar] (8) NOT NULL,
	[LI_FL_Leg_no][int] NOT NULL,
	[LI_FL_Airport_code_Dep][varchar] (8) NOT NULL,
	[LI_FL_Airport_code_Arr][varchar] (8) NOT NULL,
	[LI_FL_flight_Number][int] NOT NULL,
	[LI_Air_Airport_code_Dep][varchar] (8) NOT NULL,
	[LI_Air_Airport_code_Arr][varchar] (8) NOT NULL,
	[LI_Airplane_ID][varchar](8) NOT NULL,
	[LI_Date][datetime] NOT NULL,
	PRIMARY KEY ([Seat_no],[LI_Date],[LI_FL_Leg_no],[LI_FL_Airport_code_Dep],[LI_FL_Airport_code_Arr],[LI_FL_flight_Number],[LI_Air_Airport_code_Dep],[LI_Air_Airport_code_Arr],[LI_Airplane_ID]), 
	FOREIGN KEY ([LI_Date],[LI_FL_Leg_no],[LI_FL_Airport_code_Dep],[LI_FL_Airport_code_Arr],[LI_FL_flight_Number],[LI_Air_Airport_code_Dep],[LI_Air_Airport_code_Arr],[LI_Airplane_ID]) REFERENCES Voos_Leg_Instance([Date],[FL_Leg_no],[FL_Airport_code_Dep],[FL_Airport_code_Arr],[FL_flight_Number],[Air_Airport_code_Dep],[Air_Airport_code_Arr],[Airplane_ID]),
)																																																								  
GO


