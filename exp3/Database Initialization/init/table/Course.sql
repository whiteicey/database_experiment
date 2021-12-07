USE EducationDB;

CREATE TABLE Course (
    Cno BIGINT AUTO_INCREMENT PRIMARY KEY,
    Cname VARCHAR(32) NOT NULL, -- 不同系可能开设相同名称的课程，因此不设UNIQUE
    Ctime SMALLINT NOT NULL, -- 虽然不常见，但我们应当允许学院设置学时大于127的课程
    Ccredit NUMERIC(4,2) NOT NULL
    -- 不设开课系别的字段：不同系有的课可能一起上！
);
