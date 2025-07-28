use hotel;
select * from hotel_reservation;

-- 1). What is the total number of reservations in the dataset?  
select count(booking_ID) as total_number_of_reservations from hotel_reservation;

-- 2). Which meal plan is the most popular among guests
select count(*)type_of_meal_plan,type_of_meal_plan from hotel_reservation group by type_of_meal_plan;

-- 3).What is the average price per room for reservations involving children?  
select sum(no_of_children) as children,round(avg(avg_price_per_room)) as average_price_per_room 
from hotel_reservation where no_of_children >0;

-- 5).What is the most commonly booked room type?  
select  count(room_type_reserved) as common_room_type,room_type_reserved from hotel_reservation group by room_type_reserved
order by common_room_type desc;

-- 6).How many reservations fall on a weekend (no_of_weekend_nights > 0)?  
select count(no_of_weekend_nights) from  hotel_reservation where no_of_weekend_nights >0 ;

-- 7).What is the highest and lowest lead time for reservations
select min(lead_time) as lowest_lead_time,max(lead_time)as highest_lead_time from hotel_reservation;

-- 8).What is the most common market segment type for reservations
select max(market_segment_type) as most_common_market_segment from hotel_reservation;
select count(market_segment_type)as common_market_segment,market_segment_type from hotel_reservation group by market_segment_type
order by common_market_segment desc;

-- 9).How many reservations have a booking status of "Confirmed"
select count(booking_status) from hotel_reservation where booking_status="confirmed";

-- 10).What is the total number of adults and children across all reservations? 
 select sum(no_of_adults)as total_adults,sum(no_of_children)as total_children from hotel_reservation;
 
 -- 11).What is the average number of weekend nights for reservations involving children?
 select avg(no_of_weekend_nights) from hotel_reservation where no_of_children>0;
  
  -- 13).What is the average number of nights (both weekend and weekday) spent by guests for each room type
  select round(avg(no_of_weekend_nights))as avg_weekend_night,round(avg(no_of_week_nights)) as avg_weekday_night,
  room_type_reserved from hotel_reservation group by room_type_reserved order by room_type_reserved ;

-- 14).For reservations involving children, what is the most common room type, and what is the average price for that room type? 
select room_type_reserved,count(room_type_reserved)as count ,round(avg(avg_price_per_room)) as average_price from hotel_reservation 
where no_of_children>0 group by room_type_reserved order by count desc; 

-- 15).Find the market segment type that generates the highest average price per room.   
  select market_segment_type,avg_price_per_room from hotel_reservation 
  where avg_price_per_room in (select max(avg_price_per_room) from hotel_reservation);
  select market_segment_type,max(avg_price_per_room) as highest_avg_price from hotel_reservation group by market_segment_type 
  order by highest_avg_price desc;
  
  