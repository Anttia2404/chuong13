-- Create database if not exists
CREATE DATABASE IF NOT EXISTS murach_jpa;

-- Use the database
USE murach_jpa;

-- Drop table if exists (for clean setup)
DROP TABLE IF EXISTS User;

-- Create User table
CREATE TABLE User (
    email VARCHAR(255) PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    dateOfBirth DATE
);

-- Insert sample data
INSERT INTO User (email, firstName, lastName, dateOfBirth) VALUES
('john@example.com', 'John', 'Doe', '1990-01-15'),
('jane@example.com', 'Jane', 'Smith', '1992-05-20');

SELECT 'Database murach_jpa created successfully!' AS Message;
