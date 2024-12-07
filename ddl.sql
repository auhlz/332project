DROP TABLE IF EXISTS student_record;
DROP TABLE IF EXISTS minor;
DROP TABLE IF EXISTS professor;
DROP TABLE IF EXISTS prof_degree;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS section;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS prereqCourse;

CREATE TABLE student_record (
    cwid VARCHAR(255),
    fname VARCHAR(255),
    lname VARCHAR(255),
    phone VARCHAR(255),
    addy VARCHAR(255),
    major_dno VARCHAR(255)
);

CREATE TABLE minor (
    cwid VARCHAR(255),
    dnum VARCHAR(255)
);

CREATE TABLE professor (
    ssn VARCHAR(255),
    prof_name VARCHAR(255),
    title VARCHAR(255),
    sex VARCHAR(255),
    salary VARCHAR(255),
    area_code VARCHAR(255),
    phone_num VARCHAR(255),
    street_addy VARCHAR(255),
    city VARCHAR(255),
    prof_state VARCHAR(255),
    zip VARCHAR(255)

);
CREATE TABLE prof_degree (
    Prof_ssn VARCHAR(255),
    degree VARCHAR(255)
);

CREATE TABLE course (
    cnum VARCHAR(255),
    title VARCHAR(255),
    textbook VARCHAR(255),
    units VARCHAR(255),
    dnum VARCHAR(255),
    preqCnum VARCHAR(255)
);

CREATE TABLE prereqCourse (
    cnum VARCHAR(255),
    prereq VARCHAR(255)
);

CREATE TABLE section (
    cnum VARCHAR(255),
    snum VARCHAR(255),
    classroom VARCHAR(255),
    meeting_days VARCHAR(255),
    num_of_seat VARCHAR(255),
    begin_time VARCHAR(255),
    end_time VARCHAR(255),
    prof_ssn VARCHAR(255)

);

CREATE TABLE enrollment (
    cnum VARCHAR(255),
    snum VARCHAR(255),
    cwid VARCHAR(255),
    grade VARCHAR(255)
);

CREATE TABLE department (
    dnum VARCHAR(255),
    dname VARCHAR(255),
    phone VARCHAR(255),
    office_location VARCHAR(255),
    chair_ssn VARCHAR(255)
);


--student tables-- 

--INSERT INTO student_record VALUES ('cwid','fname','lname','phone','addy','majordno');
INSERT INTO student_record VALUES ('1231','powder','nguyen','123-456-7890','123 Seasame Street, Unicorn Valley','2244');
INSERT INTO student_record VALUES ('1232','jinx','labitagin','234-567-8910','234 Seasame Street, Unicorn Valley','2244');
INSERT INTO student_record VALUES ('1233','vi','lim','345-678-9012','345 Seasame Street, Unicorn Valley','2244');
INSERT INTO student_record VALUES ('1234','caitlyn','pham','456-789-0123','456 Seasame Street, Unicorn Valley','2244');
INSERT INTO student_record VALUES ('1235','ekko','dang','567-890-1234','567 Seasame Street, Unicorn Valley','3366');
INSERT INTO student_record VALUES ('1236','jayce','tran','678-901-2345','678 Seasame Street, Unicorn Valley','3366');
INSERT INTO student_record VALUES ('1237','vander','smith','789-012-3456','789 Seasame Street, Unicorn Valley','3366');
INSERT INTO student_record VALUES ('1238','isha','washington','012-345-6789','890 Seasame Street, Unicorn Valley','3366');

--department tables--

--INSERT INTO department VALUES ('dnum','dname','phone','location','chairssn');
INSERT INTO department VALUES ('2244','compsci','951-123-4567','ecs','2341');
INSERT INTO department VALUES ('3366','math','401-103-0203','mccarthy','2342');

--professor tables--
--INSERT INTO professor VALUES ('ssn', 'prof_name', 'title', 'sex', 'salary', 'area_code', 'phone_num', 'street_addy', 'city', 'prof_state', 'zip' )
INSERT INTO professor VALUES ('2341','Heimerdinger','Dr','male','100k','951','800-567-9832','123 Mimi Way','Fullerton','CA','92913');
INSERT INTO professor VALUES ('2342','Cheawon','Dr','female','120k','123','124','124 Lala Land', 'Happy City','CA','92640');
INSERT INTO professor VALUES ('2343','Hanni','Dr','female','300k','951','125','125 Disney Land', 'Temecula','CA','92592');

--course tables--
--INSERT INTO course VALUES ('cnum','title','textbook','unit','dnum','preqcnum');

INSERT INTO course VALUES ('332','database','database textbook','3','2244','none');
INSERT INTO course VALUES ('335','algo','algo textbook','3','2244','none');
INSERT INTO course VALUES ('338','stats','stats textbook','4','3366','none');
INSERT INTO course VALUES ('150','calc','calc textbook','4','3366','none');


--sections--
--INSERT INTO section VALUES ('cnum','snum','classroom','meeting days','seats','begintime','endtime','prof');
INSERT INTO section VALUES ('332','1','39','Sunday','30','10am','12pm','2341');
INSERT INTO section VALUES ('335','2','40','Monday','35','10am','12pm','2341');
INSERT INTO section VALUES ('338','3','41','Tuesday','35','10am','12pm','2341');
INSERT INTO section VALUES ('150','4','42','Wednesday','35','10am','12pm','2342');
INSERT INTO section VALUES ('332','5','43','Thursday','35','10am','12pm','2342');
INSERT INTO section VALUES ('150','6','44','Friday','30','10am','12pm','2343');

--enrollment record--

--INSERT INTO enrollment VALUES ('cnum','snum','cwid','grade');
INSERT INTO enrollment VALUES ('332','1','1231','A');
INSERT INTO enrollment VALUES ('332','1','1232','A');
INSERT INTO enrollment VALUES ('332','1','1234','A');
INSERT INTO enrollment VALUES ('332','1','1233','C-');
INSERT INTO enrollment VALUES ('332','1','1235','C+');

INSERT INTO enrollment VALUES ('335','2','1231','A');
INSERT INTO enrollment VALUES ('335','2','1232','A');
INSERT INTO enrollment VALUES ('335','2','1236','A+');
INSERT INTO enrollment VALUES ('335','2','1237','B-');
INSERT INTO enrollment VALUES ('335','2','1238','B');

INSERT INTO enrollment VALUES ('338','3','1231','C');
INSERT INTO enrollment VALUES ('338','3','1232','C');
INSERT INTO enrollment VALUES ('338','3','1233','D');
INSERT INTO enrollment VALUES ('338','3','1234','D');
INSERT INTO enrollment VALUES ('338','3','1235','A+');

INSERT INTO enrollment VALUES ('332','5','1237','A');
INSERT INTO enrollment VALUES ('332','5','1238','A');
INSERT INTO enrollment VALUES ('150','6','1237','B');
INSERT INTO enrollment VALUES ('150','6','1238','B-');
INSERT INTO enrollment VALUES ('150','6','1232','B-');

--test for query a of student--

SELECT section.cnum, section.classroom, section.meeting_days, section.begin_time, section.end_time, COUNT(*) AS student_count FROM section, enrollment WHERE section.cnum = '9999' AND enrollment.snum = section.snum GROUP BY section.cnum, section.classroom, section.meeting_days, section.begin_time, section.end_time;
--test for query b of student--

SELECT course.title, enrollment.grade FROM student_record, course, enrollment WHERE student_record.cwid = '1' and student_record.cwid = enrollment.cwid and enrollment.cnum = course.cnum;

--test query for a of prof--

SELECT course.title, section.classroom, section.meeting_days, section.begin_time, section.end_time FROM course, section WHERE section.prof_ssn = '2341' and section.cnum=course.cnum;

--test query for b of prof--
SELECT enrollment.grade, COUNT(*) as studnets
FROM enrollment
WHERE enrollment.cnum = '332' AND enrollment.snum = '1'
GROUP BY enrollment.grade;