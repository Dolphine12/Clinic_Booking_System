# 🏥 Clinic Booking System

## 📌 Project Overview

This **Clinic Booking System** is a robust relational database designed to simplify and streamline clinical operations. It handles patient records, doctor scheduling, service management, and secure role-based access for different types of users. The project includes an ERD diagram and SQL scripts to build and manage the system.

---

## 💡 What the Project Does

- Stores and manages patient and doctor data
- Enables appointment scheduling with multiple services
- Assigns specific access levels based on user roles (Admin, Registrar, Secretary, Doctor)
- Enforces data integrity with foreign keys and constraints

---

## 👥 Who Can Use the System?

This system is designed for:

- **Clinic Administrators** – for overseeing operations and managing users
- **Receptionists/Secretaries** – to handle patient bookings and schedules
- **Registrars** – to register new patients and appointments
- **Doctors** – to view scheduled appointments and patient records

---

## 🖼️ Entity Relationship Diagram (ERD)
![ERD Diagram](/Clinic_Booking_System.drawio.png)
 
### Table Relationship:
-**Patients**: Each patient can have multiple appointments but with one doctor at a time.

-**Doctors**: A doctor can be assigned to many appointments.

-**Appointments**: This table links patients and doctors, along with time and status.

-**Services**: Each appointment can include one or more medical services.

-**Users**: Admin, registrar, secretary, and doctor roles are managed via this table.

-**Roles**: The role_id links to specific access rights for each user.

-**Departments**: Doctors are grouped by departments for organization.

## 🌍 Where It Can Be Applied / Integrated

This system can be used in or integrated with:

- **Private Clinics**
- **Outpatient Departments**
- **Specialized Medical Centers**
- **Telemedicine Platforms**
- **Hospital Subsystems** for appointments or outpatient records

It can also be integrated with:
- Frontend applications (React, Angular, etc.)
- APIs for mobile apps
- Reporting dashboards or BI tools for insights

---

## 🛠 Tools & Resources Used

- **MySQL Workbench** – for database design and management
- **SQL** – for schema creation and constraints
- **Draw.io (diagrams.net)** – for creating the ERD
- **Local MySQL Server** – for development and testing

---

## ⚙️ Setup Instructions

1. **Install MySQL Workbench**  
   [Download here](https://dev.mysql.com/downloads/workbench/)

2. **Create a New Schema**  
   Name it `clinic_system` or your preferred name.

3. **Import the SQL File**  
   Open the SQL script provided and execute to create tables and insert sample data.

4. **Create Users and Assign roles and Privileges**
   ```sql
   CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
   CREATE USER 'secretary'@'localhost' IDENTIFIED BY 'secret123';
   CREATE USER 'registrar'@'localhost' IDENTIFIED BY 'reg123';
   CREATE USER 'doctor'@'localhost' IDENTIFIED BY 'doc123';

   GRANT ALL PRIVILEGES ON clinic_system.* TO 'admin'@'localhost';
   GRANT SELECT, INSERT, UPDATE ON clinic_system.* TO 'secretary'@'localhost';
   GRANT SELECT, INSERT ON clinic_system.* TO 'registrar'@'localhost';
   GRANT SELECT ON clinic_system.* TO 'doctor'@'localhost';

## 🔮 Future Improvements
✅ Email/SMS Notifications – for appointment reminders and confirmations.

✅ Web Frontend Interface – using HTML, CSS, and JavaScript (or React/Vue).

✅ Doctor Availability Scheduling – manage availability per week.

✅ Multi-Branch Support – for organizations with multiple clinics.

✅ Medical History Module – tracking diagnoses, prescriptions, and test results.




