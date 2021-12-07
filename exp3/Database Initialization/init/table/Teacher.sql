USE EducationDB;

SET NAMES "utf8mb4";

CREATE TABLE Teacher (
    Tno BIGINT AUTO_INCREMENT PRIMARY KEY,
    Tname VARCHAR(32) NOT NULL,
    Tgender VARCHAR(8) NOT NULL,
    Dno BIGINT NOT NULL,
    CHECK (Tgender = "男" OR Tgender = "女" OR Tgender = "其他"),
    FOREIGN KEY (Dno) REFERENCES Department(Dno)
);
