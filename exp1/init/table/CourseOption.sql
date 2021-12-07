USE EducationDB;

CREATE TABLE CourseOption (
    COid BIGINT AUTO_INCREMENT PRIMARY KEY,
    Sno BIGINT NOT NULL,
    Cno BIGINT NOT NULL,
    COgrade NUMERIC(5,2), -- 课程学分，总学分是这个值和课程学分的加权平均
    COyear SMALLINT NOT NULL, -- 选课年份
    UNIQUE INDEX(Sno, Cno, COyear),
    FOREIGN KEY (Sno) REFERENCES Student(Sno),
    FOREIGN KEY (Cno) REFERENCES Course(Cno)
);
