USE EducationDB;

SET NAMES "utf8mb4";

CREATE TABLE Student (
    Sno BIGINT AUTO_INCREMENT PRIMARY KEY,
    Sname VARCHAR(32) NOT NULL,
    Sgender VARCHAR(8) NOT NULL,
    Sbirth DATE NOT NULL,
    Dno BIGINT NOT NULL,
    CHECK (Sgender = "男" OR Sgender = "女" OR Sgender = "其他"),
    FOREIGN KEY (Dno) REFERENCES Department(Dno)
);
