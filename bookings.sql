create view successful_bookings as
select * 
from bookings
where booking_status='success';
select * from successful_bookings;

create view ride_distance_for_each_vehicle as
select avg(ride_distance), vehicle_type
from bookings
group by vehicle_type;
select * from ride_distance_for_each_vehicle;

create view canceled_rides_by_customers as
select count(*)
from bookings
where booking_status='canceled by customer';
select * from canceled_rides_by_customers;

create view top_5_customers as
select customer_id,count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5;
select * from top_5_customers;

create view rides_canceled_by_drivers_p_c_issues as
select count(*)
from bookings
where canceled_rides_by_driver='personal & car related issue';
select * from rides_canceled_by_drivers_p_c_issues;

create view max_min_driver_rating as
select max(driver_ratings) as max_rating, min(driver_ratings) as min_rating 
from bookings
where vehicle_type='prime sedan';
select * from max_min_driver_rating; 

create view upi_payment as
select * 
from bookings
where payment_method='upi';
select * from upi_payment;

create view avg_cust_rating as
select vehicle_type, avg(customer_rating) 
from bookings
group by Vehicle_Type;
select * from avg_cust_rating;

create view total_successful_ride_value as
select sum(booking_value)
from bookings
where booking_status='success';
select * from total_successful_ride_value;

create view incomplete_rides_reason as
select booking_id, incomplete_rides_reason
from bookings
where incomplete_rides='yes';
select * from incomplete_rides_reason;



