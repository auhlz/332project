DROP TABLE IF EXISTS student_record;
DROP TABLE IF EXISTS minor;
DROP TABLE IF EXISTS professor;
DROP TABLE IF EXISTS prof_degree;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS section;
DROP TABLE IF EXISTS enrollment;
DROP TABLE IF EXISTS department;

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
    degree VARCHAR(255),
);

CREATE TABLE course (
    cnum VARCHAR(255),
    title VARCHAR(255),
    textbook VARCHAR(255),
    units VARCHAR(255),
    dnum VARCHAR(255),
    preqCnum VARCHAR(255)
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

--test for query b of student--
INSERT INTO student_record VALUES ('1','9','9','9','9','9');

INSERT INTO course VALUES ('1','database','3','4','5','6');
INSERT INTO course VALUES ('2','algo','3','4','5','6');


INSERT INTO enrollment VALUES ('1','9','1','a');
INSERT INTO enrollment VALUES ('2','9','1','b');

SELECT course.title, enrollment.grade FROM student_record, course, enrollment WHERE student_record.cwid = '1' and student_record.cwid = enrollment.cwid and enrollment.cnum = course.cnum;








--random student test--

INSERT INTO student_record VALUES ('1','2','3','4','5','6');

INSERT INTO department VALUES ('1','compsci','3','3','3');
INSERT INTO department VALUES ('2','dog','3','3','3');

INSERT INTO minor VALUES ('1','1');
INSERT INTO minor VALUES ('1','2');

SELECT dname FROM department, minor, student_record WHERE student_record.cwid = '$input' AND student_record.cwid = minor.cwid AND department.dnum = minor.dnum