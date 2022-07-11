use Handson
--problem 1
select policy_type_id,policy_type_name,a.policy_type_code,description from policy_sub_types a inner join  ref_policy_types b on
a.policy_type_code=b.policy_type_code where policy_type_name='car'
--problem 2
select policy_type_code,count(policy_type_code) no_of_policies
from policy_sub_types
group by policy_type_code
--problem 3
SELECT ud.user_id, ud.firstname, ud.lastname, ud.email, ud.mobileno
FROM user_details ud  JOIN address_details ad  ON ud.address_id=ad.address_id WHERE ad.city='chennai'
GROUP BY ud.user_id

--problem 4
Select U.user_id 'USERID',U.firstname+''+U.lastname 'USER_NAME',U.email 'EMAIL',U.mobileno 'MOBILE NO' from user_details U join user_policies UP on U.user_id = UP.user_id 
join policy_sub_types UPS on UPS.policy_type_id = UP.policy_type_id where UPS.description='Car'

--problem5
SELECT USER_ID,FIRSTNAME,LASTNAME from USER_DETAILS WHERE USER_ID in (SELECT USER_ID FROM USER_POLICIES where
POLICY_TYPE_ID in (SELECT POLICY_TYPE_ID FROM POLICY_SUB_TYPES WHERE POLICY_TYPE_CODE= 
(SELECT POLICY_TYPE_CODE FROM REF_POLICY_TYPES WHERE POLICY_TYPE_NAME='CAR')) AND USER_ID NOT in
(SELECT USER_ID FROM USER_POLICIES where POLICY_TYPE_ID in (SELECT POLICY_TYPE_ID FROM POLICY_SUB_TYPES
WHERE POLICY_TYPE_CODE= (SELECT POLICY_TYPE_CODE FROM REF_POLICY_TYPES
WHERE POLICY_TYPE_NAME='HOME')))) 
--problem 6
--problem7
select ud.user_id,firstname,lastname,ad.city,ad.state from user_details ud join address_details ad on
ud.address_id=ad.address_id where ad.city like '%bad';
--problem 8
select up.user_id,firstname,lastname,policy_no, date_registered
from user_policies up join user_details ud on up.user_id=ud.user_id
where up.date_registered < '2012-05-01'
--problem 9
select ud.user_id,ud.firstname,ud.lastname from user_details ud join user_policies up on ud.user_id=up.user_id
group by ud.user_id having count(up.policy_type_id)>1
--problem 10

--problem 11
Select PS.policy_type_code 'PolicyCode',RP.policy_type_name'PolicyTypeName',PS.policy_type_id'PolicyTypeName ' 
from ref_policy_types RP  join policy_sub_types PS on RP.policy_type_code = PS.policy_type_code where
PS.maturityamount >= PS.amount*2
--problem 12
Select U.user_id 'UserId',SUM(isnull(PP.amount,0)) 'total_amount' from user_details U 
Left outer join policy_payments PP on U.user_id = PP.user_id group by U.user_id
--problem 13
Select U.user_id 'UserId', PP.policy_no'PolicyNo' ,SUM(isnull(PP.amount,0)) 'total_amount' from user_details U Left outer join 
policy_payments PP on U.user_id = PP.user_id group by U.user_id,PP.policy_no
--problem 14
select * from policy_sub_types
