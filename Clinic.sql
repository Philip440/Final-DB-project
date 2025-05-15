-- Database: ClinicBookingSystem

-- Drop tables if they exist (for development/testing purposes)
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Services;

-- Table: Patients
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactNumber VARCHAR(20) UNIQUE,
    Address VARCHAR(255)
);

-- Table: Doctors
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialization VARCHAR(100),
    ContactNumber VARCHAR(20) UNIQUE
);

-- Table: Services
CREATE TABLE Services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT,
    DurationMinutes INT
);

-- Table: Appointments
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    ServiceID INT NOT NULL,
    AppointmentDateTime DATETIME NOT NULL UNIQUE,
    BookingDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- Optionally, a table for many-to-many relationship between Doctors and Services
-- if a doctor can offer multiple services and a service can be offered by multiple doctors
/*
DROP TABLE IF EXISTS DoctorServices;
CREATE TABLE DoctorServices (
    DoctorID INT NOT NULL,
    ServiceID INT NOT NULL,
    PRIMARY KEY (DoctorID, ServiceID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
*/
