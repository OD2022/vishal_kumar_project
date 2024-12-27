USE curriculum_vitae_db;

-- Check and create InsertBioData procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertBioData$$
CREATE PROCEDURE InsertBioData(
    IN p_Fname VARCHAR(100),
    IN p_Lname VARCHAR(100),
    IN p_Address TEXT,
    IN p_Email VARCHAR(100),
    IN p_LinkedInHandle VARCHAR(255)
)
BEGIN
    INSERT INTO BioData (Fname, Lname, Address, Email, LinkedInHandle)
    VALUES (p_Fname, p_Lname, p_Address, p_Email, p_LinkedInHandle);
END$$

DELIMITER ;

-- Check and create SelectBioData procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectBioData$$
CREATE PROCEDURE SelectBioData(
    IN p_Email VARCHAR(100)
)
BEGIN
    SELECT * FROM BioData WHERE Email = p_Email;
END$$

DELIMITER ;

-- Check and create UpdateBioData procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateBioData$$
CREATE PROCEDURE UpdateBioData(
    IN p_Fname VARCHAR(100),
    IN p_Lname VARCHAR(100),
    IN p_Address TEXT,
    IN p_LinkedInHandle VARCHAR(255),
    IN p_Email VARCHAR(100)
)
BEGIN
    UPDATE BioData
    SET Fname = p_Fname, Lname = p_Lname, Address = p_Address, LinkedInHandle = p_LinkedInHandle
    WHERE Email = p_Email;
END$$

DELIMITER ;

-- Check and create DeleteBioData procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteBioData$$
CREATE PROCEDURE DeleteBioData(
    IN p_Email VARCHAR(100)
)
BEGIN
    DELETE FROM BioData WHERE Email = p_Email;
END$$

DELIMITER ;

-- Check and create InsertMobileNumber procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertMobileNumber$$
CREATE PROCEDURE InsertMobileNumber(
    IN p_Number VARCHAR(15),
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    INSERT INTO MobileNumbers (Number, OwnerEmail)
    VALUES (p_Number, p_OwnerEmail);
END$$

DELIMITER ;

-- Check and create SelectMobileNumbers procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectMobileNumbers$$
CREATE PROCEDURE SelectMobileNumbers(
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    SELECT * FROM MobileNumbers WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create UpdateMobileNumber procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateMobileNumber$$
CREATE PROCEDURE UpdateMobileNumber(
    IN p_Number VARCHAR(15),
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    UPDATE MobileNumbers
    SET Number = p_Number
    WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create DeleteMobileNumber procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteMobileNumber$$
CREATE PROCEDURE DeleteMobileNumber(
    IN p_Number VARCHAR(15)
)
BEGIN
    DELETE FROM MobileNumbers WHERE Number = p_Number;
END$$

DELIMITER ;

-- Check and create InsertSkill procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertSkill$$
CREATE PROCEDURE InsertSkill(
    IN p_Skill VARCHAR(100),
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    INSERT INTO Skills (Skill, OwnerEmail)
    VALUES (p_Skill, p_OwnerEmail);
END$$

DELIMITER ;

-- Check and create SelectSkills procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectSkills$$
CREATE PROCEDURE SelectSkills(
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    SELECT * FROM Skills WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create UpdateSkill procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateSkill$$
CREATE PROCEDURE UpdateSkill(
    IN p_Skill VARCHAR(100),
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    UPDATE Skills
    SET Skill = p_Skill
    WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create DeleteSkill procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteSkill$$
CREATE PROCEDURE DeleteSkill(
    IN p_Skill VARCHAR(100),
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    DELETE FROM Skills WHERE Skill = p_Skill AND OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Experience Table Procedures
-- Check and create InsertExperience procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertExperience$$
CREATE PROCEDURE InsertExperience(
    IN p_Title VARCHAR(255),
    IN p_CompanyName VARCHAR(255),
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    INSERT INTO Experience (Title, CompanyName, StartDate, EndDate, OwnerEmail)
    VALUES (p_Title, p_CompanyName, p_StartDate, p_EndDate, p_OwnerEmail);
END$$

DELIMITER ;

-- Check and create SelectExperience procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectExperience$$
CREATE PROCEDURE SelectExperience(
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    SELECT * FROM Experience WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create UpdateExperience procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateExperience$$
CREATE PROCEDURE UpdateExperience(
    IN p_ExperienceID INT,
    IN p_Title VARCHAR(255),
    IN p_CompanyName VARCHAR(255),
    IN p_StartDate DATE,
    IN p_EndDate DATE
)
BEGIN
    UPDATE Experience
    SET Title = p_Title, CompanyName = p_CompanyName, StartDate = p_StartDate, EndDate = p_EndDate
    WHERE ExperienceID = p_ExperienceID;
END$$

DELIMITER ;

-- Check and create DeleteExperience procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteExperience$$
CREATE PROCEDURE DeleteExperience(
    IN p_ExperienceID INT
)
BEGIN
    DELETE FROM Experience WHERE ExperienceID = p_ExperienceID;
END$$

DELIMITER ;

-- ExperienceDescription Table Procedures
-- Check and create InsertExperienceDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertExperienceDescription$$
CREATE PROCEDURE InsertExperienceDescription(
    IN p_ExperienceID INT,
    IN p_Description TEXT
)
BEGIN
    INSERT INTO ExperienceDescriptions (ExperienceID, Description)
    VALUES (p_ExperienceID, p_Description);
END$$

DELIMITER ;

-- Check and create SelectExperienceDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectExperienceDescription$$
CREATE PROCEDURE SelectExperienceDescription(
    IN p_ExperienceID INT
)
BEGIN
    SELECT * FROM ExperienceDescriptions WHERE ExperienceID = p_ExperienceID;
END$$

DELIMITER ;

-- Check and create UpdateExperienceDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateExperienceDescription$$
CREATE PROCEDURE UpdateExperienceDescription(
    IN p_ExperienceID INT,
    IN p_Description TEXT
)
BEGIN
    UPDATE ExperienceDescriptions
    SET Description = p_Description
    WHERE ExperienceID = p_ExperienceID;
END$$

DELIMITER ;

-- Check and create DeleteExperienceDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteExperienceDescription$$
CREATE PROCEDURE DeleteExperienceDescription(
    IN p_ExperienceID INT
)
BEGIN
    DELETE FROM ExperienceDescriptions WHERE ExperienceID = p_ExperienceID;
END$$

DELIMITER ;

-- Projects Procedures
-- Check and create InsertProject procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertProject$$
CREATE PROCEDURE InsertProject(
    IN p_Title VARCHAR(255),
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    INSERT INTO Projects (Title, StartDate, EndDate, OwnerEmail)
    VALUES (p_Title, p_StartDate, p_EndDate, p_OwnerEmail);
END$$

DELIMITER ;

-- Projects Table Procedures
-- Check and create InsertProject procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertProject$$
CREATE PROCEDURE InsertProject(
    IN p_Title VARCHAR(255),
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    INSERT INTO Projects (Title, StartDate, EndDate, OwnerEmail)
    VALUES (p_Title, p_StartDate, p_EndDate, p_OwnerEmail);
END$$

DELIMITER ;

-- Check and create SelectProject procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectProject$$
CREATE PROCEDURE SelectProject(
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    SELECT * FROM Projects WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create UpdateProject procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateProject$$
CREATE PROCEDURE UpdateProject(
    IN p_ProjectID INT,
    IN p_Title VARCHAR(255),
    IN p_StartDate DATE,
    IN p_EndDate DATE
)
BEGIN
    UPDATE Projects
    SET Title = p_Title, StartDate = p_StartDate, EndDate = p_EndDate
    WHERE ProjectID = p_ProjectID;
END$$

DELIMITER ;

-- Check and create DeleteProject procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteProject$$
CREATE PROCEDURE DeleteProject(
    IN p_ProjectID INT
)
BEGIN
    DELETE FROM Projects WHERE ProjectID = p_ProjectID;
END$$

DELIMITER ;

-- ProjectsDescriptions Table Procedures
-- Check and create InsertProjectDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertProjectDescription$$
CREATE PROCEDURE InsertProjectDescription(
    IN p_ProjectID INT,
    IN p_Description TEXT
)
BEGIN
    INSERT INTO ProjectsDescriptions (ProjectID, Description)
    VALUES (p_ProjectID, p_Description);
END$$

DELIMITER ;

-- Check and create SelectProjectDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectProjectDescription$$
CREATE PROCEDURE SelectProjectDescription(
    IN p_ProjectID INT
)
BEGIN
    SELECT * FROM ProjectsDescriptions WHERE ProjectID = p_ProjectID;
END$$

DELIMITER ;

-- Check and create UpdateProjectDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateProjectDescription$$
CREATE PROCEDURE UpdateProjectDescription(
    IN p_ProjectID INT,
    IN p_Description TEXT
)
BEGIN
    UPDATE ProjectsDescriptions
    SET Description = p_Description
    WHERE ProjectID = p_ProjectID;
END$$

DELIMITER ;

-- Check and create DeleteProjectDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteProjectDescription$$
CREATE PROCEDURE DeleteProjectDescription(
    IN p_ProjectID INT
)
BEGIN
    DELETE FROM ProjectsDescriptions WHERE ProjectID = p_ProjectID;
END$$

DELIMITER ;

-- Responsibilities Table Procedures
-- Check and create InsertResponsibility procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertResponsibility$$
CREATE PROCEDURE InsertResponsibility(
    IN p_Title VARCHAR(255),
    IN p_Organization VARCHAR(255),
    IN p_StartDate DATE,
    IN p_EndDate DATE,
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    INSERT INTO Responsibilities (Title, Organization, StartDate, EndDate, OwnerEmail)
    VALUES (p_Title, p_Organization, p_StartDate, p_EndDate, p_OwnerEmail);
END$$

DELIMITER ;

-- Check and create SelectResponsibility procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectResponsibility$$
CREATE PROCEDURE SelectResponsibility(
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    SELECT * FROM Responsibilities WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create UpdateResponsibility procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateResponsibility$$
CREATE PROCEDURE UpdateResponsibility(
    IN p_ResponsibilityID INT,
    IN p_Title VARCHAR(255),
    IN p_Organization VARCHAR(255),
    IN p_StartDate DATE,
    IN p_EndDate DATE
)
BEGIN
    UPDATE Responsibilities
    SET Title = p_Title, Organization = p_Organization, StartDate = p_StartDate, EndDate = p_EndDate
    WHERE ResponsibilityID = p_ResponsibilityID;
END$$

DELIMITER ;

-- Check and create DeleteResponsibility procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteResponsibility$$
CREATE PROCEDURE DeleteResponsibility(
    IN p_ResponsibilityID INT
)
BEGIN
    DELETE FROM Responsibilities WHERE ResponsibilityID = p_ResponsibilityID;
END$$

DELIMITER ;

-- ResponsibilitiesDescriptions Table Procedures
-- Check and create InsertResponsibilityDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertResponsibilityDescription$$
CREATE PROCEDURE InsertResponsibilityDescription(
    IN p_ResponsibilityID INT,
    IN p_Description TEXT
)
BEGIN
    INSERT INTO ResponsibilitiesDescriptions (ResponsibilityID, Description)
    VALUES (p_ResponsibilityID, p_Description);
END$$

DELIMITER ;

-- Check and create SelectResponsibilityDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectResponsibilityDescription$$
CREATE PROCEDURE SelectResponsibilityDescription(
    IN p_ResponsibilityID INT
)
BEGIN
    SELECT * FROM ResponsibilitiesDescriptions WHERE ResponsibilityID = p_ResponsibilityID;
END$$

DELIMITER ;

-- Check and create UpdateResponsibilityDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateResponsibilityDescription$$
CREATE PROCEDURE UpdateResponsibilityDescription(
    IN p_ResponsibilityID INT,
    IN p_Description TEXT
)
BEGIN
    UPDATE ResponsibilitiesDescriptions
    SET Description = p_Description
    WHERE ResponsibilityID = p_ResponsibilityID;
END$$

DELIMITER ;

-- Check and create DeleteResponsibilityDescription procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteResponsibilityDescription$$
CREATE PROCEDURE DeleteResponsibilityDescription(
    IN p_ResponsibilityID INT
)
BEGIN
    DELETE FROM ResponsibilitiesDescriptions WHERE ResponsibilityID = p_ResponsibilityID;
END$$

DELIMITER ;

-- Certifications Table Procedures
-- Check and create InsertCertification procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertCertification$$
CREATE PROCEDURE InsertCertification(
    IN p_Title VARCHAR(255),
    IN p_IssuingBody VARCHAR(255),
    IN p_Description TEXT,
    IN p_ReceiptDay DATE,
    IN p_ExpiryDay DATE,
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    INSERT INTO Certifications (Title, IssuingBody, Description, ReceiptDay, ExpiryDay, OwnerEmail)
    VALUES (p_Title, p_IssuingBody, p_Description, p_ReceiptDay, p_ExpiryDay, p_OwnerEmail);
END$$

DELIMITER ;

-- Check and create SelectCertification procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectCertification$$
CREATE PROCEDURE SelectCertification(
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    SELECT * FROM Certifications WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create UpdateCertification procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateCertification$$
CREATE PROCEDURE UpdateCertification(
    IN p_Title VARCHAR(255),
    IN p_IssuingBody VARCHAR(255),
    IN p_Description TEXT,
    IN p_ReceiptDay DATE,
    IN p_ExpiryDay DATE,
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    UPDATE Certifications
    SET Title = p_Title, IssuingBody = p_IssuingBody, Description = p_Description, 
        ReceiptDay = p_ReceiptDay, ExpiryDay = p_ExpiryDay
    WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create DeleteCertification procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteCertification$$
CREATE PROCEDURE DeleteCertification(
    IN p_OwnerEmail VARCHAR(100),
    IN p_Title VARCHAR(255),
    IN p_IssuingBody VARCHAR(255)
)
BEGIN
    DELETE FROM Certifications 
    WHERE OwnerEmail = p_OwnerEmail AND Title = p_Title AND IssuingBody = p_IssuingBody;
END$$

DELIMITER ;

-- Education Table Procedures
-- Check and create InsertEducation procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS InsertEducation$$
CREATE PROCEDURE InsertEducation(
    IN p_InstitutionName VARCHAR(255),
    IN p_TypeOfInstitution VARCHAR(100),
    IN p_CGPA DECIMAL(3, 2),
    IN p_Degree VARCHAR(100),
    IN p_StartYear INT,
    IN p_EndYear INT,
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    INSERT INTO Education (InstitutionName, TypeOfInstitution, CGPA, Degree, StartYear, EndYear, OwnerEmail)
    VALUES (p_InstitutionName, p_TypeOfInstitution, p_CGPA, p_Degree, p_StartYear, p_EndYear, p_OwnerEmail);
END$$

DELIMITER ;

-- Check and create SelectEducation procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS SelectEducation$$
CREATE PROCEDURE SelectEducation(
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    SELECT * FROM Education WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create UpdateEducation procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS UpdateEducation$$
CREATE PROCEDURE UpdateEducation(
    IN p_InstitutionName VARCHAR(255),
    IN p_TypeOfInstitution VARCHAR(100),
    IN p_CGPA DECIMAL(3, 2),
    IN p_Degree VARCHAR(100),
    IN p_StartYear INT,
    IN p_EndYear INT,
    IN p_OwnerEmail VARCHAR(100)
)
BEGIN
    UPDATE Education
    SET InstitutionName = p_InstitutionName, TypeOfInstitution = p_TypeOfInstitution, 
        CGPA = p_CGPA, Degree = p_Degree, StartYear = p_StartYear, EndYear = p_EndYear
    WHERE OwnerEmail = p_OwnerEmail;
END$$

DELIMITER ;

-- Check and create DeleteEducation procedure if not exists
DELIMITER $$

DROP PROCEDURE IF EXISTS DeleteEducation$$
CREATE PROCEDURE DeleteEducation(
    IN p_OwnerEmail VARCHAR(100),
    IN p_Degree VARCHAR(100)
)
BEGIN
    DELETE FROM Education WHERE OwnerEmail = p_OwnerEmail AND Degree = p_Degree;
END$$

DELIMITER ;
