-- Schema for moviedb

DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Likes;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Series;
DROP TABLE IF EXISTS Award;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS MotionPicture;


CREATE TABLE MotionPicture(
    id INT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    rating FLOAT CHECK(rating >= 0 AND rating <= 10),
    production VARCHAR(255),
    budget INT CHECK(budget > 0),
    PRIMARY KEY(id)
);


CREATE TABLE Users(
    email VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    age INT CHECK(age > 0),
    PRIMARY KEY(email)
);


CREATE TABLE Likes(
    mpid INT NOT NULL,
    uemail VARCHAR(255),
    PRIMARY KEY(mpid, uemail),
    FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE,
    FOREIGN KEY(uemail) REFERENCES Users(email) ON DELETE CASCADE
);


CREATE TABLE Movie(
    mpid INT NOT NULL,
    boxoffice_collection INT CHECK(boxoffice_collection >= 0),
    PRIMARY KEY(mpid),
    FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);


CREATE TABLE Series(
    mpid INT NOT NULL,
    season_count INT CHECK(season_count >= 1),
    PRIMARY KEY(mpid),
    FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);


CREATE TABLE People(
    id INT NOT NULL,
    NAME VARCHAR(255) NOT NULL, 
    nationality VARCHAR(255),
    dob DATE,
    gender VARCHAR(255),
    PRIMARY KEY(id)
);


CREATE TABLE Role(
    mpid INT NOT NULL,
    pid INT NOT NULL,
    role_name VARCHAR(255),
    PRIMARY KEY(mpid, pid, role_name),
    FOREIGN KEY(pid) REFERENCES People(id) ON DELETE CASCADE,
    FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);


CREATE TABLE Award(
    mpid INT NOT NULL,
    pid INT NOT NULL,
    award_name VARCHAR(255) NOT NULL,
    award_year INT NOT NULL,
    PRIMARY KEY(mpid,pid,award_name,award_year),
    FOREIGN KEY(pid) REFERENCES People(id) ON DELETE CASCADE,
    FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE

);


CREATE TABLE Genre(
    mpid INT NOT NULL,
    genre_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(mpid, genre_name),
    FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
    
);

CREATE TABLE Location(
    mpid INT NOT NULL,
    zip INT NOT NULL,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    PRIMARY KEY(mpid,zip),
    FOREIGN KEY(mpid) REFERENCES MotionPicture(id) ON DELETE CASCADE
);





