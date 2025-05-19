-- this is the first comment
/* this is the second comment*/
alter session set current_schema=HR;
SELECT * FROM HR.employees;


--How much does Amit Banda earn?
SELECT first_name, LAST_NAME, SALARY FROM employees
where FIRST_NAME = 'Amit' and last_name = 'Banda';

-- find out city
select * from locations
where city = 'Tokyo';

-- the difference of the maximum and minimum salary for the president of company
select job_title, MAX_SALARY, MIN_SALARY, MAX_SALARY - MIN_SALARY AS "DIFF" from jobs
where job_title = 'President';

/*
Using SH database show:
How many promotion categories are there.
*/

alter session set current_schema=SH;
select count(distinct(promo_category)) as "Number of Category" from SH.promotions;

--using SI database
alter session set current_schema=SI;
select * from SI.car;

SELECT custname
FROM si.car
WHERE UPPER(carmake) = 'JAGUAR'
AND caryear = '2016'
AND custname IS NOT NULL;

/*
SELECT *
FROM si.car
WHERE custname = 'CATY';
*/
set SERVEROUTPUT ON  --show console
DECLARE
    V_name varchar2(10);
BEGIN
    v_name := 'Megha';
    dbms_output.put_line('Your name is : ' || v_name);
END;


