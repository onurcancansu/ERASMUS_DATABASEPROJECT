create database ERASMUSMANAGEDB
use ERASMUSMANAGEDB
Create table tblRealCountry(
RealCountryID int primary key identity(1,1),
RealCName varchar(45),
RealCPostCode int,
RealCNumberofUniversity int,
RealCTotalErasmusStudent int
)
INSERT INTO tblRealCountry VALUES ('GERMANY',12345, 100, 10000)
INSERT INTO tblRealCountry VALUES ('FRANCE',34534, 70, 7000)
INSERT INTO tblRealCountry VALUES ('ITALY',54644, 65, 6500)
INSERT INTO tblRealCountry VALUES ('SPAIN',56757, 72, 72000)
INSERT INTO tblRealCountry VALUES ('TURKEY',46546, 180, 18000)

Create table tblErasmusCountry(
ErasmusCountryID int primary key identity(1,1),
ErasmusCountryName varchar(45),
ErasmusCountryPostCode int,
ErasmusCountryNumberofUniversity int,
ErasmusCountryTotalErasmusStudent int
)
INSERT INTO tblErasmusCountry VALUES ('NETHERLANDS',22446, 70, 7000)

Create table tblRealUniversity(
RealUniID int primary key identity(1,1),
RealUniName varchar(45),
RealUniAdressDetail varchar(45),
RealUniPhone int,
RealUniEmail varchar(45),
RealCountryID int foreign key references tblRealCountry(RealCountryID)
)
INSERT INTO tblRealUniversity VALUES ('Berlin Uni','BERLIN', 3664545, 'Berlin@gmail.com',1)
INSERT INTO tblRealUniversity VALUES ('Lyon Uni','LYON', 4561516, 'Lyon@gmail.com',2)
INSERT INTO tblRealUniversity VALUES ('Roma Uni','ROMA', 1313151, 'Roma@gmail.com',3)
INSERT INTO tblRealUniversity VALUES ('Mondragon Uni','MADRID', 4644613, 'Madrid@gmail.com', 4)
INSERT INTO tblRealUniversity VALUES ('Boðaziçi Uni','ISTANBUL', 9464136, 'BOUN@gmail.com', 5)
SELECT RealUniName, RealCName from tblRealUniversity as eu inner join tblRealCountry as ec on 
ec.RealCountryID = eu.RealCountryID 



Create table tblErasmusUniversity(
ErasmusUniID int primary key identity(1,1),
ErasmusUniName varchar(45),
ErasmusUniAdressDetail varchar(45),
ErasmusUniPhone int,
ErasmusUniEmail varchar(45),
ErasmusUNumberErasmusStudent int,
ErasmusCountryID int foreign key references tblErasmusCountry(ErasmusCountryID)
)
INSERT INTO tblErasmusUniversity VALUES ('Amsterdam Uni','ISTANBUL', 9464136, 'Amsterdam@gmail.com', 1300, 1)
INSERT INTO tblErasmusUniversity VALUES ('Rotterdam Uni','MADRID', 4644613, 'Rotterdam@gmail.com', 1000, 2)
INSERT INTO tblErasmusUniversity VALUES ('Utrecht Uni','BERLIN', 3664545, 'Utrecht@gmail.com', 800, 3)
INSERT INTO tblErasmusUniversity VALUES ('Leiden Uni','LYON', 4561516, 'Leiden@gmail.com', 752, 4)
INSERT INTO tblErasmusUniversity VALUES ('Delft Uni','ROMA', 1313151, 'Delft@gmail.com', 700, 5)
SELECT ErasmusUniName, ErasmusCountryName from tblErasmusUniversity as eu inner join tblErasmusCountry as ec on 
ec.ErasmusCountryID = eu.ErasmusCountryID 

Create table tblDepartment(
DanýsmanID int primary key ,
DepartmentName varchar(45),
DanýsmanName varchar(45),
DepartmentEmail varchar(45),
DepartmentPhone int,
RealUniID int foreign key references tblRealUniversity(RealUniID), 
ErasmusUniID int foreign key references tblErasmusUniversity(ErasmusUniID) 
)
INSERT INTO tblDepartment VALUES (5,'Chemistry','AXYZ', 'CHEM@gmail.com', 45454,1,1)
INSERT INTO tblDepartment VALUES (10,'Math','b.dgd', 'Math@gmail.com', 46454,2,2)
INSERT INTO tblDepartment VALUES (6,'CMPE','C.DFGD', 'CMPE@gmail.com', 23423,3,3)
INSERT INTO tblDepartment VALUES (4,'Histroy','d.dfgd', 'HIST@gmail.com', 43464,4,4)
INSERT INTO tblDepartment VALUES (3,'Býology','e.fgd', 'BIO@gmail.com', 45644,5,5)


Create table tblProgram(
CourseCode int primary key,
CourseName varchar(45),
Credit int,
Isrequýred varchar(5),
DanýsmanID int foreign key references tblDepartment(DanýsmanID)
)

INSERT INTO tblDepartment VALUES (102,'CSS', 4, 'YES', 1)
INSERT INTO tblDepartment VALUES (215,'SCRATCH', 3, 'YES', 2)
INSERT INTO tblDepartment VALUES (301,'C#', 3, 'YES', 3)
INSERT INTO tblDepartment VALUES (321,'SQL', 4, 'YES',  4)
INSERT INTO tblDepartment VALUES (341,'GAME', 3, 'YES', 5)
Create table tblMuseum(
MuseumID int primary key identity(1,1),
MuseumName varchar(45),
MuseumAdress varchar(100),
MuseumWorkingDays varchar(100),
MuseumWorkingHours int,
MuseumWebsite varchar(50),
MuseumticketPrice float,
Museumdistancefromthehome float,
MuseumWorkload varchar(45)
)
INSERT INTO tblMuseum VALUES ('Van Gogh','berlin', 'Tuesday-Sunday', 8, 'berlin.com', 25, 1500, 'Available')
INSERT INTO tblMuseum VALUES ('NEMO','berlin', 'Tuesday-Sunday', 8, 'berlin.com', 55, 1100, 'Busy')
INSERT INTO tblMuseum VALUES ('Kröller','berlin', 'Tuesday-Sunday', 8, 'berlin.com', 75, 800, 'Available')
INSERT INTO tblMuseum VALUES ('Anne Frank MUSEUM','berlin', 'Tuesday-Sunday', 8, 'berlin.com', 45, 'Busy')
INSERT INTO tblMuseum VALUES ('Groninger MUSEUM','berlin', 'Tuesday-Sunday', 8, 'berlin.com', 35, 'Busy')
SELECT*FROM tblMuseum WHERE MuseumticketPrice < 50

Create table tblRestaurant(
RestaurantID int primary key identity(1,1),
RName varchar(45),
RAdress varchar(100),
RWorkingDays varchar(100),
RWorkingHours int,
RWebsite varchar(50),
RaveragePrice float,
Rdistancefromthehome float,
RWorkload varchar(45)
)
INSERT INTO tblRestaurant VALUES ('Amsterdam RESTAURANT','amsterdam', 'Monday-Sunday', 8, 'amres.com', 15.5, 750, 'Available')
INSERT INTO tblRestaurant VALUES ('Rotterdam RESTAURANT','rotterdam', 'Monday-Sunday', 10, 'rotres.com', 23, 1000, 'Busy')
INSERT INTO tblRestaurant VALUES ('Utrecht RESTAURANT','utrecht', 'Monday-Sunday', 9, 'utres.com', 27, 1250, 'Available')
INSERT INTO tblRestaurant VALUES ('Leiden RESTAURANT','leiden', 'Monday-Sunday', 12, 'leidenres.com', 33, 1035, 'Busy')
INSERT INTO tblRestaurant VALUES ('Delft RESTAURANT','delft', 'Monday-Sunday', 14, 'delftres.com', 35, 780, 'Available')
select tblRestaurant.RName, tblRestaurant.Rdistancefromthehome from tblRestaurant order by Rdistancefromthehome asc 

Create table tblHairdresser(
HairID int primary key identity(1,1),
HName varchar(45),
HAdress varchar(100),
HWorkingDays varchar(100),
HWorkingHours int,
HWebsite varchar(50),
HModel varchar(50),
HPrice float,
Hdistancefromthehome float,
HWorkload varchar(45)
)
Create table tblDrycleaner(
DryID int primary key identity(1,1),
DName varchar(45),
DAdress varchar(100),
DWorkingDays varchar(100),
DWorkingHours int,
DWebsite varchar(50),
DPrice float,
Ddistancefromthehome float,
DPreparationtime float
)

Create table tblDormitory(
DormitoryID int primary key identity(1,1),
DoName varchar(45),
DoAdress varchar(100),
DoPhone int,
DoEmail varchar(45),
Dohowmanystudents int,
IsLaundryroom varchar(5)
)
INSERT INTO tblDormitory VALUES ('Amsterdam Dormitory','NETHERLAND', 45646, 'AMS.com', 444, 'YES')
INSERT INTO tblDormitory VALUES ('Rotterdam Dormitory','NETHERLAND', 43436, 'res.com', 155, 'NO')
INSERT INTO tblDormitory VALUES ('Utrecht Dormitory','NETHERLAND', 657567, 'inres.com', 165, 'YES')
INSERT INTO tblDormitory VALUES ('Leiden Dormitory','NETHERLAND', 57575, 'rlires.com', 135, 'NO')
INSERT INTO tblDormitory VALUES ('Delft Dormitory','NETHERLAND', 57567, 'inres.com', 175, 'YES')

Create table tblEstateAgent(
EstateID int primary key identity(1,1),
EsName varchar(45),
EsAdress varchar(100),
EsPhone int,
EsEmail varchar(45),
CommissionFee float
)
Create table AccomodatePost(
PostID int primary key identity(1,1),
Possdate date,
Price float,
m2 int,
numberofrooms int,
IsItFurnished varchar(5),
IsThereBalcony varchar(5),
AAdressdetail varchar(100),
Howmanypeoplelive int,
Distancefromthecenter int
)

INSERT INTO AccomodatePost VALUES ('2021-11-11', 1000, 70, 3, 'NO', 'YES', 'amsterdam', 0, 650)
INSERT INTO AccomodatePost VALUES ('2021-11-10', 950, 55, 3, 'NO', 'YES', 'amsterdam', 0, 680)
INSERT INTO AccomodatePost VALUES ('2021-11-9', 850, 95, 3, 'NO', 'YES', 'amsterdam', 0, 600)
INSERT INTO AccomodatePost VALUES ('2021-11-8', 650, 85, 3, 'NO', 'YES', 'amsterdam', 0, 750)
INSERT INTO AccomodatePost VALUES ('2021-11-7', 1200, 100, 3, 'NO', 'YES', 'amsterdam', 0, 850)
SELECT numberofrooms , CommissionFee from AccomodatePost as ap inner join tblEstateAgent as ea on where numberofrooms=4 AND  CommissionFee < 15;



Create table tblErasmusOffice(
OfficeID int primary key identity(1,1),
OfAdress varchar(100),
OfPhone int,
OfEmail varchar(45),
RealUniID int foreign key references tblRealUniversity(RealUniID), 
ErasmusUniID int foreign key references tblErasmusUniversity(ErasmusUniID)
)

Create table tblActivityPost(
ActivityID int primary key identity(1,1),
Activityname varchar(45),
Actvitydatetime DATETIME,
ActivityAdress varchar(100),
Activityticketwebsite varchar(45),
CONSTRAINT FK_tblActivityPost FOREIGN KEY (OfficeID) REFERENCES tblErasmusOffice(OfficeID)
)
INSERT INTO tblActivityPost VALUES ('CONCER', '2021-08-08 20:00:00', 'amsterdam', 'amstick.com')
INSERT INTO tblActivityPost VALUES ('THEATER', '2021-08-08 23:00:00', 'amsterdam', 'amstick.com')
INSERT INTO tblActivityPost VALUES ('CONCER', '2021-08-08 00:00:00', 'amsterdam', 'amstick.com')
select tblActivityPost.Activityname, tblActivityPost.Actvitydatetime from tblActivityPost order by Actvitydatetime asc
Create table tblJobPost(
JobID int primary key identity(1,1),
Jobname varchar(45),
JobDetail varchar(100),
WorkingHours int,
Salary int
)
INSERT INTO tblJobPost VALUES ('Marketing', 'Fulltime', 8, 500)
INSERT INTO tblJobPost VALUES ('Marketing', 'Parttime', 4, 200)
INSERT INTO tblJobPost VALUES ('Developer', 'Remote', 8, 400)

Create table tblErasmusStudent(
EStudentID int primary key identity(1,1),
EStudentName varchar(45),
EStudetnSurname varchar(45),
EStuPhone int,
EStuEmail varchar(100),
EGPA float,
Grade int,
Semester int,
RealCountryID int foreign key references tblRealCountry(RealCountryID),
ErasmusCountryID int foreign key references tblErasmusCountry(ErasmusCountryID),
RealUniID int foreign key references tblRealUniversity(RealUniID), 
EUniID int foreign key references tblErasmusUniversity(ErasmusUniID),
--DanýsmanID int foreign key references tblDepartment(DanýsmanID),
OfficeID int foreign key references tblErasmusOffice(OfficeID)
)
INSERT INTO tblErasmusStudent VALUES('ONUR','CANSU',45565,'ONU@Ggmail.com', 3.11, 3, 5, 1,1,1,1,1) 
Create table tblRent(
EStudentID int foreign key references tblErasmusStudent(EStudentID),
Rentdatetime DATETIME,
PostID int foreign key references AccomodatePost(PostID)
)
Create table tblReview(
EStudentID int foreign key references tblErasmusStudent(EStudentID),
Reviewdatetime DATETIME,
PostID int foreign key references AccomodatePost(PostID)
)
Create table tblStudent(
StudentID int primary key identity(1,1),
StudentName varchar(45),
StudetnSurname varchar(45),
StuPhone int,
StuEmail varchar(100),
RCountryID int foreign key references tblRealCountry(RealCountryID),
RUniID int foreign key references tblRealUniversity(RealUniID),
DanýsmanID int foreign key references tblDepartment(DanýsmanID)
)
Create table tblApply(
EStudentID int foreign key references tblErasmusStudent(EStudentID),
Apply date,
Applystatus varchar(50),
JobID int foreign key references tblJobPost(JobID)
)
Create table tblEReview(
EStudentID int foreign key references tblErasmusStudent(EStudentID),
ErasmusReview date,
JobID int foreign key references tblJobPost(JobID)
)
Create table tblEActivity(
EStudentID int foreign key references tblErasmusStudent(EStudentID),
ErasmusAnnounce date,
ActivityID int foreign key references tblActivityPost(ActivityID),
)
Create table tblSReview(
StudentID int foreign key references tblStudent(StudentID),
StudentActivityReview date,
ActivityID int foreign key references tblActivityPost(ActivityID)
)
Create table tblSJobReview(
StudentID int foreign key references tblStudent(StudentID),
StudentJobReview date,
JobID int foreign key references tblJobPost(JobID)
)
Create table tblActivityAnnounce(
StudentID int foreign key references tblStudent(StudentID),
StudentActivityAnnounce date,
ActivityID int foreign key references tblActivityPost(ActivityID)
)
Create table tblSJobAnnounce(
StudentID int foreign key references tblStudent(StudentID),
StudentJobAnnounce date,
JobID int foreign key references tblJobPost(JobID)
)

Create table tblOfficeActReview(
OfficeID int foreign key references tblErasmusOffice(OfficeID),
StudentActivityReview date,
ActivityID int foreign key references tblActivityPost(ActivityID),
)
Create table tblOfficeJobReview(
OfficeID int foreign key references tblErasmusOffice(OfficeID),
StudentJobReview date,
JobID int foreign key references tblJobPost(JobID)
)
Create table tblOfficeActAnnounce(
OfficeID int foreign key references tblErasmusOffice(OfficeID),
StudentActivityAnnounce date,
ActivityID int foreign key references tblActivityPost(ActivityID),
)
Create table tblOfficeJobAnnounce(
OfficeID int foreign key references tblErasmusOffice(OfficeID),
StudentJobAnnounce date,
JobID int foreign key references tblJobPost(JobID)
)
Create table tblMuseumReview(
EStudentID int foreign key references tblErasmusStudent(EStudentID),
Museumreview date,
MuseumID int foreign key references tblMuseum(MuseumID)
)
Create table tblRestoranReview(
EStudentID int foreign key references tblErasmusStudent(EStudentID),
StudentJobAnnounce date,
RestaurantID int foreign key references tblRestaurant(RestaurantID)
)
Create table tblHairReview(
EStudentID int foreign key references tblErasmusStudent(EStudentID),
StudentJobAnnounce date,
HairID int foreign key references tblHairdresser(HairID)
)
Create table tblDryReview(
DryID int foreign key references tblDrycleaner(DryID),
StudentJobAnnounce date,
JobID int foreign key references tblJobPost(JobID)
)

--VIEWS
CREATE VIEW [Restaurant 30£] AS
SELECT tblRestaurant.RName, tblRestaurant.RaveragePrice, tblRestaurant.Rdistancefromthehome
FROM tblRestaurant 
--WHERE RaveragePrice < 30 AND Rdistancefromthehome < 1100;

SELECT * FROM [Restaurant 30£]
WHERE RaveragePrice < 30 AND Rdistancefromthehome < 1100

CREATE VIEW [Accomodate] AS
SELECT AccomodatePost.PostID, AccomodatePost.m2, AccomodatePost.Distancefromthecenter 
FROM AccomodatePost
--

SELECT * FROM [Accomodate]
WHERE m2 BETWEEN 70 AND 90 AND Distancefromthecenter < 1000

--STOREDPROCEDURE
CREATE PROCEDURE Allactivities @ActivityID int
AS
BEGIN
SELECT * FROM tblActivityPost where ActivityID =@ActivityID
END

EXEC Allactivities @ActivityID = 3

CREATE PROCEDURE AllJob @JobID int
AS
BEGIN
SELECT * FROM tblJobPost where JobID = @JobID
END

EXEC AllJob @JobID = 1

--TRIGGERS




























