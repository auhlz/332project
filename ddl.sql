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
INSERT INTO student_record VALUES ('1231','powder','lname','phone','addy','majordno');
INSERT INTO student_record VALUES ('1232','jinx','lname','phone','addy','majordno');
INSERT INTO student_record VALUES ('1233','vi','lname','phone','addy','majordno');
INSERT INTO student_record VALUES ('1234','caitlyn','lname','phone','addy','majordno');
INSERT INTO student_record VALUES ('1235','ekko','lname','phone','addy','majordno');
INSERT INTO student_record VALUES ('1236','jayce','lname','phone','addy','majordno');
INSERT INTO student_record VALUES ('1237','vander','lname','phone','addy','majordno');
INSERT INTO student_record VALUES ('1238','isha','lname','phone','addy','majordno');

--department tables--

--INSERT INTO department VALUES ('dnum','dname','phone','location','chairssn');
INSERT INTO department VALUES ('2244','compsci','951','ecs','2341');
INSERT INTO department VALUES ('3366','math','401','mccarthy','2342');

--professor tables--
INSERT INTO professor VALUES ('2341','heimerdinger','dr','male','100k','951','123','123 way','fullerton','ca','92592');
INSERT INTO professor VALUES ('2342','cheawon','dr','female','100k','951','124','124 way','fullerton','ca','92592');
INSERT INTO professor VALUES ('2343','hanni','dr','female','100k','951','125','125 way','fullerton','ca','92592');

--course tables--
--INSERT INTO course VALUES ('cnum','title','textbook','unit','dnum','preqcnum');

INSERT INTO course VALUES ('9999','database','database textbook','3','2244','none');
INSERT INTO course VALUES ('9998','algo','algo textbook','3','2244','none');
INSERT INTO course VALUES ('9997','stats','stats textbook','4','3366','none');
INSERT INTO course VALUES ('9996','calc','calc textbook','4','3366','none');


--sections--
--INSERT INTO section VALUES ('cnum','snum','classroom','meeting days','seats','begintime','endtime','prof');
INSERT INTO section VALUES ('9999','3','39','sunday','30','10am','12pm','2341');
INSERT INTO section VALUES ('9999','1','40','monday','35','10am','12pm','2341');
INSERT INTO section VALUES ('9999','2','41','tuesday','35','10am','12pm','2341');
INSERT INTO section VALUES ('9998','1','42','wednesday','35','10am','12pm','2342');
INSERT INTO section VALUES ('9997','1','43','thursday','35','10am','12pm','2342');
INSERT INTO section VALUES ('9996','1','44','friday','30','10am','12pm','2343');

--enrollment record--

--INSERT INTO enrollment VALUES ('cnum','snum','cwid','grade');
INSERT INTO enrollment VALUES ('9999','3','1231','a');
INSERT INTO enrollment VALUES ('9998','1','1232','b');


--test for query b of student--

SELECT course.title, enrollment.grade FROM student_record, course, enrollment WHERE student_record.cwid = '1' and student_record.cwid = enrollment.cwid and enrollment.cnum = course.cnum;

--test query for a of prof--

SELECT course.title, section.classroom, section.meeting_days, section.begin_time, section.end_time FROM course, section WHERE section.prof_ssn = '2341' and section.cnum=course.cnum;
