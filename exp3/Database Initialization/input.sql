-- 本脚本用于灌入测试数据。
USE EducationDB;

-- 指定UTF-8连接
SET NAMES 'utf8mb4';

-- 注意：主键给的值其实没有影响！全部给0的话一样会从1开始赋自增主键
-- 这里从1开始写，只是为了方便人类阅读

-- 设置3个系
INSERT INTO Department VALUES (1, "信息安全");
INSERT INTO Department VALUES (2, "计算机科技");
INSERT INTO Department VALUES (3, "数字媒体");

---- 学生
-- 植物组
INSERT INTO Student VALUES (1, "廖绸", "女", "1999-7-7", 1); -- 疗愁是一种草
INSERT INTO Student VALUES (2, "余客", "男", "1999-10-10", 1); -- 就是芍药
INSERT INTO Student VALUES (3, "洪眄", "女", "2000-6-5", 1); -- 就是红棉，红色高棉（划掉）其实是木棉的意思
INSERT INTO Student VALUES (4, "谢报华", "男", "2000-5-12", 1); -- 谢豹花，即杜鹃花
INSERT INTO Student VALUES (5, "路玖", "女", "2001-6-20", 1); -- 鹿韭，即牡丹
INSERT INTO Student VALUES (6, "龚廉", "男", "1999-4-5", 1); -- 宫莲，就是莲花瓣
-- 数学组
INSERT INTO Student VALUES (7, "李群", "女", "2000-1-17", 2); -- 群论概念
INSERT INTO Student VALUES (8, "范涵", "男", "1999-4-7", 2); -- 泛函
INSERT INTO Student VALUES (9, "李想", "男", "2000-3-2", 2); -- 数学中的理想是近世代数的一个概念
INSERT INTO Student VALUES (10, "杜珪", "男", "2001-8-14", 2); -- 度规
-- 文学历史组
INSERT INTO Student VALUES (11, "文祺", "女", "2000-8-11", 3); -- 书信用语
INSERT INTO Student VALUES (12, "兰吟", "女", "1999-11-7", 3); -- 兰因，指因果
INSERT INTO Student VALUES (13, "白祝武", "男", "2000-12-26", 3); -- 白纻，用一种植物织造的夏布。吴国有白纻舞
INSERT INTO Student VALUES (14, "解句琛", "女", "2000-6-14", 3); -- 取自汉学著作《古经解勾陈》
INSERT INTO Student VALUES (15, "简蝶", "女", "2001-6-4", 3); -- 鹣鲽，喻夫妻和谐

-- 教师
INSERT INTO Teacher VALUES (1, "牛黄", "女", 1);
INSERT INTO Teacher VALUES (2, "丁香", "女", 1);
INSERT INTO Teacher VALUES (3, "毛姜", "男", 1); -- 药名组
INSERT INTO Teacher VALUES (4, "李正科", "男", 2);
INSERT INTO Teacher VALUES (5, "龚韶", "女", 2);
INSERT INTO Teacher VALUES (6, "林小斯", "男", 2); -- 魔改组
INSERT INTO Teacher VALUES (7, "华胥", "女", 3);
INSERT INTO Teacher VALUES (8, "林夕", "男", 3);
INSERT INTO Teacher VALUES (9, "黄粱", "女", 3); -- 梦组

-- 课程
INSERT INTO Course VALUES (1, "计算机基础", 32, 3.0);
INSERT INTO Course VALUES (2, "C++语言", 64, 4.0); -- 信安和计科C++
INSERT INTO Course VALUES (3, "C++语言", 64, 3.0); -- 数媒C++
INSERT INTO Course VALUES (4, "逆向工程", 64, 1.5);
INSERT INTO Course VALUES (5, "密码学", 32, 2.0);
INSERT INTO Course VALUES (6, "操作系统", 32, 2.5);
INSERT INTO Course VALUES (7, "计算机组成原理", 32, 2.0);
INSERT INTO Course VALUES (8, "数据结构", 64, 2.5);
INSERT INTO Course VALUES (9, "数据库原理", 32, 2.5);
INSERT INTO Course VALUES (10, "SpringBoot及其应用", 32, 1.0);
INSERT INTO Course VALUES (11, "计算机视觉基础 ", 32, 1.0);

-- 开课安排
INSERT INTO TeachingArrangement VALUES (1, 3, 1);
INSERT INTO TeachingArrangement VALUES (2, 4, 1);
INSERT INTO TeachingArrangement VALUES (3, 7, 1);
INSERT INTO TeachingArrangement VALUES (4, 5, 2);
INSERT INTO TeachingArrangement VALUES (5, 7, 3);
INSERT INTO TeachingArrangement VALUES (6, 2, 4);
INSERT INTO TeachingArrangement VALUES (7, 2, 5);
INSERT INTO TeachingArrangement VALUES (8, 5, 6);
INSERT INTO TeachingArrangement VALUES (9, 8, 6);
INSERT INTO TeachingArrangement VALUES (10, 6, 7);
INSERT INTO TeachingArrangement VALUES (11, 9, 7);
INSERT INTO TeachingArrangement VALUES (12, 1, 8);
INSERT INTO TeachingArrangement VALUES (13, 4, 8);
INSERT INTO TeachingArrangement VALUES (14, 9, 8);
INSERT INTO TeachingArrangement VALUES (15, 1, 9);
INSERT INTO TeachingArrangement VALUES (16, 6, 9);
INSERT INTO TeachingArrangement VALUES (17, 3, 10);
INSERT INTO TeachingArrangement VALUES (18, 5, 11);

-- 选课
INSERT INTO CourseOption VALUES (1, 1, 1, 96.5, 2017);
INSERT INTO CourseOption VALUES (2, 1, 2, 87.6, 2017);
INSERT INTO CourseOption VALUES (3, 1, 4, 87.1, 2017);
INSERT INTO CourseOption VALUES (4, 1, 5, 90.0, 2018);
INSERT INTO CourseOption VALUES (5, 1, 6, 88.7, 2018);
INSERT INTO CourseOption VALUES (6, 1, 7, 82.3, 2018);
INSERT INTO CourseOption VALUES (7, 1, 8, 88.6, 2019);
INSERT INTO CourseOption VALUES (8, 1, 9, 82.1, 2019);
INSERT INTO CourseOption VALUES (9, 2, 1, 95.2, 2018);
INSERT INTO CourseOption VALUES (10, 2, 2, 100.0, 2018);
INSERT INTO CourseOption VALUES (11, 2, 4, 66.6, 2018);
INSERT INTO CourseOption VALUES (12, 2, 6, 92.1, 2019);
INSERT INTO CourseOption VALUES (13, 2, 7, 82.6, 2019);
INSERT INTO CourseOption VALUES (14, 2, 8, 92.3, 2019);
INSERT INTO CourseOption VALUES (15, 2, 9, 81.2, 2020);
INSERT INTO CourseOption VALUES (16, 2, 10, 77.1, 2020);
INSERT INTO CourseOption VALUES (17, 3, 1, 89.2, 2018);
INSERT INTO CourseOption VALUES (18, 3, 3, 96.7, 2018);
INSERT INTO CourseOption VALUES (19, 3, 6, 87.2, 2019);
INSERT INTO CourseOption VALUES (20, 3, 7, 79.8, 2019);
INSERT INTO CourseOption VALUES (21, 3, 8, 92.3, 2020);
INSERT INTO CourseOption VALUES (22, 3, 9, 88.7, 2020);
INSERT INTO CourseOption VALUES (23, 3, 11, 58.7, 2020);
INSERT INTO CourseOption VALUES (24, 4, 1, 89.2, 2018);
INSERT INTO CourseOption VALUES (25, 4, 2, 69.8, 2018);
INSERT INTO CourseOption VALUES (26, 4, 6, NULL, 2021);
INSERT INTO CourseOption VALUES (27, 4, 7, NULL, 2021);
INSERT INTO CourseOption VALUES (28, 4, 8, NULL, 2021);
INSERT INTO CourseOption VALUES (29, 4, 9, 77.6, 2019);
INSERT INTO CourseOption VALUES (30, 5, 1, 60.1, 2019);
INSERT INTO CourseOption VALUES (31, 5, 2, 33.2, 2019);
INSERT INTO CourseOption VALUES (32, 5, 3, NULL, 2021); -- 挂科重修了，而且选了不同老师（
INSERT INTO CourseOption VALUES (33, 5, 7, NULL, 2021);
INSERT INTO CourseOption VALUES (34, 5, 8, NULL, 2021);
INSERT INTO CourseOption VALUES (35, 6, 1, 97.2, 2017);
INSERT INTO CourseOption VALUES (36, 6, 3, 77.3, 2017);
INSERT INTO CourseOption VALUES (37, 6, 6, 87.2, 2018);
INSERT INTO CourseOption VALUES (38, 6, 7, 80.2, 2018);
INSERT INTO CourseOption VALUES (39, 6, 7, 86.7, 2019);
INSERT INTO CourseOption VALUES (40, 6, 8, 88.2, 2019);
INSERT INTO CourseOption VALUES (41, 6, 11, NULL, 2021);
INSERT INTO CourseOption VALUES (42, 7, 1, 89.2, 2019);
INSERT INTO CourseOption VALUES (43, 7, 2, 99.7, 2019);
INSERT INTO CourseOption VALUES (44, 7, 6, 87.2, 2020);
INSERT INTO CourseOption VALUES (45, 7, 7, 92.5, 2020);
INSERT INTO CourseOption VALUES (46, 7, 8, 91.2, 2021);
INSERT INTO CourseOption VALUES (47, 7, 9, NULL, 2021);
INSERT INTO CourseOption VALUES (48, 7, 10, NULL, 2021);
INSERT INTO CourseOption VALUES (49, 8, 1, 99.2, 2017);
INSERT INTO CourseOption VALUES (50, 8, 3, 98.7, 2017);
INSERT INTO CourseOption VALUES (51, 8, 3, 100.0, 2018);
INSERT INTO CourseOption VALUES (52, 8, 4, 87.2, 2018);
INSERT INTO CourseOption VALUES (53, 8, 5, 86.7, 2019);
INSERT INTO CourseOption VALUES (54, 8, 6, 90.2, 2019);
INSERT INTO CourseOption VALUES (55, 8, 7, 88.7, 2019);
INSERT INTO CourseOption VALUES (56, 8, 8, 92.4, 2020);
INSERT INTO CourseOption VALUES (57, 8, 9, 77.8, 2020);
INSERT INTO CourseOption VALUES (58, 9, 1, 92.1, 2018);
INSERT INTO CourseOption VALUES (59, 9, 3, 93.4, 2018);
INSERT INTO CourseOption VALUES (60, 9, 6, 87.2, 2019);
INSERT INTO CourseOption VALUES (61, 9, 7, 88.2, 2019);
INSERT INTO CourseOption VALUES (62, 9, 8, 83.2, 2020);
INSERT INTO CourseOption VALUES (63, 9, 9, 96.3, 2020);
INSERT INTO CourseOption VALUES (64, 10, 1, 95.2, 2019);
INSERT INTO CourseOption VALUES (65, 10, 2, 100.0, 2019);
INSERT INTO CourseOption VALUES (66, 10, 4, NULL, 2021);
INSERT INTO CourseOption VALUES (67, 10, 6, 67.2, 2019);
INSERT INTO CourseOption VALUES (68, 10, 6, 87.7, 2020);
INSERT INTO CourseOption VALUES (69, 10, 7, 90.2, 2020);
INSERT INTO CourseOption VALUES (70, 10, 8, 46.2, 2020);
INSERT INTO CourseOption VALUES (71, 10, 8, NULL, 2021);
INSERT INTO CourseOption VALUES (72, 10, 9, 88.2, 2021);
INSERT INTO CourseOption VALUES (73, 11, 1, 100.0, 2018);
INSERT INTO CourseOption VALUES (74, 11, 3, 100.0, 2018);
INSERT INTO CourseOption VALUES (75, 11, 6, 89.2, 2019);
INSERT INTO CourseOption VALUES (76, 11, 7, 93.2, 2019);
INSERT INTO CourseOption VALUES (77, 11, 8, 93.2, 2020);
INSERT INTO CourseOption VALUES (78, 11, 9, 87.6, 2021);
INSERT INTO CourseOption VALUES (79, 11, 10, 77.6, 2020);
INSERT INTO CourseOption VALUES (80, 11, 11, 91.4, 2021);
INSERT INTO CourseOption VALUES (81, 11, 10, NULL, 2021);
INSERT INTO CourseOption VALUES (82, 12, 1, 93.2, 2018);
INSERT INTO CourseOption VALUES (83, 12, 3, 87.6, 2018);
INSERT INTO CourseOption VALUES (84, 12, 6, 77.6, 2019);
INSERT INTO CourseOption VALUES (85, 12, 7, 80.2, 2020);
INSERT INTO CourseOption VALUES (86, 12, 8, NULL, 2021);
INSERT INTO CourseOption VALUES (87, 12, 9, NULL, 2021);
INSERT INTO CourseOption VALUES (88, 13, 1, 99.7, 2019);
INSERT INTO CourseOption VALUES (89, 13, 3, 89.9, 2019);
INSERT INTO CourseOption VALUES (90, 13, 4, NULL, 2021);
INSERT INTO CourseOption VALUES (91, 13, 6, NULL, 2021);
INSERT INTO CourseOption VALUES (92, 13, 7, 87.2, 2020);
INSERT INTO CourseOption VALUES (93, 13, 8, 90.1, 2020);
INSERT INTO CourseOption VALUES (94, 13, 9, 88.7, 2019);
INSERT INTO CourseOption VALUES (95, 13, 11, 89.2, 2019);
INSERT INTO CourseOption VALUES (96, 14, 1, 94.5, 2018);
INSERT INTO CourseOption VALUES (97, 14, 3, 100.0, 2018);
INSERT INTO CourseOption VALUES (98, 14, 6, 88.6, 2019);
INSERT INTO CourseOption VALUES (99, 14, 7, 89.2, 2019);
INSERT INTO CourseOption VALUES (100, 14, 8, 87.6, 2020);
INSERT INTO CourseOption VALUES (101, 14, 9, 84.4, 2020);
INSERT INTO CourseOption VALUES (102, 14, 11, NULL, 2021);
INSERT INTO CourseOption VALUES (103, 15, 1, 87.6, 2019);
INSERT INTO CourseOption VALUES (104, 15, 2, 92.3, 2019);
INSERT INTO CourseOption VALUES (105, 15, 5, 92.1, 2020);
INSERT INTO CourseOption VALUES (106, 15, 6, 88.7, 2020);
INSERT INTO CourseOption VALUES (107, 15, 7, 89.2, 2020);
INSERT INTO CourseOption VALUES (108, 15, 8, 66.2, 2019);
INSERT INTO CourseOption VALUES (109, 15, 8, NULL, 2021);
INSERT INTO CourseOption VALUES (110, 15, 9, NULL, 2021);
INSERT INTO CourseOption VALUES (111, 15, 10, NULL, 2021);
