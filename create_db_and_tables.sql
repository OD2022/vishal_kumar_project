-- Create the database if it does not exist
CREATE DATABASE IF NOT EXISTS curriculum_vitae_db;
USE curriculum_vitae_db;

-- Create the BioData table if it does not exist
CREATE TABLE IF NOT EXISTS BioData (
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Address TEXT,
    Email VARCHAR(100) PRIMARY KEY,
    LinkedInHandle VARCHAR(255)
);
CREATE INDEX IF NOT EXISTS idx_biodata_email ON BioData(Email);

-- Create the MobileNumbers table if it does not exist
CREATE TABLE IF NOT EXISTS MobileNumbers (
    Number VARCHAR(15) PRIMARY KEY,
    OwnerEmail VARCHAR(100),
    FOREIGN KEY (OwnerEmail) REFERENCES BioData(Email)
);
-- Composite Index for mobile number and email
CREATE INDEX IF NOT EXISTS idx_mobilenumbers_owner_email ON MobileNumbers(Number, OwnerEmail);

-- Create the Skills table if it does not exist
CREATE TABLE IF NOT EXISTS Skills (
    Skill VARCHAR(100),
    OwnerEmail VARCHAR(100),
    PRIMARY KEY (Skill, OwnerEmail),
    FOREIGN KEY (OwnerEmail) REFERENCES BioData(Email)
);
-- Indexing for skill lookups by owner email
CREATE INDEX IF NOT EXISTS idx_skills_owner_email ON Skills(OwnerEmail);

-- Create the Experience table if it does not exist
CREATE TABLE IF NOT EXISTS Experience (
    ExperienceID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    CompanyName VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    OwnerEmail VARCHAR(100),
    FOREIGN KEY (OwnerEmail) REFERENCES BioData(Email)
);
-- Indexing for faster lookups on OwnerEmail in Experience table
CREATE INDEX IF NOT EXISTS idx_experience_owner_email ON Experience(OwnerEmail);

-- Create the ExperienceDescriptions table if it does not exist
CREATE TABLE IF NOT EXISTS ExperienceDescriptions (
    ExperienceID INT,
    Description TEXT,
    PRIMARY KEY (ExperienceID, Description(255)),
    FOREIGN KEY (ExperienceID) REFERENCES Experience(ExperienceID)
);
-- Create an index on the first 255 characters of the Description column
CREATE INDEX IF NOT EXISTS idx_experience_descriptions_experience_id ON ExperienceDescriptions(ExperienceID, Description(255));

-- Create the Responsibilities table if it does not exist
CREATE TABLE IF NOT EXISTS Responsibilities (
    ResponsibilityID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    Organization VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    OwnerEmail VARCHAR(100),
    FOREIGN KEY (OwnerEmail) REFERENCES BioData(Email)
);
-- Indexing for faster lookups on OwnerEmail in Responsibilities table
CREATE INDEX IF NOT EXISTS idx_responsibilities_owner_email ON Responsibilities(OwnerEmail);

-- Create the ResponsibilitiesDescriptions table if it does not exist
CREATE TABLE IF NOT EXISTS ResponsibilitiesDescriptions (
    ResponsibilityID INT,
    Description TEXT,
    PRIMARY KEY (ResponsibilityID, Description(255)),
    FOREIGN KEY (ResponsibilityID) REFERENCES Responsibilities(ResponsibilityID)
);
-- Create an index on the first 255 characters of the Description column
CREATE INDEX IF NOT EXISTS idx_responsibilities_descriptions_responsibility_id 
ON ResponsibilitiesDescriptions(ResponsibilityID);

-- Create the Projects table if it does not exist
CREATE TABLE IF NOT EXISTS Projects (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    OwnerEmail VARCHAR(100),
    FOREIGN KEY (OwnerEmail) REFERENCES BioData(Email)
);
-- Indexing for faster lookups on OwnerEmail in Projects table
CREATE INDEX IF NOT EXISTS idx_projects_owner_email ON Projects(OwnerEmail);

-- Create the ProjectsDescriptions table if it does not exist
CREATE TABLE IF NOT EXISTS ProjectsDescriptions (
    ProjectID INT,
    Description TEXT,
    PRIMARY KEY (ProjectID, Description(255)),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
-- Create an index on the ProjectID column for fast lookups
CREATE INDEX IF NOT EXISTS idx_projects_descriptions_project_id ON ProjectsDescriptions(ProjectID);

-- Create the Education table if it does not exist
CREATE TABLE IF NOT EXISTS Education (
    InstitutionName VARCHAR(255),
    TypeOfInstitution VARCHAR(100),
    CGPA DECIMAL(3, 2),
    Degree VARCHAR(100),
    StartYear INT,
    EndYear INT,
    OwnerEmail VARCHAR(100),
    PRIMARY KEY (InstitutionName, OwnerEmail, StartYear, EndYear, Degree),
    FOREIGN KEY (OwnerEmail) REFERENCES BioData(Email)
);
-- Indexing for Education table (based on OwnerEmail)
CREATE INDEX IF NOT EXISTS idx_education_owner_email ON Education(OwnerEmail);

-- Create the Certifications table if it does not exist
CREATE TABLE IF NOT EXISTS Certifications (
    Title VARCHAR(255),
    IssuingBody VARCHAR(255),
    Description TEXT,
    ReceiptDay DATE,
    ExpiryDay DATE,
    OwnerEmail VARCHAR(100),
    PRIMARY KEY (OwnerEmail, Title, IssuingBody, ReceiptDay, ExpiryDay),
    FOREIGN KEY (OwnerEmail) REFERENCES BioData(Email)
);
-- Indexing for Certifications (based on OwnerEmail)
CREATE INDEX IF NOT EXISTS idx_certifications_owner_email ON Certifications(OwnerEmail);

-- Inserting a new record into the BioData table
INSERT INTO BioData (Fname, Lname, Address, Email, LinkedInHandle)
VALUES ('John', 'Doe', '123 Main St, Springfield, IL', 'john.doe@example.com', 'https://www.linkedin.com/in/johndoe');

-- Inserting a mobile number associated with a user
INSERT INTO MobileNumbers (Number, OwnerEmail)
VALUES ('+1234567890', 'john.doe@example.com');

-- Inserting a skill associated with a user
INSERT INTO Skills (Skill, OwnerEmail)
VALUES ('JavaScript', 'john.doe@example.com');

-- Inserting education history for a user
INSERT INTO Education (InstitutionName, TypeOfInstitution, CGPA, Degree, StartYear, EndYear, OwnerEmail)
VALUES ('University of Springfield', 'University', 3.75, 'BSc Computer Science', 2016, 2020, 'john.doe@example.com');

-- Inserting a certification for a user
INSERT INTO Certifications (Title, IssuingBody, Description, ReceiptDay, ExpiryDay, OwnerEmail)
VALUES ('Certified JavaScript Developer', 'Udemy', 'Completed JavaScript development course', '2021-05-01', '2024-05-01', 'john.doe@example.com');



