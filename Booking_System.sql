CREATE DATABASE Clinic_Booking_System;
use Clinic_Booking_System;

-- Users Table
Create table Users(
User_ID serial Primary Key,
Username varchar (50) Unique not null,
password_hash text not null,
role varchar(20) not null check (role in ('admin', 'Secretary', 'Registra','Doctor' )),
created_at timestamp default current_timestamp);

-- Patients Table
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    phone VARCHAR(15),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Doctors Table
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(user_id) ON DELETE CASCADE,
    specialization VARCHAR(100) NOT NULL
);

-- Appointments Table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id) ON DELETE CASCADE,
    doctor_id INT REFERENCES doctors(doctor_id) ON DELETE SET NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    reason TEXT,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'cancelled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Services Table
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- Appointment_Service Table (many-to-many)
CREATE TABLE appointment_service (
    appointment_id INT REFERENCES appointments(appointment_id) ON DELETE CASCADE,
    service_id INT REFERENCES services(service_id) ON DELETE CASCADE,
    PRIMARY KEY (appointment_id, service_id)
);

-- Create Users
create user 'Daisy'@'localhost' identified by 'Admin123';
create user 'Alex'@'localhost' identified by 'registra123';
create user 'mitch'@'localhost' identified by 'secretary123';
create user 'ray'@'localhost' identified by 'doctor123';
create user 'Achi'@'localhost' identified by 'doctor123';
create user 'Gae'@'localhost' identified by 'registra123';

-- Create roles
CREATE ROLE admin;
CREATE ROLE secretarypass;
CREATE ROLE registrar;
CREATE ROLE doctor;

-- Grating roles to users
Grant admin to Daisy @'localhost';
Grant registrar to Alex @'localhost';
Grant registrar to Gae @'localhost';
Grant secretarypass to mitch @'localhost';
Grant doctor to ray @'localhost';
Grant doctor to Achi @'localhost';


-- Granting priviledges to roles
-- Admin: Overlooks the operations of the whole System
GRANT all PRIVILEGES ON Clinic_Booking_System TO admin;

-- Registrar: Manages patients and appointments
GRANT SELECT, INSERT, UPDATE, DELETE ON Clinic_Booking_System.patients TO registrar;
GRANT SELECT, INSERT, UPDATE, DELETE ON Clinic_Booking_System.appointments TO registrar;

-- Secretary: Manages bookings (can view patients, doctors, appointments)
GRANT SELECT, INSERT, UPDATE ON Clinic_Booking_System.appointments TO secretarypass;
GRANT SELECT ON Clinic_Booking_System.patients TO secretarypass;
GRANT SELECT ON Clinic_Booking_System.doctors TO secretarypass;

-- Doctor: Can view own appointments
GRANT SELECT ON Clinic_Booking_System.patients TO doctor;
GRANT SELECT ON Clinic_Booking_System.appointments TO doctor;



