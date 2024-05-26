CREATE DATABASE InternshipManagement;
USE InternshipManagement;
CREATE TABLE Internships (
    int_id INT PRIMARY KEY AUTO_INCREMENT,
    apply_links VARCHAR(255),
    date_of_posting DATE,
    apply_start_date DATE,
    apply_end_date DATE,
    govt_pvt ENUM('govt', 'pvt'),
    branch VARCHAR(100),
    free_stp BOOLEAN,
    company_college VARCHAR(100),
    stp_amt DECIMAL(10, 2),
    duration_in_weeks INT,
    int_start_date DATE,
    int_end_date DATE,
    location VARCHAR(255),
    online_offline ENUM('online', 'offline', 'hybrid'),
    interest_area1 INT,
    interest_area2 INT,
    interest_area3 INT,
    interest_area4 INT,
    interest_area5 INT,
    FOREIGN KEY (interest_area1) REFERENCES Interest_Areas(area_id),
    FOREIGN KEY (interest_area2) REFERENCES Interest_Areas(area_id),
    FOREIGN KEY (interest_area3) REFERENCES Interest_Areas(area_id),
    FOREIGN KEY (interest_area4) REFERENCES Interest_Areas(area_id),
    FOREIGN KEY (interest_area5) REFERENCES Interest_Areas(area_id)
);
CREATE TABLE Internship_Students (
    std_id INT,
    int_id INT,
    apply_date DATE,
    selected_date DATE DEFAULT NULL,
    PRIMARY KEY (std_id, int_id),
    FOREIGN KEY (std_id) REFERENCES Students(std_id),
    FOREIGN KEY (int_id) REFERENCES Internships(int_id)
);
CREATE TABLE Interest_Areas (
    area_id INT PRIMARY KEY AUTO_INCREMENT,
    area_name VARCHAR(100),
    area_description TEXT
);
INSERT INTO Interest_Areas (area_name, area_description) VALUES
('Software Development', 'Focuses on developing software applications'),
('Data Science', 'Involves data analysis and machine learning'),
('Cybersecurity', 'Focuses on protecting systems and networks'),
('Digital Marketing', 'Involves promoting products and services online'),
('Robotics', 'Focuses on designing and building robots');
INSERT INTO Internships (apply_links, date_of_posting, apply_start_date, apply_end_date, govt_pvt, branch, free_stp, company_college, stp_amt, duration_in_weeks, int_start_date, int_end_date, location, online_offline, interest_area1, interest_area2, interest_area3, interest_area4, interest_area5) VALUES
('http://example.com/apply1', '2024-05-01', '2024-05-05', '2024-05-15', 'pvt', 'Computer Science', TRUE, 'Company A', 0.00, 8, '2024-06-01', '2024-07-26', 'New York', 'online', 1, 2, NULL, NULL, NULL),
('http://example.com/apply2', '2024-05-01', '2024-05-05', '2024-05-15', 'govt', 'Electronics', FALSE, 'Company B', 500.00, 12, '2024-06-01', '2024-08-23', 'San Francisco', 'offline', 3, 4, 5, NULL, NULL);
INSERT INTO Students (branch, year, interest_area1, interest_area2, interest_area3, interest_area4, interest_area5) VALUES
('Computer Science', 2, 1, 2, NULL, NULL, NULL),
('Electronics', 3, 3, 4, 5, NULL, NULL);
INSERT INTO Internship_Students (std_id, int_id, apply_date, selected_date) VALUES
(1, 1, '2024-05-06', NULL),
(2, 2, '2024-05-07', '2024-05-20');
