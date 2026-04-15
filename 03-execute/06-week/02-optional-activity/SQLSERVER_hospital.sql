-- hospital.dbo.doctor definition

-- Drop table

-- DROP TABLE hospital.dbo.doctor;

CREATE TABLE hospital.dbo.doctor (
	id_doctor int IDENTITY(1,1) NOT NULL,
	document int NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	specialty varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	phone varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__doctor__34D8A3053FE1395B PRIMARY KEY (id_doctor)
);


-- hospital.dbo.medicine definition

-- Drop table

-- DROP TABLE hospital.dbo.medicine;

CREATE TABLE hospital.dbo.medicine (
	id_medicine int IDENTITY(1,1) NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	price decimal(10,2) NULL,
	stock int NULL,
	CONSTRAINT PK__medicine__1F746A2EAC4ECB0F PRIMARY KEY (id_medicine)
);


-- hospital.dbo.patient definition

-- Drop table

-- DROP TABLE hospital.dbo.patient;

CREATE TABLE hospital.dbo.patient (
	id_patient int IDENTITY(1,1) NOT NULL,
	type_document varchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	document int NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	phone varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__patient__4339908A51287FEA PRIMARY KEY (id_patient)
);


-- hospital.dbo.appointment definition

-- Drop table

-- DROP TABLE hospital.dbo.appointment;

CREATE TABLE hospital.dbo.appointment (
	id_appointment int IDENTITY(1,1) NOT NULL,
	id_patient int NULL,
	id_doctor int NULL,
	[date] datetime DEFAULT getdate() NULL,
	CONSTRAINT PK__appointm__F9CC20B7FFA33FE7 PRIMARY KEY (id_appointment),
	CONSTRAINT FK__appointme__id_do__628FA481 FOREIGN KEY (id_doctor) REFERENCES hospital.dbo.doctor(id_doctor),
	CONSTRAINT FK__appointme__id_pa__619B8048 FOREIGN KEY (id_patient) REFERENCES hospital.dbo.patient(id_patient)
);


-- hospital.dbo.detail definition

-- Drop table

-- DROP TABLE hospital.dbo.detail;

CREATE TABLE hospital.dbo.detail (
	id_detail int IDENTITY(1,1) NOT NULL,
	id_appointment int NULL,
	id_medicine int NULL,
	description varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	cost decimal(10,2) NULL,
	CONSTRAINT PK__detail__EA8338080005D20B PRIMARY KEY (id_detail),
	CONSTRAINT FK__detail__id_appoi__656C112C FOREIGN KEY (id_appointment) REFERENCES hospital.dbo.appointment(id_appointment),
	CONSTRAINT FK__detail__id_medic__66603565 FOREIGN KEY (id_medicine) REFERENCES hospital.dbo.medicine(id_medicine)
);