  create database ola;

use ola;
select*from booking;

#1. Retrieve all successful bookings:

Create view Successful_Bookings as
SELECT*FROM Booking
WHERE booking_Status='Success';

Select * from Successful_Bookings;

#2. Find the average ride distance for each vehicle type:
create view dist_vehicle as
Select Vehicle_Type ,avg(Ride_Distance)
 as avg_distance from booking
 group by Vehicle_type;

select *from dist_vehicle;

#3. Get the total number of cancelled rides by customers:
create view Total_Ride_Cancel_by_Customer as
select count(*)from booking where Booking_Status='Cancelled by Customer';

select *from Total_Ride_Cancel_by_Customer;

#4.List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select Customer_ID,count(Booking_ID) as total_ride
from booking
group by Customer_ID
order by total_ride desc limit 5;

select * from top_5_customers;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view rides_cancel_by_driver as
select * from booking where Canceled_Rides_by_Driver= "Personal & Car related issue";

select * from rides_cancel_by_driver;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view min_max as
select min(Driver_Ratings) as min_rating ,
 max(Driver_Ratings) as max_rating
 from booking where Vehicle_Type='Prime Sedan';

select * from min_max;

#7.Retrieve all rides where payment was made using UPI:
Create view  all_upi_pays as
Select * from Booking where  Payment_Method='UPI';

select * from all_upi_pays;

#8. Find the average customer rating per vehicle type:
Create view Avg_Customers_Rating as
select Vehicle_Type, avg(Customer_Rating) as Avg_Rating from Booking 
group by Vehicle_Type;

select * from Avg_Customers_Rating;

#9. Calculate the total booking value of rides completed successfully:
Create view Total_Booking_value as
select sum(Booking_Value) from Booking Where Booking_Status='Success';

Select * From Total_Booking_value;

#10. List all incomplete rides along with the reason:
Create view incomplete_rides as
SELECT Booking_ID, Incomplete_Rides_Reason FROM Booking
 WHERE Incomplete_Rides ='Yes';
 
 Select * from incomplete_rides;