/*
실습02 - 기본적인 데이터 조회 (2)
*/

-- 데이터베이스 연결
USE MyShop2019;


-- Q18) '강릉' 또는 '원주' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
select customer_name, customer_id, gender, city, phone, point
		from customer
        where city = '강릉' or '원주';
    

-- Q19) 포인트가 400,000 이상, 500,000 이하인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
select customer_name, customer_id, gender, city, phone, point
		from customer
        where point between '400000' and '500000';


-- Q20) 1990년에 출생한 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
--      단, CASE 문을 사용해 성별은 '남자', '여자'로 표시되게 하세요.
select customer_name, customer_id, 
		case when gender = 'm' then '남자'
			 when gender = 'f' then '여자'
             else '' end as korean
             , city, phone, birth_date,point
		from customer
        where year(birth_date) = '1990' ;


-- Q21) 1990년에 출생한 여자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
select customer_name, customer_id, gender, city, phone, birth_date,point
		from customer
        where year(birth_date) = '1990' and gender = 'f';


-- Q22) 1990년에 출생한 '대구' 또는 '경주' 지역 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요. #모름
select *
		from customer
        where (birth_date between'1990.01.01' and '1990.12.31')
        and (gender = 'm')
        and city in('대구','경주');
	  



-- Q23) 1990년에 출생한 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
--      단, 홍길동(gildong) 형태로 이름과 아이디를 묶어서 조회하세요.
 select concat(customer_name,'(',customer_id,')') as customer_name, gender, city, phone, birth_date,point
		from customer
        where year(birth_date) = '1990' and gender = 'm';

-- Q24) 근무중인 직원의 이름, 사원번호, 성별, 전화번호, 입사일를 조회하세요.
select employee_name, employee_id, gender, phone, hire_date
		from employee;
		
 
 
-- Q25) 근무중인 남자 직원의 이름, 사원번호, 성별, 전화번호, 입사일를 조회하세요.
 select employee_name, employee_id, gender, phone, hire_date
		from employee
        where gender = 'm';


-- Q26) 퇴사한 직원의 이름, 사원번호, 성별, 전화번호, 입사일, 퇴사일를 조회하세요.
 select employee_name, employee_id, gender, phone, hire_date
		from employee
        where retire_date;
 

-- Q27) 다음과 같이 조건에 따른 고객 등급이 표시되게 조회하세요.
--      단, 포인트가 0이거나 NULL이면 고객 등급이 NULL이 되게 하세요.#모르겟
/*
1,000,000 이상 --> 'Platinum'
  600,000 이상 --> 'Gold'
  300,000 이상 --> 'Silver'
  100,000 이상 --> 'Bronze'
        0 초과 --> 'Family'
*/
select customer_name, customer_id, gender, city, register_date, point, 
	case when point >= 1000000 then 'platinum'
		 when point >= 600000 then 'gold'
         when point >= 300000 then 'silver'
         when point >= 100000 then 'bronze'
         when point >= 0 then'family'
         else null end level
		from customer;

    
 
-- Q28) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 고객아이디를 기준으로 오름차순 정렬해서 조회하세요.
 select order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due
		from order_header
        where order_date between '2019.01.01 00:00:00' and '2019.01.07 23:59:59'
        order by customer_id asc;
    
    
-- Q29) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 전체금액을 기준으로 내림차순 정렬해서 조회하세요.
select order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due
		from order_header
        where order_date between '2019.01.01 00:00:00' and '2019.01.07 23:59:59'
        order by total_due desc;


-- Q30) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 사원번호를 기준으로 오름차순, 같은 사원번호는 주문일시를 기준으로 내림차순 정렬해서 조회하세요.
select order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due
		from order_header
        where order_date between '2019.01.01 00:00:00' and '2019.01.07 23:59:59'
        order by employee_id asc , order_date desc;

#customer_name like '% %' : 이름의 공백이 들어간 행 / customer_name like ' %' : 두 번째 글짜가 공백이 들어간 행 
#replace 함수 사용
###
