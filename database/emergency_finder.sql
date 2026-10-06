CREATE DATABASE IF NOT EXISTS emergency_finder;
USE emergency_finder;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    mobile VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE resource_types (
    type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    type_id INT NOT NULL,
    address VARCHAR(255) NOT NULL,
    area VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    is_24x7 BOOLEAN DEFAULT FALSE,
    availability_status ENUM('AVAILABLE','UNAVAILABLE') DEFAULT 'AVAILABLE',
    verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_resource_type FOREIGN KEY (type_id)
        REFERENCES resource_types(type_id)
);

CREATE TABLE emergency_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE resource_services (
    resource_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (resource_id, category_id),
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES emergency_categories(category_id) ON DELETE CASCADE
);

CREATE TABLE resource_reports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    resource_id INT NOT NULL,
    reason VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    status ENUM('PENDING','REVIEWED','RESOLVED') DEFAULT 'PENDING',
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id)
);

CREATE TABLE search_history (
    search_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NULL,
    emergency_category VARCHAR(100),
    resource_type VARCHAR(50),
    area VARCHAR(100),
    searched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

INSERT INTO resource_types(type_name) VALUES
('Hospital'), ('Pharmacy'), ('Blood Bank'), ('Police Station'),
('Fire Station'), ('Ambulance');

INSERT INTO emergency_categories(category_name) VALUES
('Medical Emergency'), ('Accident'), ('Fire'),
('Crime'), ('Blood Requirement'), ('Medicine Requirement');

INSERT INTO resources
(name,type_id,address,area,city,phone,latitude,longitude,is_24x7,availability_status,verified)
VALUES
('City Care Hospital',1,'Main Road, Pimpri','Pimpri','Pune','0201234567',18.6298,73.7997,1,'AVAILABLE',1),
('LifeLine Pharmacy',2,'Station Road, Chinchwad','Chinchwad','Pune','0201234568',18.6270,73.7800,1,'AVAILABLE',1),
('Pune Blood Bank',3,'Aundh Road','Aundh','Pune','0201234569',18.5600,73.8070,1,'AVAILABLE',1),
('Pimpri Police Station',4,'Old Mumbai-Pune Road','Pimpri','Pune','0201234570',18.6290,73.7990,1,'AVAILABLE',1),
('Central Fire Station',5,'Pimpri Camp','Pimpri','Pune','0201234571',18.6230,73.8120,1,'AVAILABLE',1),
('QuickAid Ambulance',6,'Pimpri','Pimpri','Pune','108',18.6280,73.8000,1,'AVAILABLE',1);

INSERT INTO resource_services(resource_id, category_id)
SELECT r.resource_id, c.category_id FROM resources r, emergency_categories c
WHERE r.type_id = 1 AND c.category_name IN ('Medical Emergency','Accident');

INSERT INTO resource_services(resource_id, category_id)
SELECT r.resource_id, c.category_id FROM resources r, emergency_categories c
WHERE r.type_id = 2 AND c.category_name = 'Medicine Requirement';

INSERT INTO resource_services(resource_id, category_id)
SELECT r.resource_id, c.category_id FROM resources r, emergency_categories c
WHERE r.type_id = 3 AND c.category_name = 'Blood Requirement';

INSERT INTO resource_services(resource_id, category_id)
SELECT r.resource_id, c.category_id FROM resources r, emergency_categories c
WHERE r.type_id = 4 AND c.category_name = 'Crime';

INSERT INTO resource_services(resource_id, category_id)
SELECT r.resource_id, c.category_id FROM resources r, emergency_categories c
WHERE r.type_id = 5 AND c.category_name = 'Fire';

INSERT INTO resource_services(resource_id, category_id)
SELECT r.resource_id, c.category_id FROM resources r, emergency_categories c
WHERE r.type_id = 6 AND c.category_name IN ('Medical Emergency','Accident');
