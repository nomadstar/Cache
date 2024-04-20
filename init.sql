CREATE TABLE content (
  id INT,
  title VARCHAR(255) NOT NULL,
  rank INT,
  date DATE,
  artist VARCHAR(255),
  url VARCHAR(255),
  region VARCHAR(255),
  chart VARCHAR(255) NOT NULL,
  trend VARCHAR(255) NOT NULL,
  streams INT
  );