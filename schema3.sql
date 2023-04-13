--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg110+1)
-- Dumped by pg_dump version 13.3 (Debian 13.3-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: appointment_request_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.appointment_request_status_type AS ENUM (
    'WAITINGFORNURSETOACCEPT',
    'ACCEPTED',
    'REJECTED',
    'CANCELLED',
    'REQUEST_FAILED'
);


ALTER TYPE public.appointment_request_status_type OWNER TO postgres;

--
-- Name: appointment_schedule_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.appointment_schedule_type AS ENUM (
    'ONCE',
    'DAILY',
    'WEEKLY'
);


ALTER TYPE public.appointment_schedule_type OWNER TO postgres;

--
-- Name: appointment_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.appointment_status_type AS ENUM (
    'WAITINGFORNURSETOACCEPT',
    'ACCEPTED',
    'REJECTED',
    'CANCELLED'
);


ALTER TYPE public.appointment_status_type OWNER TO postgres;

--
-- Name: appointment_visit_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.appointment_visit_type AS ENUM (
    'SINGLE_VISIT',
    'RECURRING_VISIT',
    'LIVE_IN_CARE'
);


ALTER TYPE public.appointment_visit_type OWNER TO postgres;

--
-- Name: days; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.days AS ENUM (
    'SUN',
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT'
);


ALTER TYPE public.days OWNER TO postgres;

--
-- Name: languages; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.languages AS ENUM (
    'Tamil',
    'English',
    'Hindi'
);


ALTER TYPE public.languages OWNER TO postgres;

--
-- Name: nurse_complaint_reason; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.nurse_complaint_reason AS ENUM (
    'BEHAVIOUR',
    'MY_REASON_NOT_LISTED'
);


ALTER TYPE public.nurse_complaint_reason OWNER TO postgres;

--
-- Name: nurse_payment_status_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.nurse_payment_status_type AS ENUM (
    'PAYMENT_COMPLETE',
    'PAYMENT_PENDING',
    'FAILED',
    'APPOINTMENT_CANCELLED'
);


ALTER TYPE public.nurse_payment_status_type OWNER TO postgres;

--
-- Name: nurse_service_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.nurse_service_type AS ENUM (
    'HOUSE_HOLD_TASKS',
    'PERSONAL_CARE',
    'COMPANION_SHIP',
    'TRANSPORTATION',
    'MOBILITY_ASSISTANCE',
    'SPECIALIZED_CARE',
    'PHYSICAL_EXAMINATIONS',
    'NURSE_CONSULTATIONS'
);


ALTER TYPE public.nurse_service_type OWNER TO postgres;

--
-- Name: nurse_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.nurse_type AS ENUM (
    'NURSE',
    'NURSING_ASSISTANCE'
);


ALTER TYPE public.nurse_type OWNER TO postgres;

--
-- Name: payment_methods; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_methods AS ENUM (
    'GPAY',
    'PHONEPE',
    'CASH'
);


ALTER TYPE public.payment_methods OWNER TO postgres;

--
-- Name: schedule; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.schedule AS ENUM (
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00'
);


ALTER TYPE public.schedule OWNER TO postgres;

--
-- Name: user_cancel_reason; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_cancel_reason AS ENUM (
    'OUT_OF_STATION',
    'NOT_AVAILABLE',
    'EMERGENCY',
    'HEALTH_ISSUE',
    'MY_REASON_NOT_LISTED'
);


ALTER TYPE public.user_cancel_reason OWNER TO postgres;

--
-- Name: user_complaint_reason; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_complaint_reason AS ENUM (
    'NURSE_NOT_YET_ARRIVED',
    'MY_REASON_NOT_LISTED'
);


ALTER TYPE public.user_complaint_reason OWNER TO postgres;

--
-- Name: user_relationship_with_patient; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_relationship_with_patient AS ENUM (
    'SELF',
    'PARENTS',
    'SPOUSE',
    'GRAND_PARENTS',
    'FRIENDS',
    'RELATIVES'
);


ALTER TYPE public.user_relationship_with_patient OWNER TO postgres;

--
-- Name: user_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_type AS ENUM (
    'NURSE',
    'PATIENT',
    'USER'
);


ALTER TYPE public.user_type OWNER TO postgres;

--
-- Name: ap_nurse_appointment_book_liveincare(uuid[], character varying, uuid, uuid, date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_book_liveincare(nurseids uuid[], bookingid character varying, patientid uuid, userid uuid, appointment_start_date date, appointment_end_date date) RETURNS TABLE(booking_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
 book_result json;
 --nurse_id_arr uuid[] = nurseids;
 nurseid uuid; 
 start_date date;
 end_date date;
 appointmentid int;
 appointment_date date;
 BEGIN

  start_date = appointment_start_date;
  end_date = appointment_end_date;
  appointment_date = appointment_start_date;
  
  IF EXISTS (select appointment_requests.appointment_request_id  from appointment_requests  
   where appointment_requests.nurse_id = ANY (nurseids) and appointment_requests.appointment_date = start_date
   and appointment_requests.patient_id = patientid and (appointment_visit_type = 'LIVE_IN_CARE'  
   or appointment_visit_type = 'SINGLE_VISIT')                    
   LIMIT 1) 
   
   THEN
     
     book_result = json_build_object('booking_status','failed','reason','appointment request already exists');
     return query select book_result;
  ELSE
    IF EXISTS (select appointments.appointment_id  from appointments appointments 
    inner join nurses on nurses.nurse_id = appointments.nurse_id
    inner join appointment_sessions on appointment_sessions.appointment_id = appointments.appointment_id
    where nurses.nurse_id = ALL (nurseids) and appointment_sessions.appointment_date in (start_date, end_date)
    LIMIT 1) THEN
      book_result = json_build_object('booking_status','failed','reason','nurse have appointments already');
      return query select book_result;
    ELSE
      FOREACH nurseid IN ARRAY nurseids
      LOOP 
       RAISE NOTICE '%', nurseid;

       INSERT INTO public.appointment_requests(
       booking_id, appointment_date, appointment_request_status, 
       nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, 
       appointment_session_count,
        created_at, updated_at)
  VALUES (bookingid, start_date, 'WAITINGFORNURSETOACCEPT', nurseid , 
         patientid, userid, 'LIVE_IN_CARE', 
         appointment_start_date, appointment_end_date, 1, now(), now());

      END LOOP;
      book_result = json_build_object('booking_status','success','reason','');

      return query select book_result;
    END IF;
  END IF;
  
 END;
$$;


ALTER FUNCTION public.ap_nurse_appointment_book_liveincare(nurseids uuid[], bookingid character varying, patientid uuid, userid uuid, appointment_start_date date, appointment_end_date date) OWNER TO postgres;

--
-- Name: ap_nurse_appointment_book_recurring(uuid[], character varying, uuid, uuid, date, date, date[], integer[], character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_book_recurring(nurseids uuid[], bookingid character varying, patientid uuid, userid uuid, appointment_start_date date, appointment_end_date date, appointment_dates date[], days integer[], appointment_start_time character varying, appointment_end_time character varying) RETURNS TABLE(booking_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
 book_result json;
 --nurse_id_arr uuid[] = nurseids;
 nurseid uuid; 
 start_time int;
 end_time int;
 start_date date;
 end_date date;
 appointmentid int;
 appointment_date date;
 BEGIN

  select LEFT(appointment_start_time,2) into start_time;
  
  select LEFT(appointment_end_time,2) into end_time;
  
  start_date = appointment_start_date;
  end_date = appointment_end_date;
  appointment_date = appointment_start_date;
    
  raise notice '%', appointment_dates;
  
 IF EXISTS (select * from appointment_requests where appointment_requests.nurse_id = ANY (nurseids)
     and appointment_requests.patient_id = patient_id and appointment_requests.user_id = user_id
     and appointment_requests.appointment_start_date = start_date and appointment_requests.appointment_end_date = end_date
     and ((appointment_visit_type = 'LIVE_IN_CARE') or ( appointment_visit_type in ('SINGLE_VISIT', 'RECURRING_VISIT') and 
     LEFT(appointment_requests.appointment_start_time, 2)::int = start_time and LEFT(appointment_requests.appointment_end_time, 2)::int = end_time))
      ) 
 THEN
  book_result = json_build_object('booking_status','failed','reason','appointment request already exists');
  return query select book_result;
 ELSE
  IF EXISTS (select * from appointment_sessions appointment_sessions
   inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
   where appointments.nurse_id = ANY (nurseids)
   and appointment_sessions.appointment_date = ANY (appointment_dates)
   and ((LEFT(appointment_sessions.appointment_booked_start_time, 2)::int <= start_time
   and LEFT(appointment_sessions.appointment_booked_end_time, 2)::int >= end_time) or 
   (LEFT(appointment_sessions.appointment_booked_start_time, 2)::int >= start_time
   and LEFT(appointment_sessions.appointment_booked_end_time, 2)::int <= end_time) or 
   ( start_time > LEFT(appointment_sessions.appointment_booked_start_time, 2)::int 
    and start_time < LEFT(appointment_sessions.appointment_booked_end_time, 2)::int) or 
   ( end_time > LEFT(appointment_sessions.appointment_booked_start_time, 2)::int 
    and end_time < LEFT(appointment_sessions.appointment_booked_end_time, 2)::int))
   and appointments.appointment_visit_type in ('RECURRING_VISIT','SINGLE_VISIT')
   union
   select * from appointment_sessions appointment_sessions
   inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
   where appointments.nurse_id = ANY (nurseids)
   and (appointments.appointment_start_date between start_date and end_date or 
     appointments.appointment_end_date between start_date and end_date)
   and appointments.appointment_visit_type in ('LIVE_IN_CARE') 
      LIMIT 1)

  THEN
    book_result = json_build_object('booking_status','failed','reason','appointment already exists');
    return query select book_result;
  ELSE
     FOREACH nurseid IN ARRAY nurseids
     LOOP
      RAISE NOTICE '%', nurseid;

      INSERT INTO public.appointment_requests(
      booking_id, appointment_date, appointment_session_count, appointment_request_status, 
      nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, 
      appointment_start_time, appointment_end_time, days, appointment_dates, created_at, updated_at)
  VALUES (bookingid, appointment_date, 1, 'WAITINGFORNURSETOACCEPT', nurseid, 
        patientid, userid, 'RECURRING_VISIT', 
        appointment_start_date, appointment_end_date, 
        appointment_start_time, appointment_end_time, 
        days,appointment_dates,
        now(), now());

     END LOOP;
     book_result = json_build_object('booking_status','success','reason','');

     return query select book_result;

  END IF;

 END IF;
 END;
$$;


ALTER FUNCTION public.ap_nurse_appointment_book_recurring(nurseids uuid[], bookingid character varying, patientid uuid, userid uuid, appointment_start_date date, appointment_end_date date, appointment_dates date[], days integer[], appointment_start_time character varying, appointment_end_time character varying) OWNER TO postgres;

--
-- Name: ap_nurse_appointment_book_recurring(uuid[], character varying, uuid, uuid, date, date, date[], integer[], character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_book_recurring(nurseids uuid[], bookingid character varying, patientid uuid, userid uuid, appointment_start_date date, appointment_end_date date, appointment_dates date[], days integer[], appointment_start_time character varying, appointment_end_time character varying, _appointment_session_count integer) RETURNS TABLE(booking_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
 book_result json;
 --nurse_id_arr uuid[] = nurseids;
 nurseid uuid; 
 start_time int;
 end_time int;
 start_date date;
 end_date date;
 appointmentid int;
 appointment_date date;
 BEGIN

  select LEFT(appointment_start_time,2) into start_time;
  
  select LEFT(appointment_end_time,2) into end_time;
  
  start_date = appointment_start_date;
  end_date = appointment_end_date;
  appointment_date = appointment_start_date;
  
  --raise notice '%', start_time;
  
  --select * from appointment_requests
  
  raise notice '%', appointment_dates;
  
 IF EXISTS (select * from appointment_requests where appointment_requests.nurse_id = ANY (nurseids)
     and appointment_requests.patient_id = patient_id and appointment_requests.user_id = user_id
     and appointment_requests.appointment_start_date = start_date and appointment_requests.appointment_end_date = end_date
     and ((appointment_visit_type = 'LIVE_IN_CARE') or ( appointment_visit_type in ('SINGLE_VISIT', 'RECURRING_VISIT') and 
     LEFT(appointment_requests.appointment_start_time, 2)::int = start_time and LEFT(appointment_requests.appointment_end_time, 2)::int = end_time))
      ) 
 THEN
  book_result = json_build_object('booking_status','failed','reason','appointment request already exists');
  return query select book_result;
 ELSE
  IF EXISTS (select * from appointment_sessions appointment_sessions
   inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
   where appointments.nurse_id = ANY (nurseids)
   and appointment_sessions.appointment_date = ANY (appointment_dates)
   and ((LEFT(appointment_sessions.appointment_booked_start_time, 2)::int <= start_time
   and LEFT(appointment_sessions.appointment_booked_end_time, 2)::int >= end_time) or 
   (LEFT(appointment_sessions.appointment_booked_start_time, 2)::int >= start_time
   and LEFT(appointment_sessions.appointment_booked_end_time, 2)::int <= end_time) or 
   ( start_time > LEFT(appointment_sessions.appointment_booked_start_time, 2)::int 
    and start_time < LEFT(appointment_sessions.appointment_booked_end_time, 2)::int) or 
   ( end_time > LEFT(appointment_sessions.appointment_booked_start_time, 2)::int 
    and end_time < LEFT(appointment_sessions.appointment_booked_end_time, 2)::int))
   and appointments.appointment_visit_type in ('RECURRING_VISIT','SINGLE_VISIT')
   union
   select * from appointment_sessions appointment_sessions
   inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
   where appointments.nurse_id = ANY (nurseids)
   and (appointments.appointment_start_date between start_date and end_date or 
     appointments.appointment_end_date between start_date and end_date)
   and appointments.appointment_visit_type in ('LIVE_IN_CARE') 
      LIMIT 1)

  THEN
    book_result = json_build_object('booking_status','failed','reason','appointment already exists');
    return query select book_result;
  ELSE
     FOREACH nurseid IN ARRAY nurseids
     LOOP
      RAISE NOTICE '%', nurseid;

      INSERT INTO public.appointment_requests(
  booking_id, appointment_date, appointment_session_count, appointment_request_status, 
      nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, 
      appointment_start_time, appointment_end_time, days, appointment_dates, created_at, updated_at)
  VALUES (bookingid, appointment_date, _appointment_session_count, 'WAITINGFORNURSETOACCEPT', nurseid, 
        patientid, userid, 'RECURRING_VISIT', 
        appointment_start_date, appointment_end_date, 
        appointment_start_time, appointment_end_time, 
        days,appointment_dates,
        now(), now());

     END LOOP;
     book_result = json_build_object('booking_status','success','reason','');

     return query select book_result;

  END IF;

 END IF;
 
 
--select * from nurses
--select * from patients

--select * from users
  
  
--drop FUNCTION ap_nurse_appointment_book_recurring(uuid[], varchar(50), uuid,uuid, date, date) 

/*select * from ap_nurse_appointment_book_recurring(ARRAY['ee58f1f1-eb8b-4567-a15d-ddfc670252d6']::uuid[], 'booking-123-567-980', 
'd29e837b-44d2-4c59-9100-c6471a1ba5e6',
'4294ebd4-3498-4a23-bd89-87c126483cf9','2022-11-17', '2022-11-17',
'10:00', '11:00') 
*/

/*select * from appointment_sessions appointment_sessions
inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
where appointments.nurse_id = ANY (ARRAY['ee58f1f1-eb8b-4567-a15d-ddfc670252d6']::uuid[])
and appointment_sessions.appointment_date = ANY (ARRAY['2022-12-04','2022-12-05','2022-12-06','2022-12-11','2022-12-12','2022-12-13','2022-12-18','2022-12-19','2022-12-20']::date[])
and ((LEFT(appointment_sessions.appointment_booked_start_time, 2)::int <= 10
and LEFT(appointment_sessions.appointment_booked_end_time, 2)::int >= 11) or 
(LEFT(appointment_sessions.appointment_booked_start_time, 2)::int <= 10
and LEFT(appointment_sessions.appointment_booked_end_time, 2)::int <= 11) or
(LEFT(appointment_sessions.appointment_booked_start_time, 2)::int >= 10
and LEFT(appointment_sessions.appointment_booked_end_time, 2)::int <= 11) or 
(LEFT(appointment_sessions.appointment_booked_start_time, 2)::int >= 10
and LEFT(appointment_sessions.appointment_booked_end_time, 2)::int >= 11))
and appointments.appointment_visit_type in ('RECURRING_VISIT','SINGLE_VISIT')
union
select * from appointment_sessions appointment_sessions
inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
where appointments.nurse_id = ANY (ARRAY['ee58f1f1-eb8b-4567-a15d-ddfc670252d6']::uuid[])
and (appointments.appointment_start_date between '2022-12-04' and '2022-12-20' or 
  appointments.appointment_end_date between '2022-12-04' and '2022-12-20')
and appointments.appointment_visit_type in ('LIVE_IN_CARE') LIMIT 1 

select * from ap_nurse_appointment_book_recurring(ARRAY['ee58f1f1-eb8b-4567-a15d-ddfc670252d6']::uuid[], '7112-226997-5898', 
'd29e837b-44d2-4c59-9100-c6471a1ba5e6', 
'4294ebd4-3498-4a23-bd89-87c126483cf9', '2022-12-04', '2022-12-20',
ARRAY['2022-12-04','2022-12-05','2022-12-06','2022-12-11','2022-12-12','2022-12-13','2022-12-18','2022-12-19','2022-12-20']::date[],
ARRAY[0,1,2]::int[],
'10:00', '11:00') 

select * from ap_nurse_appointment_book_recurring(ARRAY['ee58f1f1-eb8b-4567-a15d-ddfc670252d6']::uuid[], '7112-226997-5898', 'd29e837b-44d2-4c59-9100-c6471a1ba5e6', 
                                          '4294ebd4-3498-4a23-bd89-87c126483cf9', '2022-12-04', '2022-12-20',
                                          ARRAY['2022-12-04','2022-12-05','2022-12-06','2022-12-11','2022-12-12','2022-12-13','2022-12-18','2022-12-19','2022-12-20']::date[],ARRAY[0,1,2]::int[],
                                          '10:00', '11:00') 

select * from ap_nurse_appointment_book_recurring(ARRAY['ee58f1f1-eb8b-4567-a15d-ddfc670252d6']::uuid[], '7112-223074-3646', 'd29e837b-44d2-4c59-9100-c6471a1ba5e6', 
                                          '4294ebd4-3498-4a23-bd89-87c126483cf9', '2022-12-04', '2022-12-20',
                                          ARRAY['2022-12-04','2022-12-05','2022-12-06','2022-12-11','2022-12-12','2022-12-13','2022-12-18','2022-12-19','2022-12-20']::date[],ARRAY[0,1,2]::int[],
                                          '10:00', '11:00') 
*/
 END;
$$;


ALTER FUNCTION public.ap_nurse_appointment_book_recurring(nurseids uuid[], bookingid character varying, patientid uuid, userid uuid, appointment_start_date date, appointment_end_date date, appointment_dates date[], days integer[], appointment_start_time character varying, appointment_end_time character varying, _appointment_session_count integer) OWNER TO postgres;

--
-- Name: ap_nurse_appointment_book_singlevisit(uuid[], character varying, uuid, uuid, date, date, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_book_singlevisit(nurseids uuid[], bookingid character varying, patientid uuid, userid uuid, appointment_start_date date, appointment_end_date date, appointment_start_time character varying, appointment_end_time character varying) RETURNS TABLE(booking_result json)
    LANGUAGE plpgsql
    AS $$ 
declare 
 book_result json;
 --nurse_id_arr uuid[] = nurseids;
 nurseid uuid; 
 start_time int;
 end_time int;
 start_date date;
 end_date date;
 appointmentid int;
 appointment_date date;
 BEGIN

  select LEFT(appointment_start_time,2) into start_time;
  
  select LEFT(appointment_end_time,2) into end_time;
  
  start_date = appointment_start_date;
  end_date = appointment_end_date;
  appointment_date = appointment_start_date;
  
  --raise notice '%', start_time;
  
  --select * from appointment_requests
  
  
  IF EXISTS (select appointment_requests.appointment_request_id  from appointment_requests  
   where appointment_requests.nurse_id = ANY (nurseids) and appointment_requests.appointment_date = start_date
   and appointment_requests.patient_id = patientid and ((appointment_visit_type = 'SINGLE_VISIT'  
      and LEFT(appointment_requests.appointment_start_time,2)::int = start_time 
       and LEFT(appointment_requests.appointment_end_time,2)::int = end_time) or
       (appointment_visit_type = 'LIVE_IN_CARE'))
   LIMIT 1) 
   
   THEN
    
     book_result = json_build_object('booking_status','failed','reason','appointment request already exists');
     return query select book_result;
  ELSE
     IF EXISTS (select appointments.appointment_id  from appointments appointments 
    inner join nurses on nurses.nurse_id = appointments.nurse_id
    inner join appointment_sessions on appointment_sessions.appointment_id = appointments.appointment_id
    where nurses.nurse_id = ALL (nurseids) and appointment_sessions.appointment_date in (start_date, end_date)
    and ( (LEFT(appointment_booked_start_time,2)::int <= start_time and LEFT(appointment_booked_end_time,2)::int >= end_time)
        or (LEFT(appointment_booked_start_time,2)::int >= start_time and LEFT(appointment_booked_end_time,2)::int <= end_time)
     )      
    LIMIT 1) THEN  
      book_result = json_build_object('booking_status','failed','reason','nurse have appointments already');
      return query select book_result;
    ELSE
      FOREACH nurseid IN ARRAY nurseids
      LOOP
       RAISE NOTICE '%', nurseid;

       INSERT INTO public.appointment_requests(
       booking_id, appointment_date, appointment_session_count, appointment_request_status, 
       nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, 
       appointment_start_time, appointment_end_time, created_at, updated_at)
  VALUES (bookingid, appointment_date, 1, 'WAITINGFORNURSETOACCEPT', nurseid, 
         patientid, userid, 'SINGLE_VISIT', 
         appointment_start_date, appointment_end_date, 
         appointment_start_time, appointment_end_time,
         now(), now());

      END LOOP;
      book_result = json_build_object('booking_status','success','reason','');

      return query select book_result;
    END IF;
  END IF;

 END;
$$;


ALTER FUNCTION public.ap_nurse_appointment_book_singlevisit(nurseids uuid[], bookingid character varying, patientid uuid, userid uuid, appointment_start_date date, appointment_end_date date, appointment_start_time character varying, appointment_end_time character varying) OWNER TO postgres;

--
-- Name: ap_nurse_appointment_request_accept(uuid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_request_accept(nurseid uuid, appointment_req_id integer) RETURNS TABLE(booking_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
 book_result json;
 --nurseid uuid; 
 --appointment_req_id int;
 bookingid varchar(50);
 appointment_type appointment_visit_type;
 session_seq int;
 appointment_dates date[];
 appointment_date_local date;
 BEGIN
      
    --appointment_req_id = appointment_request_id;
    
    select booking_id, appointment_visit_type, appointment_requests.appointment_dates into bookingid, appointment_type, appointment_dates from appointment_requests where appointment_requests.appointment_request_id = appointment_req_id;

    IF EXISTS (select * from appointment_requests where booking_id = bookingid 
      and appointment_request_status in ('ACCEPTED', 'CANCELLED')) THEN
 
   book_result = json_build_object('request_status','failed','reason','Appointment request already Accepted or Cancelled');
   return query select book_result;
 
    ELSE
     
         update appointment_requests set appointment_request_status = 'ACCEPTED' 
   where appointment_requests.appointment_request_id = appointment_req_id;
   
   update appointment_requests set appointment_request_status = 'REQUEST_FAILED' 
   where appointment_requests.booking_id = bookingid and appointment_request_id <> appointment_req_id;
 
   INSERT INTO public.appointment_request_status(
appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status)
VALUES (appointment_req_id, bookingid, nurseid, now(), now(), 'ACCEPTED');
   
   INSERT INTO public.appointments(
    booking_id, appointment_date, appointment_status, appointment_session_count, nurse_id, 
      patient_id, user_id, created_at, updated_at, appointment_visit_type, appointment_start_date, appointment_end_date)
    select booking_id, appointment_requests.appointment_date, 'ACCEPTED', appointment_session_count, nurse_id, patient_id, user_id, now(), now(), 
   appointment_visit_type, appointment_start_date, appointment_end_date from appointment_requests
   where appointment_requests.appointment_request_id = appointment_req_id;
   
   IF (appointment_type = 'SINGLE_VISIT' or appointment_type = 'LIVE_IN_CARE') THEN
    INSERT INTO public.appointment_sessions(
appointment_id, appointment_booked_start_time, appointment_booked_end_time,
    appointment_date, appointment_session, appointment_slot_time, appointment_session_status, created_at, updated_at)
select appointments.appointment_id, appointment_requests.appointment_start_time, appointment_requests.appointment_end_time, 
    appointment_requests.appointment_date,appointments.appointment_session_count, appointment_requests.appointment_start_time, 'UPCOMING', 
    now(), now() from appointment_requests
    inner join appointments on appointments.booking_id = appointment_requests.booking_id
    where appointment_requests.appointment_request_id = appointment_req_id;
   ELSE
    session_seq = 1;  
    FOREACH appointment_date_local IN ARRAY appointment_dates
      LOOP
       
       INSERT INTO public.appointment_sessions(
appointment_id, appointment_booked_start_time, appointment_booked_end_time,
      appointment_date, appointment_session, appointment_slot_time, appointment_session_status, created_at, updated_at)
select appointments.appointment_id, appointment_requests.appointment_start_time, appointment_requests.appointment_end_time, 
      appointment_date_local, session_seq, appointment_requests.appointment_start_time, 'UPCOMING', 
      now(), now() from appointment_requests
      inner join appointments on appointments.booking_id = appointment_requests.booking_id
      where appointment_requests.appointment_request_id = appointment_req_id;
      
      session_seq = session_seq + 1;

      END LOOP;
   
   END IF;
   book_result = json_build_object('request_status','success','reason','');
   return query select book_result;
 
--select * from appointment_requests

--select * from appointments

    END IF;
END;
$$;


ALTER FUNCTION public.ap_nurse_appointment_request_accept(nurseid uuid, appointment_req_id integer) OWNER TO postgres;

--
-- Name: ap_nurse_appointment_request_info(uuid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_request_info(nurseid uuid, appointment_request_id integer) RETURNS TABLE(appointment_req_id integer, appointment_request_status public.appointment_request_status_type, appointment_session_count integer, nurse_id uuid, nurse_name character varying, nurse_avg_rating double precision, nurse_rating_count integer, nurse_location character varying, nurse_distance double precision, nurse_experience integer, nurse_gender character varying, nurse_age integer, appointment_date date, appointment_visit_type public.appointment_visit_type, appointment_start_date date, appointment_end_date date, appointment_patient_symptoms character varying, appointment_specific_request character varying, total_payment_amount bigint, fees_per_session bigint, patient_id uuid, patient_name character varying, patient_gender character varying, patient_age integer, patient_avg_rating double precision, patient_location character varying, patient_phone character varying, patient_email character varying, appointment_start_time character varying, appointment_end_time character varying, days integer[], patient_latitude double precision, patient_longitude double precision, user_id uuid, patient_booking_status boolean)
    LANGUAGE plpgsql
    AS $_$
 
declare 
 --book_result json;
 --nurseid uuid; 
 appointment_req_id int;
 --bookingid varchar(50);
 BEGIN
      
    appointment_req_id = appointment_request_id;
    
    return query
    select ar.appointment_request_id appointment_req_id, ar.appointment_request_status,
  ar.appointment_session_count, nurses.nurse_id, nurses.nurse_name, nurses.nurse_avg_rating,
  nurses.nurse_rating_count, nurses.nurse_location, Round(ST_Distance(users.user_geolocation, nurses.nurse_geolocation)/1000) nurse_distance, 
  nurses.nurse_experience, nurses.nurse_gender, nurses.nurse_age, ar.appointment_date, ar.appointment_visit_type,
  ar.appointment_start_date, ar.appointment_end_date, ar.appointment_patient_symptoms, 
  ar.appointment_specific_request, ar.total_payment_amount, ar.fees_per_session, 
  patients.patient_id, patients.patient_name, patients.patient_gender, patients.patient_age,
  patients.patient_avg_rating, patients.patient_location, patients.patient_phone, patients.patient_email,
  ar.appointment_start_time, ar.appointment_end_time, ar.days, user_address.user_latitude, user_address.user_longitude,
  users.user_id, ar.patient_booking_status
  from appointment_requests ar
  inner join nurses on nurses.nurse_id = ar.nurse_id
  inner join patients on patients.patient_id = ar.patient_id
  inner join users on users.user_id = ar.user_id
  left join user_address on user_address.user_id = users.user_id and patients.patient_id = user_address.patient_id
  where ar.appointment_request_id = appointment_req_id
        and ar.Appointment_Visit_Type in ('SINGLE_VISIT', 'LIVE_IN_CARE', 'RECURRING_VISIT');

--select * from ap_nurse_appointment_request_info('ee58f1f1-eb8b-4567-a15d-ddfc670252d6',28)
--select * from public.ap_nurse_appointment_request_info($1,$2)  
--select * from user_address
 END;
 
$_$;


ALTER FUNCTION public.ap_nurse_appointment_request_info(nurseid uuid, appointment_request_id integer) OWNER TO postgres;

--
-- Name: ap_nurse_appointment_request_reject(uuid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_request_reject(nurseid uuid, appointment_request_id integer) RETURNS TABLE(booking_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
 book_result json;
 --nurseid uuid; 
 appointment_req_id int;
 bookingid varchar(50);
 BEGIN
      
    appointment_req_id = appointment_request_id;
    
    select booking_id into bookingid from appointment_requests where appointment_requests.appointment_request_id = appointment_req_id;

    IF EXISTS (select * from appointment_requests where booking_id = bookingid 
      and appointment_request_status in ('ACCEPTED', 'CANCELLED')) THEN
 
   book_result = json_build_object('request_status','failed','reason','Appointment request already Accepted or Cancelled');
   return query select book_result;
 
    ELSE
     
         update appointment_requests set appointment_request_status = 'REJECTED' 
   where appointment_requests.appointment_request_id = appointment_req_id;
 
   INSERT INTO public.appointment_request_status(
   appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status)
VALUES (appointment_req_id, bookingid, nurseid, now(), now(), 'REJECTED');
   
   book_result = json_build_object('request_status','success','reason','');
   return query select book_result;
 
--select * from appointment_requests

--select * from appointments

    END IF;
END;
$$;


ALTER FUNCTION public.ap_nurse_appointment_request_reject(nurseid uuid, appointment_request_id integer) OWNER TO postgres;

--
-- Name: ap_nurse_appointment_session_end(integer, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_session_end(_appointment_session_id integer, _appointment_end_time character varying) RETURNS TABLE(booking_result json)
    LANGUAGE plpgsql
    AS $$
declare 
 book_result json;
 _appointment_id int;
 BEGIN
 
  IF EXISTS (select * from appointment_sessions where appointment_session_id = _appointment_session_id) THEN

     update appointment_sessions set appointment_session_status='COMPLETED',appointment_actual_end_time=_appointment_end_time,
     appointment_actual_end_time_with_date=now() where appointment_session_id=_appointment_session_id;

     update nurse_earnings set payment_status = 'PAYMENT_COMPLETE', payment_received_date = CURRENT_DATE 
     where appointment_session_id = _appointment_session_id;
     
     select appointment_id into _appointment_id from appointment_sessions where appointment_session_id = _appointment_session_id;

     IF EXISTS(select * from appointment_sessions where appointment_id = _appointment_id and appointment_session_status <>'COMPLETED'
      and appointment_session_status <>'CANCELLED') THEN
       raise notice 'do not update';
     ELSE
       raise notice 'update';
       update appointments set appointment_status = 'COMPLETED';
     END IF;

     book_result = json_build_object('request_status','success','reason','');
     return query select book_result;

  ELSE
   book_result = json_build_object('request_status','failed','reason','Appointment session does not exist');
   return query select book_result;
  END IF;
--select * from ap_nurse_appointment_session_end(19,'13:00')
END;
$$;


ALTER FUNCTION public.ap_nurse_appointment_session_end(_appointment_session_id integer, _appointment_end_time character varying) OWNER TO postgres;

--
-- Name: ap_nurse_appointment_summary(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_appointment_summary(nurseid uuid, duration character varying) RETURNS TABLE(appointment_summary_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
  appointment_summary_result json;
  total_appointment_count integer;
  month_wise_summary json;
  year_wise_summary json;
  BEGIN

  --raise notice '%', appointment_dates;
  
  select count(appointment_id) into total_appointment_count from appointments
  where nurse_id = nurseid and appointment_status in ('COMPLETED', 'UPCOMING', 'ONGOING')
  group by nurse_id;
  
  IF(duration = 'month') Then
   SELECT json_agg(row_to_json(X)) into month_wise_summary
   FROM (select date_part('month', appointment_date) as month, count(appointment_id) appointment_count  from appointments
   where nurse_id = nurseid and appointment_status in ('COMPLETED', 'UPCOMING', 'ONGOING')
   group by month order by month) AS X;

   appointment_summary_result = json_build_object('total_appointment_count',total_appointment_count,'month_wise_summary',month_wise_summary);

   return query select appointment_summary_result;
   ELSEIF(duration = 'year') Then
      SELECT json_agg(row_to_json(X)) into year_wise_summary
   FROM (select date_part('year', appointment_date) as year, count(appointment_id) appointment_count  from appointments
   where nurse_id = nurseid and appointment_status in ('COMPLETED', 'UPCOMING', 'ONGOING')
   group by year order by year) AS X;

   appointment_summary_result = json_build_object('total_appointment_count',total_appointment_count,'year_wise_summary',year_wise_summary);

   return query select appointment_summary_result;
   
   END IF;
  
  END;
$$;


ALTER FUNCTION public.ap_nurse_appointment_summary(nurseid uuid, duration character varying) OWNER TO postgres;

--
-- Name: ap_nurse_earnings(uuid, date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_earnings(_nurseid uuid, _start_date date, _end_date date) RETURNS TABLE(total_bookings integer, cancelled_sessions integer, reported_sessions integer, received_payment integer, pending_payment integer)
    LANGUAGE plpgsql
    AS $$
 
declare 

 _total_bookings int;
 _cancelled_sessions int; 
 _reported_sessions int;
 _received_payment int; 
 _pending_payment int;
 
 BEGIN

  _received_payment = 0;
  _pending_payment = 0;
        select count(booking_id) into _total_bookings from appointments 
  where nurse_id = _nurseid and appointment_start_date >= _start_date and appointment_end_date <= _end_date;
  
  select count(appointment_sessions.appointment_session_id) into _cancelled_sessions from appointments 
  inner join appointment_sessions on appointment_sessions.appointment_id = appointments.appointment_id
  where nurse_id = _nurseid and appointments.appointment_start_date >= _start_date 
  and appointments.appointment_end_date <= _end_date and appointment_session_status = 'CANCELLED';

  select count(appointment_sessions.appointment_session_id) into _reported_sessions from appointments 
  inner join appointment_sessions on appointment_sessions.appointment_id = appointments.appointment_id
  where nurse_id = _nurseid and appointments.appointment_start_date >= _start_date 
  and appointments.appointment_end_date <= _end_date and appointment_session_status = 'REPORTED';
  
  select sum(nurse_earning) into _received_payment from nurse_earnings where nurse_id = _nurseid and
  payment_status = 'PAYMENT_COMPLETE' and payment_received_date >= _start_date and payment_received_date <= _end_date
  group by nurse_id;

  select sum(nurse_earning) into _pending_payment from nurse_earnings where nurse_id = _nurseid and
  payment_status = 'PAYMENT_PENDING'
  group by nurse_id;
  
  return query
  select _total_bookings, _cancelled_sessions, _reported_sessions, _received_payment, _pending_payment;
  
 END;
$$;


ALTER FUNCTION public.ap_nurse_earnings(_nurseid uuid, _start_date date, _end_date date) OWNER TO postgres;

--
-- Name: ap_nurse_profile_visit_summary(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_profile_visit_summary(nurseid uuid, duration character varying) RETURNS TABLE(visit_summary_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
  visit_summary_result json;
  total_visit_count integer;
  month_wise_summary json;
  year_wise_summary json;
  BEGIN

  --raise notice '%', appointment_dates;
  
  select count(nurse_profile_visit_id) into total_visit_count from nurse_profile_visit
  where nurse_id = nurseid
  group by nurse_id;
  
  IF(duration = 'month') Then
   SELECT json_agg(row_to_json(X)) into month_wise_summary
   FROM (select date_part('month', visit_date) as month, count(nurse_profile_visit_id) visit_count  from nurse_profile_visit
   where nurse_id = nurseid
   group by month order by month) AS X;

   visit_summary_result = json_build_object('total_visit_count',total_visit_count,'month_wise_summary',month_wise_summary);

   return query select visit_summary_result;
   ELSEIF(duration = 'year') Then
      SELECT json_agg(row_to_json(X)) into year_wise_summary
   FROM (select date_part('year', visit_date) as year, count(nurse_profile_visit_id) visit_count  from nurse_profile_visit
   where nurse_id = nurseid
   group by year order by year) AS X;

   visit_summary_result = json_build_object('total_visit_count',total_visit_count,'year_wise_summary',year_wise_summary);

   return query select visit_summary_result;
   
   END IF;
  
  END;
$$;


ALTER FUNCTION public.ap_nurse_profile_visit_summary(nurseid uuid, duration character varying) OWNER TO postgres;

--
-- Name: ap_nurse_report_summary(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_report_summary(nurseid uuid, duration character varying) RETURNS TABLE(nurse_report_summary_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
  report_summary_result json;
  cancelled_session_count integer;
  reported_session_count integer;
  amount_received integer;
  balance_amount integer;
  BEGIN

  amount_received = 0;
  balance_amount = 0;
  
  --raise notice '%', appointment_dates;
  
  select count(appointment_session_id) into cancelled_session_count from appointment_sessions
  inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
  where nurse_id = nurseid and appointment_session_status in ('CANCELLED')
  group by nurse_id;
  
  select count(appointment_session_id) into reported_session_count from appointment_sessions
  inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
  where nurse_id = nurseid and appointment_session_status in ('REPORTED')
  group by nurse_id;
  
   nurse_report_summary_result = json_build_object('cancelled_session_count',cancelled_session_count,'reported_session_count',reported_session_count,
              'amount_received',10000, 'balance_amount', 1000);

   return query select nurse_report_summary_result;
  
  END;
$$;


ALTER FUNCTION public.ap_nurse_report_summary(nurseid uuid, duration character varying) OWNER TO postgres;

--
-- Name: ap_nurse_search_recurring_visit(json); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_nurse_search_recurring_visit(query_filter_json json) RETURNS TABLE(search_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
 book_result json;
 
 _user_id uuid;
 _user_geolocation geography(Point,4326);
 _nurse_type character varying(10);
 _appointment_visit_type character varying(10);
 _minimum_fees integer;
 _maximum_fees integer;
 _nurse_experience integer;
 _distance integer; 
 _order_by_name character varying(10);
 _order_by_price character varying(10);
 _schedule json;
 _appointment_start_date date;
 _appointment_end_date date;
 _days json;
 BEGIN
 
  --INSERT INTO table_name (name, age)
  SELECT (query_filter_json->>'user_id')::uuid, (query_filter_json->>'user_geolocation')::geography(Point,4326),
  (query_filter_json->>'nurse_type')::varchar(10),(query_filter_json->>'minimum_fees')::integer,
  (query_filter_json->>'maximum_fees')::integer,(query_filter_json->>'nurse_experience')::integer,
  (query_filter_json->>'distance')::integer,(query_filter_json->>'order_by_name')::varchar(10),
  (query_filter_json->>'order_by_price')::varchar(10), (query_filter_json->>'appointment_visit_type')::varchar(10),
  (query_filter_json->>'schedule')::json
  into  _user_id, _user_geolocation,_nurse_type, _minimum_fees, _maximum_fees, _nurse_experience, _distance, 
  _order_by_name, _order_by_price, _appointment_visit_type, _schedule;
  
  
  SELECT (_schedule->>'appointment_start_date')::date, (_schedule->>'appointment_end_date')::date,
  (_schedule->>'days')::json into _appointment_start_date, _appointment_end_date, _days;
  --book_result = json_build_object('appointment_visit_type',_user_id);
  book_result = json_build_object('appointment_visit_type',_days);
  
 return query select book_result;
 END;
$$;


ALTER FUNCTION public.ap_nurse_search_recurring_visit(query_filter_json json) OWNER TO postgres;

--
-- Name: ap_user_appointment_request_info(uuid, integer, public.geography); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_user_appointment_request_info(_user_id uuid, _appointment_request_id integer, _user_geolocation public.geography) RETURNS TABLE(appointment_req_id integer, appointment_id integer, appointment_request_status public.appointment_request_status_type, appointment_session_count integer, nurse_id uuid, nurse_name character varying, nurse_avg_rating double precision, nurse_rating_count integer, nurse_location character varying, nurse_distance double precision, nurse_experience integer, nurse_gender character varying, appointment_visit_type public.appointment_visit_type, appointment_date date, appointment_start_date date, appointment_end_date date, appointment_start_time character varying, appointment_end_time character varying, days integer[], appointment_patient_symptoms character varying, appointment_specific_request character varying, fees_per_session bigint, patient_id uuid, patient_name character varying, patient_gender character varying, payment_method public.payment_methods, patient_avg_rating double precision, patient_rating_count integer, patient_location character varying, patient_phone character varying, patient_email character varying, patient_more_description character varying, total_payment_amount bigint, booking_id character varying, user_relationship_with_patient public.user_relationship_with_patient, patient_dob date, nurse_dob date, nurse_latitude double precision, nurse_longitude double precision, patient_latitude double precision, patient_longitude double precision, user_address_line character varying, user_city character varying, user_state character varying, user_pincode character varying, user_id uuid, patient_booking_status boolean)
    LANGUAGE plpgsql
    AS $$
 
declare 
 _patient_id uuid;
 _patient_rating_avg double precision;
 _patient_rating_count integer;
 BEGIN
   
   select appointment_requests.patient_id into _patient_id from appointment_requests where appointment_request_id = _appointment_request_id;
   
   select sum(patient_rating)/count(patient_rating), count(patient_rating) 
   into _patient_rating_avg, _patient_rating_count from patient_ratings
   where patient_ratings.patient_id = _patient_id
   group by patient_ratings.patient_id;
   
   IF _patient_rating_avg is NULL THEN
    _patient_rating_avg = 0;
   END IF;
   
   IF _patient_rating_count is NULL THEN
    _patient_rating_count = 0;
   END IF;
    
    return query
    select ar.appointment_request_id appointment_req_id, appointments.appointment_id, ar.appointment_request_status,
  ar.appointment_session_count, nurses.nurse_id, nurses.nurse_name, nurses.nurse_avg_rating,
  nurses.nurse_rating_count, nurses.nurse_location, Round(ST_Distance(_user_geolocation, nurses.nurse_geolocation)/1000) nurse_distance, 
  nurses.nurse_experience, nurses.nurse_gender, ar.appointment_visit_type, ar.appointment_date,
  ar.appointment_start_date, ar.appointment_end_date, ar.appointment_start_time,ar.appointment_end_time,ar.days,
  ar.appointment_patient_symptoms, ar.appointment_specific_request, ar.fees_per_session, 
  patients.patient_id, patients.patient_name, patients.patient_gender,ar.payment_method,
  _patient_rating_avg, _patient_rating_count, patients.patient_location, patients.patient_phone, patients.patient_email,
  patients.patient_more_description,ar.fees_per_session*ar.appointment_session_count total_payment_amount,ar.booking_id,
  patients.user_relationship_with_patient, patients.patient_dob,nurses.nurse_dob,nurses.nurse_latitude,nurses.nurse_longitude,
  user_address.user_latitude, user_address.user_longitude, user_address.user_address_line, user_address.user_city,
  user_address.user_state, user_address.user_pincode, users.user_id, ar.patient_booking_status
  from appointment_requests ar
  inner join nurses on nurses.nurse_id = ar.nurse_id
  inner join patients on patients.patient_id = ar.patient_id
  inner join users on users.user_id = ar.user_id
  left join user_address on user_address.user_id = users.user_id and user_address.patient_id = patients.patient_id
  left join appointments on appointments.booking_id = ar.booking_id
  where ar.appointment_request_id = _appointment_request_id and ar.user_id = _user_id
        and ar.Appointment_Visit_Type in ('SINGLE_VISIT', 'LIVE_IN_CARE', 'RECURRING_VISIT');
  
END;
 
$$;


ALTER FUNCTION public.ap_user_appointment_request_info(_user_id uuid, _appointment_request_id integer, _user_geolocation public.geography) OWNER TO postgres;

--
-- Name: ap_user_favourites(uuid, public.geography, public.nurse_type); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_user_favourites(_user_id uuid, _user_geolocation public.geography, _nurse_type public.nurse_type) RETURNS TABLE(user_favourites_id integer, nurse_id uuid, nurse_name character varying, nurse_location character varying, nurse_distance double precision, nurse_experience integer, nurse_gender character varying, nurse_age integer, nurse_type public.nurse_type, nurse_avg_rating bigint, nurse_rating_count bigint, fees_per_session integer)
    LANGUAGE plpgsql
    AS $$
 
declare 
 
 BEGIN
    return query
    select user_favourites.user_favourites_id,nurses.nurse_id, nurses.nurse_name, nurses.nurse_location, Round(ST_Distance(user_geolocation, nurses.nurse_geolocation)/1000) nurse_distance,
    nurses.nurse_experience, nurses.nurse_gender, nurses.nurse_age, nurses.nurse_type, rating_avg.nurse_avg_rating,
    rating_avg.nurse_rating_count, nurse_fees.minimum_session_fee from user_favourites
  inner join users on users.user_id = user_favourites.user_id
  inner join nurses on nurses.nurse_id = user_favourites.nurse_id
  left join nurse_fees on nurse_fees.nurse_id = nurses.nurse_id 
  left join (select sum(nurse_ratings.nurse_rating)/count(nurse_ratings.nurse_rating) nurse_avg_rating, 
  count(nurse_ratings.nurse_rating) nurse_rating_count, nurses.nurse_id from nurses  
  inner join nurse_ratings on nurse_ratings.nurse_id = nurses.nurse_id 
  GROUP BY nurses.nurse_id) rating_avg on rating_avg.nurse_id = nurses.nurse_id
  --where user_favourites.user_id = '53645460-2c17-4518-b883-4f940980c5cd';
  where user_favourites.user_id = _user_id and nurses.nurse_type = _nurse_type;
  
 END;
 
$$;


ALTER FUNCTION public.ap_user_favourites(_user_id uuid, _user_geolocation public.geography, _nurse_type public.nurse_type) OWNER TO postgres;

--
-- Name: ap_user_patient_update(uuid, character varying, date, integer, character varying, character varying, double precision, double precision, character varying, character varying, character varying, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_user_patient_update(_user_id uuid, _user_name character varying, _user_dob date, _user_age integer, _user_email character varying, _user_gender character varying, _user_latitude double precision, _user_longitude double precision, _user_location character varying, _user_address_line character varying, _user_city character varying, _user_state character varying, _user_pincode character varying, _whatsapp_same_as_contact_phone boolean) RETURNS TABLE(update_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
    update_result json;
    _user_phone character varying(20);
    _patient_id uuid;
    _whatsapp_phone character varying(20);
    BEGIN
    
        _whatsapp_phone = NULL;
        
        raise notice 'user phone, %', _user_phone;
        IF EXISTS(select user_id from users where user_id = _user_id) THEN
            select user_phone into _user_phone from users where user_id = _user_id;
            IF _whatsapp_same_as_contact_phone IS TRUE THEN
                _whatsapp_phone = _user_phone;
            END IF;

            UPDATE users SET user_dob=_user_dob,user_age=_user_age, user_email=_user_email, 
            user_gender=_user_gender,user_name=_user_name, user_whatsapp_phone=_whatsapp_phone
            where user_id=_user_id;

            insert into patients(patient_id,patient_age,patient_dob,patient_email,patient_gender,
            patient_name,patient_phone,user_id,user_relationship_with_patient)
            values(gen_random_uuid(),_user_age,_user_dob,_user_email,_user_gender, _user_name,_user_phone,_user_id,'SELF')
            ON CONFLICT ON CONSTRAINT patients_unique_key DO
            UPDATE SET patient_age=_user_age, patient_dob=_user_dob,patient_email=_user_email,patient_gender=_user_gender,
            patient_name=_user_name,user_id=_user_id, user_relationship_with_patient='SELF';

            select patient_id into _patient_id from patients where user_id = _user_id;

            insert into user_address(user_address_id,patient_id,user_address_line,user_city,user_state,user_id,user_pincode,
            user_location,user_latitude,user_longitude,user_geolocation)
            values(gen_random_uuid(),_patient_id,_user_address_line,_user_city,_user_state,_user_id,_user_pincode,
            _user_location,_user_latitude,_user_longitude, ST_Point(_user_longitude,_user_latitude))
            ON CONFLICT ON CONSTRAINT user_address_patient_id_unique_key DO
            UPDATE SET patient_id=_patient_id,user_address_line=_user_address_line, user_city=_user_city,
            user_state=_user_state,user_id=_user_id, user_pincode=_user_pincode,user_location=_user_location,
            user_latitude=_user_latitude,user_longitude=_user_longitude,user_geolocation=ST_Point(_user_longitude,_user_latitude);

            update_result = json_build_object('update_status','success','reason','');
            return query select update_result;
        ELSE
              update_result = json_build_object('update_status','failed','reason','user does not exist');
              return query select update_result;
        END IF;
        
    END;
$$;


ALTER FUNCTION public.ap_user_patient_update(_user_id uuid, _user_name character varying, _user_dob date, _user_age integer, _user_email character varying, _user_gender character varying, _user_latitude double precision, _user_longitude double precision, _user_location character varying, _user_address_line character varying, _user_city character varying, _user_state character varying, _user_pincode character varying, _whatsapp_same_as_contact_phone boolean) OWNER TO postgres;

--
-- Name: ap_user_patient_update(uuid, character varying, character varying, date, integer, character varying, character varying, double precision, double precision, character varying, character varying, character varying, character varying, character varying, boolean, public.user_relationship_with_patient); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_user_patient_update(_user_id uuid, _patient_phone character varying, _patient_name character varying, _patient_dob date, _patient_age integer, _patient_email character varying, _patient_gender character varying, _patient_latitude double precision, _patient_longitude double precision, _patient_location character varying, _patient_address_line character varying, _patient_city character varying, _patient_state character varying, _patient_pincode character varying, _whatsapp_same_as_contact_phone boolean, _user_relationship_with_patient public.user_relationship_with_patient) RETURNS TABLE(update_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
    update_result json;
    _user_phone character varying(20);
    _patient_id uuid;
    _whatsapp_phone character varying(20);
    BEGIN
    
        _whatsapp_phone = NULL;
        
        raise notice 'user phone, %', _user_phone;
        IF EXISTS(select user_id from users where user_id = _user_id) THEN
            
            IF _whatsapp_same_as_contact_phone IS TRUE THEN
                _whatsapp_phone = _patient_phone;
            END IF;

            insert into patients(patient_id,patient_age,patient_dob,patient_email,patient_gender,
            patient_name,patient_phone,patient_whatsapp_phone,user_id,user_relationship_with_patient)
            values(gen_random_uuid(),_patient_age,_patient_dob,_patient_email,_patient_gender,_patient_name,
       _patient_phone,_whatsapp_phone,_user_id,_user_relationship_with_patient)
            ON CONFLICT ON CONSTRAINT patients_unique_key DO
            UPDATE SET patient_age=_patient_age, patient_dob=_patient_dob,patient_email=_patient_email,patient_gender=_patient_gender,
            patient_name=_patient_name,patient_phone=_patient_phone,patient_whatsapp_phone=_whatsapp_phone,
   user_relationship_with_patient=_user_relationship_with_patient;

            select patient_id into _patient_id from patients where user_id = _user_id and patient_phone = _patient_phone 
   and user_relationship_with_patient=_user_relationship_with_patient;

            insert into user_address(user_address_id,patient_id,user_address_line,user_city,user_state,user_id,user_pincode,
            user_location,user_latitude,user_longitude,user_geolocation)
            values(gen_random_uuid(),_patient_id,_patient_address_line,_patient_city,_patient_state,_user_id,_patient_pincode,
            _patient_location,_patient_latitude,_patient_longitude, ST_Point(_patient_longitude,_patient_latitude))
            ON CONFLICT ON CONSTRAINT user_address_patient_id_unique_key DO
            UPDATE SET patient_id=_patient_id,user_address_line=_patient_address_line, user_city=_patient_city,
            user_state=_patient_state,user_pincode=_patient_pincode,user_location=_patient_location,
            user_latitude=_patient_latitude,user_longitude=_patient_longitude,user_geolocation=ST_Point(_patient_longitude,_patient_latitude);

            update_result = json_build_object('update_status','success','reason','');
            return query select update_result;
        ELSE
              update_result = json_build_object('update_status','failed','reason','user does not exist');
              return query select update_result;
        END IF;
        
    END;
$$;


ALTER FUNCTION public.ap_user_patient_update(_user_id uuid, _patient_phone character varying, _patient_name character varying, _patient_dob date, _patient_age integer, _patient_email character varying, _patient_gender character varying, _patient_latitude double precision, _patient_longitude double precision, _patient_location character varying, _patient_address_line character varying, _patient_city character varying, _patient_state character varying, _patient_pincode character varying, _whatsapp_same_as_contact_phone boolean, _user_relationship_with_patient public.user_relationship_with_patient) OWNER TO postgres;

--
-- Name: ap_user_transaction_daywise(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_user_transaction_daywise(userid uuid, duration character varying) RETURNS TABLE(appointment_date date, appointment_details json)
    LANGUAGE plpgsql
    AS $$
 

 BEGIN

  IF duration = 'This_Week' THEN 
   return query
   select appointment_sessions.appointment_date,
   json_agg(json_build_object('appointment_date',appointment_sessions.appointment_date,'booking_id',appointments.booking_id,
   'appointment_slot_time',appointment_sessions.appointment_slot_time, 'nurse_name',nurses.nurse_name, 'fees',nurse_earnings.nurse_earning,
   'payment_method', payment_method)) as appointment_details
   from users
   inner join appointments on appointments.user_id = users.user_id
   inner join appointment_sessions on appointment_sessions.appointment_id = appointments.appointment_id
   inner join nurse_earnings on nurse_earnings.nurse_id = appointments.nurse_id and nurse_earnings.appointment_session_id = appointment_sessions.appointment_session_id
   inner join nurses on nurses.nurse_id = appointments.nurse_id
   where users.user_id  = userid
   and appointment_sessions.appointment_date >=date_trunc('week', now())
   group by appointment_sessions.appointment_date;
  ELSEIF duration = 'This_Month' THEN 
   return query
   select appointment_sessions.appointment_date,
   json_agg(json_build_object('appointment_date',appointment_sessions.appointment_date,'booking_id',appointments.booking_id,
   'appointment_slot_time',appointment_sessions.appointment_slot_time, 'nurse_name',nurses.nurse_name, 'fees',nurse_earnings.nurse_earning,
   'payment_method', payment_method)) as appointment_details
   from users
   inner join appointments on appointments.user_id = users.user_id
   inner join appointment_sessions on appointment_sessions.appointment_id = appointments.appointment_id 
   inner join nurse_earnings on nurse_earnings.nurse_id = appointments.nurse_id and nurse_earnings.appointment_session_id = appointment_sessions.appointment_session_id
   inner join nurses on nurses.nurse_id = appointments.nurse_id
   where users.user_id  = userid
   and appointment_sessions.appointment_date >=date_trunc('month', now())
   group by appointment_sessions.appointment_date;
  END IF;
--DROP FUNCTION user_transaction_daywise(uuid,character varying)

--select * from ap_user_transaction_daywise('ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 'This_Week')

--select * from ap_user_transaction_daywise('4294ebd4-3498-4a23-bd89-87c126483cf9', 'This_Month')

--return query select * from temp_table_group_by_date;
 END;
$$;


ALTER FUNCTION public.ap_user_transaction_daywise(userid uuid, duration character varying) OWNER TO postgres;

--
-- Name: ap_user_update(uuid, character varying, date, integer, character varying, character varying, double precision, double precision, character varying, character varying, character varying, character varying, character varying, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ap_user_update(_user_id uuid, _user_name character varying, _user_dob date, _user_age integer, _user_email character varying, _user_gender character varying, _user_latitude double precision, _user_longitude double precision, _user_location character varying, _user_address_line character varying, _user_city character varying, _user_state character varying, _user_pincode character varying, _whatsapp_same_as_contact_phone boolean) RETURNS TABLE(update_result json)
    LANGUAGE plpgsql
    AS $$
 
declare 
 update_result json;
 _user_phone character varying(20);
 _patient_id uuid;
 _whatsapp_phone character varying(20);
 BEGIN
 
  _whatsapp_phone = NULL;
  
  raise notice 'user phone, %', _user_phone;
  IF EXISTS(select user_id from users where user_id = _user_id) THEN
   select user_phone into _user_phone from users where user_id = _user_id;
   IF _whatsapp_same_as_contact_phone IS TRUE THEN
    _whatsapp_phone = _user_phone;
   END IF;

   UPDATE users SET user_dob=_user_dob,user_age=_user_age, user_email=_user_email, 
   user_gender=_user_gender,user_name=_user_name, user_whatsapp_phone=_whatsapp_phone
   where user_id=_user_id;

   insert into patients(patient_id,patient_age,patient_dob,patient_email,patient_gender,
   patient_name,patient_phone,patient_whatsapp_phone,user_id,user_relationship_with_patient)
values(gen_random_uuid(),_user_age,_user_dob,_user_email,_user_gender, _user_name,_user_phone,_whatsapp_phone,_user_id,'SELF')
   ON CONFLICT ON CONSTRAINT patients_unique_key DO
   UPDATE SET patient_age=_user_age, patient_dob=_user_dob,patient_email=_user_email,patient_gender=_user_gender,
   patient_name=_user_name,patient_whatsapp_phone=_whatsapp_phone,user_id=_user_id,user_relationship_with_patient='SELF';

   select patient_id into _patient_id from patients where user_id = _user_id and user_relationship_with_patient='SELF';

   insert into user_address(user_address_id,patient_id,user_address_line,user_city,user_state,user_id,user_pincode,
   user_location,user_latitude,user_longitude,user_geolocation)
values(gen_random_uuid(),_patient_id,_user_address_line,_user_city,_user_state,_user_id,_user_pincode,
   _user_location,_user_latitude,_user_longitude, ST_Point(_user_longitude,_user_latitude))
   ON CONFLICT ON CONSTRAINT user_address_patient_id_unique_key DO
   UPDATE SET patient_id=_patient_id,user_address_line=_user_address_line, user_city=_user_city,
   user_state=_user_state,user_id=_user_id, user_pincode=_user_pincode,user_location=_user_location,
   user_latitude=_user_latitude,user_longitude=_user_longitude,user_geolocation=ST_Point(_user_longitude,_user_latitude);

   update_result = json_build_object('update_status','success','reason','');
   return query select update_result;
  ELSE
     update_result = json_build_object('update_status','failed','reason','user does not exist');
     return query select update_result;
  END IF;
  
 END;
$$;


ALTER FUNCTION public.ap_user_update(_user_id uuid, _user_name character varying, _user_dob date, _user_age integer, _user_email character varying, _user_gender character varying, _user_latitude double precision, _user_longitude double precision, _user_location character varying, _user_address_line character varying, _user_city character varying, _user_state character varying, _user_pincode character varying, _whatsapp_same_as_contact_phone boolean) OWNER TO postgres;

--
-- Name: nurse_appointment_book_liveincare(uuid[], date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nurse_appointment_book_liveincare(nurseids uuid[], appointment_start_date date, appointment_end_date date) RETURNS TABLE(booking_result json)
    LANGUAGE plpgsql
    AS $$ 
declare 
 book_result json;
 --nurse_id_arr uuid[] = nurseids;
 nurseid uuid; 
 BEGIN

  --return query
  
  IF EXISTS (select appointments.appointment_id  from appointments appointments 
  inner join nurses on nurses.nurse_id = appointments.nurse_id
  inner join appointment_sessions on appointment_sessions.appointment_id = appointments.appointment_id
  where nurses.nurse_id = ALL (nurseids) and appointment_sessions.appointment_date in (appointment_start_date, appointment_end_date)
  LIMIT 1) THEN
    book_result = json_build_object('booking_status','failed','reason','nurse have appointments already');
    return query select book_result;
  ELSE
    FOREACH nurseid IN ARRAY nurseids
    LOOP 
     RAISE NOTICE '%', nurseid;
    END LOOP;
    book_result = json_build_object('booking_status','success','reason','');
    
    return query select book_result;
  END IF;
 END;
$$;


ALTER FUNCTION public.nurse_appointment_book_liveincare(nurseids uuid[], appointment_start_date date, appointment_end_date date) OWNER TO postgres;

--
-- Name: nurse_appointment_request_info(uuid, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nurse_appointment_request_info(nurseid uuid, appointment_request_id integer) RETURNS TABLE(appointment_req_id integer, appointment_request_status public.appointment_request_status_type, appointment_session_count integer, nurse_id uuid, nurse_name character varying, nurse_avg_rating double precision, nurse_rating_count integer, nurse_location character varying, nurse_distance double precision, nurse_experience integer, nurse_gender character varying, nurse_age integer, appointment_date date, appointment_visit_type public.appointment_visit_type, appointment_start_date date, appointment_end_date date, appointment_patient_symptoms character varying, appointment_specific_request character varying, total_payment_amount bigint, fees_per_session bigint, patient_id uuid, patient_name character varying, patient_gender character varying, patient_age integer, patient_avg_rating double precision, patient_location character varying, patient_phone character varying, patient_email character varying, appointment_start_time character varying, appointment_end_time character varying)
    LANGUAGE plpgsql
    AS $$
 
declare 
 --book_result json;
 --nurseid uuid; 
 appointment_req_id int;
 --bookingid varchar(50);
 BEGIN
      
    appointment_req_id = appointment_request_id;
    
    return query
    select ar.appointment_request_id appointment_req_id, ar.appointment_request_status,
  ar.appointment_session_count, nurses.nurse_id, nurses.nurse_name, nurses.nurse_avg_rating,
  nurses.nurse_rating_count, nurses.nurse_location, Round(ST_Distance(user_geolocation, nurses.nurse_geolocation)/1000) nurse_distance, 
  nurses.nurse_experience, nurses.nurse_gender, nurses.nurse_age, ar.appointment_date, ar.appointment_visit_type,
  ar.appointment_start_date, ar.appointment_end_date, ar.appointment_patient_symptoms, 
  ar.appointment_specific_request, ar.total_payment_amount, ar.fees_per_session, 
  patients.patient_id, patients.patient_name, patients.patient_gender, patients.patient_age,
  patients.patient_avg_rating, patients.patient_location, patients.patient_phone, patients.patient_email,
  ar.appointment_start_time, ar.appointment_end_time
  from appointment_requests ar
  inner join appointments on ar.booking_id = appointments.booking_id
  inner join nurses on nurses.nurse_id = ar.nurse_id
  inner join patients on patients.patient_id = ar.patient_id
  inner join users on users.user_id = ar.user_id
  where ar.appointment_request_id = appointment_req_id
        and (ar.Appointment_Visit_Type = 'SINGLE_VISIT' or ar.Appointment_Visit_Type ='LIVE_IN_CARE');

 END;
 
$$;


ALTER FUNCTION public.nurse_appointment_request_info(nurseid uuid, appointment_request_id integer) OWNER TO postgres;

--
-- Name: nurse_earnings_daywise(uuid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nurse_earnings_daywise(nurseid uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$ 
DECLARE
rec record;
       BEGIN
   --return query
   --drop table temp_table_group_by_date if exists;
   DROP TABLE IF EXISTS temp_table_group_by_date;
   CREATE TEMP TABLE IF NOT EXISTS temp_table_group_by_date AS
   select appointment_sessions.appointment_date, sum(nurse_earnings.nurse_earning) from nurses
   inner join nurse_earnings on nurse_earnings.nurse_id = nurses.nurse_id
   inner join appointment_sessions on appointment_sessions.appointment_session_id = nurse_earnings.appointment_session_id
   inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
   where nurses.nurse_id  = nurseid
   and appointment_sessions.appointment_date between '2022-11-03' and '2022-11-08'
   group by appointment_sessions.appointment_date,nurse_earnings.nurse_earning ,nurses.nurse_id;

   FOR rec IN
      SELECT *
      FROM temp_table_group_by_date
     
      LOOP
     --perform select rec.appointment_date from rec;
    raise notice '%',rec.appointment_date;
    
    select json_agg(json_build_object(appointments.booking_id, nurse_earnings.nurse_earning,
    appointment_sessions.appointment_slot_time, patients.patient_name, nurse_earnings.payment_method))
    from nurses
    inner join nurse_earnings on nurse_earnings.nurse_id = nurses.nurse_id
    inner join appointment_sessions on appointment_sessions.appointment_session_id = nurse_earnings.appointment_session_id
    inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
    inner join patients on patients.patient_id = appointments.patient_id
    where nurses.nurse_id  = nurseid
    and appointment_sessions.appointment_date = rec.appointment_date;
    
    --select json_agg(json_build_object(nurse_id, nurse_earning)) from nurse_earnings
    --;
    
   END LOOP;

   --return query select * from temp_table_group_by_date;
        END;
$$;


ALTER FUNCTION public.nurse_earnings_daywise(nurseid uuid) OWNER TO postgres;

--
-- Name: nurse_earnings_daywise(uuid, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nurse_earnings_daywise(nurseid uuid, duration character varying) RETURNS TABLE(appointment_date date, total_earning_today bigint, appointment_details json)
    LANGUAGE plpgsql
    AS $$
 

 BEGIN

        IF duration = 'This_Week' THEN 
   return query
   select appointment_sessions.appointment_date,sum(nurse_earnings.nurse_earning) total_earning_today,
   json_agg(json_build_object('booking_id',appointments.booking_id,'nurse_earning',nurse_earnings.nurse_earning,
   'appointment_slot_time',appointment_sessions.appointment_slot_time, 'patient_name',patients.patient_name)) as appointment_details
   from nurses
   inner join nurse_earnings on nurse_earnings.nurse_id = nurses.nurse_id
   inner join appointment_sessions on appointment_sessions.appointment_session_id = nurse_earnings.appointment_session_id
   inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
   inner join patients on patients.patient_id = appointments.patient_id
   where nurses.nurse_id  = nurseid
   and appointment_sessions.appointment_date >=date_trunc('week', now())
   group by appointment_sessions.appointment_date
   order by appointment_sessions.appointment_date;
  ELSEIF duration = 'This_Month' THEN 
   return query
   select appointment_sessions.appointment_date,sum(nurse_earnings.nurse_earning) total_earning_today,
   json_agg(json_build_object('booking_id',appointments.booking_id,'nurse_earning',nurse_earnings.nurse_earning,
   'appointment_slot_time',appointment_sessions.appointment_slot_time, 'patient_name',patients.patient_name)) as appointment_details
   from nurses
   inner join nurse_earnings on nurse_earnings.nurse_id = nurses.nurse_id
   inner join appointment_sessions on appointment_sessions.appointment_session_id = nurse_earnings.appointment_session_id
   inner join appointments on appointments.appointment_id = appointment_sessions.appointment_id
   inner join patients on patients.patient_id = appointments.patient_id
   where nurses.nurse_id  = nurseid
   and appointment_sessions.appointment_date >=date_trunc('month', now())
   group by appointment_sessions.appointment_date 
   order by appointment_sessions.appointment_date;
  END IF;
--DROP FUNCTION nurse_earnings_daywise(uuid,date,date)

--select * from nurse_earnings_daywise('ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 'This_Week')

--select * from nurse_earnings_daywise('ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 'This_Month')

--return query select * from temp_table_group_by_date;
 END;
$$;


ALTER FUNCTION public.nurse_earnings_daywise(nurseid uuid, duration character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: appointment_request_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_request_status (
    appointment_request_status_id integer NOT NULL,
    appointment_request_id integer NOT NULL,
    booking_id character varying(50) NOT NULL,
    nurse_id uuid NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    appointment_request_status public.appointment_request_status_type
);


ALTER TABLE public.appointment_request_status OWNER TO postgres;

--
-- Name: appointment_request_status_appointment_request_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.appointment_request_status ALTER COLUMN appointment_request_status_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.appointment_request_status_appointment_request_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: appointment_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_requests (
    appointment_request_id integer NOT NULL,
    booking_id character varying(50) NOT NULL,
    appointment_date date NOT NULL,
    appointment_session_count integer NOT NULL,
    nurse_id uuid NOT NULL,
    patient_id uuid NOT NULL,
    user_id uuid NOT NULL,
    appointment_visit_type public.appointment_visit_type,
    appointment_start_date date,
    appointment_end_date date,
    appointment_start_time character varying(10),
    appointment_end_time character varying(10),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    appointment_request_status public.appointment_request_status_type,
    appointment_patient_symptoms character varying(1000),
    appointment_specific_request character varying(1000),
    total_payment_amount bigint,
    fees_per_session bigint,
    days integer[],
    appointment_dates date[],
    payment_method public.payment_methods,
    patient_booking_status boolean DEFAULT false
);


ALTER TABLE public.appointment_requests OWNER TO postgres;

--
-- Name: appointment_requests_appointment_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.appointment_requests ALTER COLUMN appointment_request_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.appointment_requests_appointment_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: appointment_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_sessions (
    appointment_session_id integer NOT NULL,
    appointment_id integer NOT NULL,
    appointment_actual_end_time character varying(10),
    appointment_actual_start_time character varying(10),
    appointment_booked_end_time character varying(10) NOT NULL,
    appointment_booked_start_time character varying(10) NOT NULL,
    appointment_date date NOT NULL,
    appointment_session integer NOT NULL,
    appointment_slot_time character varying(10) NOT NULL,
    appointment_session_status character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    appointment_session_cancelled_by public.user_type,
    appointment_actual_end_time_with_date timestamp without time zone,
    appointment_actual_start_time_with_date timestamp without time zone,
    appoinment_cancel_comments character varying(2000),
    appointment_session_user_reason public.user_cancel_reason
);


ALTER TABLE public.appointment_sessions OWNER TO postgres;

--
-- Name: appointment_sessions_appointment_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.appointment_sessions ALTER COLUMN appointment_session_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.appointment_sessions_appointment_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: appointment_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_slots (
    slot_id integer NOT NULL,
    slots character varying[] NOT NULL
);


ALTER TABLE public.appointment_slots OWNER TO postgres;

--
-- Name: appointment_slots_nurse_default; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_slots_nurse_default (
    slot_id integer NOT NULL,
    nurse_id uuid NOT NULL,
    slot_frequency character varying[],
    slots character varying[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.appointment_slots_nurse_default OWNER TO postgres;

--
-- Name: appointment_slots_nurse_default_slot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.appointment_slots_nurse_default ALTER COLUMN slot_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.appointment_slots_nurse_default_slot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: appointment_slots_nurse_specific; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointment_slots_nurse_specific (
    slot_id integer NOT NULL,
    nurse_id uuid,
    slot_date date,
    slots character varying[],
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.appointment_slots_nurse_specific OWNER TO postgres;

--
-- Name: appointment_slots_nurse_specific_slot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.appointment_slots_nurse_specific ALTER COLUMN slot_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.appointment_slots_nurse_specific_slot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    booking_id character varying(50),
    appointment_date date NOT NULL,
    appointment_status character varying(50) NOT NULL,
    appointment_session_count integer NOT NULL,
    nurse_id uuid NOT NULL,
    patient_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    appointment_visit_type public.appointment_visit_type,
    appointment_start_date date,
    appointment_end_date date,
    appointment_patient_symptoms character varying(1000),
    appointment_specific_request character varying(1000),
    patient_booking_status boolean DEFAULT false
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.appointments ALTER COLUMN appointment_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.appointments_appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: end_otp_for_appointment_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.end_otp_for_appointment_session (
    end_otp_for_appointment_session_id integer NOT NULL,
    user_id uuid NOT NULL,
    user_phone character varying(20) NOT NULL,
    appointment_session_id integer NOT NULL,
    otp character varying(100) NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.end_otp_for_appointment_session OWNER TO postgres;

--
-- Name: end_otp_for_appointment_sessi_end_otp_for_appointment_sessi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.end_otp_for_appointment_session ALTER COLUMN end_otp_for_appointment_session_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.end_otp_for_appointment_sessi_end_otp_for_appointment_sessi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_address (
    nurse_address_id uuid NOT NULL,
    nurse_id uuid,
    nurse_address_type character varying(100),
    nurse_area character varying(100),
    nurse_city character varying(100),
    nurse_door_no_block character varying(100),
    nurse_pincode character varying(10),
    nurse_road character varying(100),
    nurse_state character varying(50),
    nurse_street character varying(100)
);


ALTER TABLE public.nurse_address OWNER TO postgres;

--
-- Name: nurse_appointment_complaint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_appointment_complaint (
    nurse_appointment_complaint_id integer NOT NULL,
    nurse_id uuid,
    patient_id uuid,
    appointment_session_id integer,
    nurse_complaint_reason public.nurse_complaint_reason,
    complaint_comments character varying(2000),
    complaint_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nurse_appointment_complaint OWNER TO postgres;

--
-- Name: nurse_appointment_complaint_nurse_appointment_complaint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_appointment_complaint ALTER COLUMN nurse_appointment_complaint_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_appointment_complaint_nurse_appointment_complaint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_document_proof; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_document_proof (
    nurse_document_proof_id integer NOT NULL,
    nurse_id uuid NOT NULL,
    adhar_proof_file_name character varying(200) NOT NULL,
    address_proof_file_name character varying(200) NOT NULL,
    photo_file_name character varying(200) NOT NULL,
    experience_certificate_file_name character varying(200) NOT NULL,
    agreement_file_name character varying(200) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nurse_document_proof OWNER TO postgres;

--
-- Name: nurse_document_proof_nurse_document_proof_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_document_proof ALTER COLUMN nurse_document_proof_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_document_proof_nurse_document_proof_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_earnings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_earnings (
    nurse_earnings_id integer NOT NULL,
    nurse_id uuid,
    appointment_id integer,
    appointment_session_id integer,
    booking_id character varying(50),
    nurse_earning integer,
    payment_method public.payment_methods,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    payment_received_date date,
    payment_status public.nurse_payment_status_type
);


ALTER TABLE public.nurse_earnings OWNER TO postgres;

--
-- Name: nurse_earnings_nurse_earnings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_earnings ALTER COLUMN nurse_earnings_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_earnings_nurse_earnings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_education (
    nurse_education_id integer NOT NULL,
    nurse_education_name character varying(200) NOT NULL
);


ALTER TABLE public.nurse_education OWNER TO postgres;

--
-- Name: nurse_education_nurse_education_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_education ALTER COLUMN nurse_education_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_education_nurse_education_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_fees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_fees (
    nurse_fees_id integer NOT NULL,
    nurse_id uuid,
    minimum_distance integer,
    distance_unit character varying(10),
    minimum_session_fee integer,
    session_fee_currency character varying(10),
    charges_for_extra_distance integer
);


ALTER TABLE public.nurse_fees OWNER TO postgres;

--
-- Name: nurse_fees_nurse_fees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_fees ALTER COLUMN nurse_fees_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_fees_nurse_fees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_notifications (
    nurse_notifications_id integer NOT NULL,
    nurse_id uuid,
    nurse_notifications_subject character varying(300),
    appointment_session_id integer,
    notification_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_read boolean DEFAULT false
);


ALTER TABLE public.nurse_notifications OWNER TO postgres;

--
-- Name: nurse_notifications_nurse_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_notifications ALTER COLUMN nurse_notifications_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_notifications_nurse_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_profile_visit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_profile_visit (
    nurse_profile_visit_id integer NOT NULL,
    nurse_id uuid,
    user_id uuid,
    visit_date date,
    visit_time timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nurse_profile_visit OWNER TO postgres;

--
-- Name: nurse_profile_visit_nurse_profile_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_profile_visit ALTER COLUMN nurse_profile_visit_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_profile_visit_nurse_profile_visit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_ratings (
    nurse_ratings_id integer NOT NULL,
    nurse_id uuid,
    patient_id uuid,
    user_id uuid,
    appointment_id integer,
    appointment_session_id integer,
    nurse_rating integer,
    nurse_rating_comments character varying(2000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nurse_ratings OWNER TO postgres;

--
-- Name: nurse_ratings_nurse_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_ratings ALTER COLUMN nurse_ratings_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_ratings_nurse_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_service_type_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_service_type_values (
    nurse_service_type_value_id integer NOT NULL,
    nurse_service_type public.nurse_service_type,
    nurse_service_type_name character varying(200),
    nurse_service_type_description character varying(1000)
);


ALTER TABLE public.nurse_service_type_values OWNER TO postgres;

--
-- Name: nurse_service_type_values_nurse_service_type_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_service_type_values ALTER COLUMN nurse_service_type_value_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_service_type_values_nurse_service_type_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_settings (
    nurse_settings_id integer NOT NULL,
    nurse_id uuid,
    nurse_language public.languages,
    notifications_on boolean,
    whatsapp_alerts_on boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nurse_settings OWNER TO postgres;

--
-- Name: nurse_settings_nurse_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_settings ALTER COLUMN nurse_settings_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_settings_nurse_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_skills (
    nurse_skill_id integer NOT NULL,
    nurse_skill_name character varying(200) NOT NULL
);


ALTER TABLE public.nurse_skills OWNER TO postgres;

--
-- Name: nurse_skills_nurse_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_skills ALTER COLUMN nurse_skill_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_skills_nurse_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurse_slots_recurring; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurse_slots_recurring (
    slot_id integer NOT NULL,
    nurse_id uuid NOT NULL,
    slot_frequency public.days[],
    slot_start_time public.schedule,
    slot_end_time public.schedule,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.nurse_slots_recurring OWNER TO postgres;

--
-- Name: nurse_slots_recurring_slot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurse_slots_recurring ALTER COLUMN slot_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurse_slots_recurring_slot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nurses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurses (
    nurse_id uuid NOT NULL,
    nurse_age integer,
    nurse_dob date,
    nurse_email character varying(50),
    nurse_firstname character varying(20),
    nurse_gender character varying(10),
    nurse_lastname character varying(20),
    nurse_latitude double precision,
    nurse_location character varying(50),
    nurse_longitude double precision,
    nurse_name character varying(50),
    nurse_password character varying(200),
    nurse_phone character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nurse_geolocation public.geography(Point,4326),
    nurse_type public.nurse_type,
    nurse_avg_rating double precision,
    nurse_experience integer,
    nurse_rating_count integer,
    nurse_whatsapp_phone character varying(20),
    nurse_verified boolean,
    nurse_is_licensed boolean,
    nurse_description character varying(2000),
    nurse_languages_known public.languages[],
    nurse_service_type public.nurse_service_type[],
    nurse_education_id integer,
    nurse_skill_id integer,
    is_criminal_record_checked boolean,
    nurse_profile_image_name character varying(100),
    nurse_is_deleted boolean DEFAULT false
);


ALTER TABLE public.nurses OWNER TO postgres;

--
-- Name: nurses_service_type_subscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nurses_service_type_subscription (
    nurses_service_type_subscription_id integer NOT NULL,
    nurse_service_type_value_id integer,
    nurse_id uuid
);


ALTER TABLE public.nurses_service_type_subscription OWNER TO postgres;

--
-- Name: nurses_service_type_subscript_nurses_service_type_subscript_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.nurses_service_type_subscription ALTER COLUMN nurses_service_type_subscription_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.nurses_service_type_subscript_nurses_service_type_subscript_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: otp_for_appointment_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otp_for_appointment_session (
    otp_for_appointment_session_id integer NOT NULL,
    user_id uuid NOT NULL,
    user_phone character varying(20) NOT NULL,
    appointment_session_id integer NOT NULL,
    otp character varying(100) NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.otp_for_appointment_session OWNER TO postgres;

--
-- Name: otp_for_appointment_session_otp_for_appointment_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.otp_for_appointment_session ALTER COLUMN otp_for_appointment_session_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.otp_for_appointment_session_otp_for_appointment_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: otp_phone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otp_phone (
    user_phone character varying(20),
    otp character varying(100),
    created_at timestamp without time zone
);


ALTER TABLE public.otp_phone OWNER TO postgres;

--
-- Name: patient_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient_ratings (
    patient_ratings_id integer NOT NULL,
    patient_id uuid,
    nurse_id uuid,
    user_id uuid,
    appointment_id integer,
    appointment_session_id integer,
    patient_rating integer,
    patient_rating_comments character varying(2000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.patient_ratings OWNER TO postgres;

--
-- Name: patient_ratings_patient_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.patient_ratings ALTER COLUMN patient_ratings_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.patient_ratings_patient_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id uuid NOT NULL,
    patient_age integer,
    patient_dob date,
    patient_email character varying(50),
    patient_firstname character varying(20),
    patient_gender character varying(10),
    patient_lastname character varying(20),
    patient_latitude double precision,
    patient_location character varying(50),
    patient_longitude double precision,
    patient_name character varying(50),
    patient_phone character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id uuid,
    self_or_others boolean,
    patient_avg_rating double precision,
    patient_ratings double precision,
    user_relationship_with_patient public.user_relationship_with_patient,
    patient_whatsapp_phone character varying(20),
    patient_more_description character varying(2000),
    patient_profile_image_name character varying(100)
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    payment_id integer NOT NULL,
    user_id uuid NOT NULL,
    patient_id uuid NOT NULL,
    booking_id character varying(50) NOT NULL,
    payment_method public.payment_methods NOT NULL,
    appointment_session_count integer NOT NULL,
    fees_per_session bigint,
    total_payment_amount bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    appoinment_id integer,
    payment_date date
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ALTER COLUMN payment_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.payments_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: total_visit_count; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.total_visit_count (
    count bigint
);


ALTER TABLE public.total_visit_count OWNER TO postgres;

--
-- Name: user_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_address (
    user_address_id uuid NOT NULL,
    user_id uuid NOT NULL,
    user_city character varying(100) NOT NULL,
    user_pincode character varying(10) NOT NULL,
    user_state character varying(50) NOT NULL,
    patient_id uuid,
    user_address_line character varying(200),
    user_latitude double precision,
    user_longitude double precision,
    user_geolocation public.geography(Point,4326),
    user_location character varying(50)
);


ALTER TABLE public.user_address OWNER TO postgres;

--
-- Name: user_appointment_complaint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_appointment_complaint (
    user_appointment_complaint_id integer NOT NULL,
    user_id uuid,
    nurse_id uuid,
    appointment_session_id integer,
    user_complaint_reason public.user_complaint_reason,
    complaint_comments character varying(2000),
    complaint_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_appointment_complaint OWNER TO postgres;

--
-- Name: user_appointment_complaint_user_appointment_complaint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_appointment_complaint ALTER COLUMN user_appointment_complaint_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_appointment_complaint_user_appointment_complaint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_favourites (
    user_favourites_id integer NOT NULL,
    user_id uuid,
    nurse_id uuid,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_favourites OWNER TO postgres;

--
-- Name: user_favourites_user_favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_favourites ALTER COLUMN user_favourites_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_favourites_user_favourites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_notifications (
    user_notifications_id integer NOT NULL,
    user_id uuid,
    user_notifications_subject character varying(300),
    appointment_session_id integer,
    notification_date date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_read boolean DEFAULT false
);


ALTER TABLE public.user_notifications OWNER TO postgres;

--
-- Name: user_notifications_user_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_notifications ALTER COLUMN user_notifications_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_notifications_user_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_ratings (
    user_ratings_id integer NOT NULL,
    nurse_id uuid,
    patient_id uuid,
    user_id uuid,
    appointment_id integer,
    appointment_session_id integer,
    user_rating integer,
    user_rating_comments character varying(2000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_ratings OWNER TO postgres;

--
-- Name: user_ratings_user_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_ratings ALTER COLUMN user_ratings_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_ratings_user_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_settings (
    user_settings_id integer NOT NULL,
    user_id uuid,
    user_language public.languages,
    notifications_on boolean,
    whatsapp_alerts_on boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_settings OWNER TO postgres;

--
-- Name: user_settings_user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_settings ALTER COLUMN user_settings_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_settings_user_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id uuid NOT NULL,
    user_age integer,
    user_dob date,
    user_email character varying(50),
    user_firstname character varying(20),
    user_gender character varying(10),
    user_lastname character varying(20),
    user_latitude double precision,
    user_location character varying(50),
    user_longitude double precision,
    user_name character varying(50),
    user_password character varying(200),
    user_phone character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_geolocation public.geography(Point,4326),
    user_avg_rating double precision,
    user_whatsapp_phone character varying(20),
    user_profile_image_name character varying(100),
    user_is_deleted boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: appointment_request_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) FROM stdin;
4	7	booking-123-567-123	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2022-11-18 07:19:22.625362	2022-11-18 07:19:22.625362	ACCEPTED
5	17	7115-783958-3899	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2022-11-18 07:52:13.074166	2022-11-18 07:52:13.074166	ACCEPTED
6	13	7115-711725-3108	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2022-11-18 14:30:30.62272	2022-11-18 14:30:30.62272	ACCEPTED
7	14	7115-711682-7483	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2022-11-18 14:50:54.862458	2022-11-18 14:50:54.862458	REJECTED
11	28	7184-001696-3023	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2022-12-05 08:14:13.054062	2022-12-05 08:14:13.054062	ACCEPTED
12	29	7184-002032-9595	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2022-12-05 08:43:22.894358	2022-12-05 08:43:22.894358	ACCEPTED
13	30	7184-064646-3655	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2022-12-05 11:42:00.009	2022-12-05 11:42:00.009	ACCEPTED
14	36	7188-627292-6245	450b15fb-4044-4c08-9a80-06bd7c2f4e43	2023-02-27 10:17:52.772544	2023-02-27 10:17:52.772544	ACCEPTED
15	37	7188-620095-9168	450b15fb-4044-4c08-9a80-06bd7c2f4e43	2023-02-28 12:46:39.008611	2023-02-28 12:46:39.008611	ACCEPTED
16	41	7188-327550-2356	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-02-28 13:44:56.778234	2023-02-28 13:44:56.778234	ACCEPTED
17	42	7188-320767-2116	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-02-28 13:50:24.988239	2023-02-28 13:50:24.988239	ACCEPTED
18	43	7188-320929-5437	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-02-28 13:53:24.117046	2023-02-28 13:53:24.117046	ACCEPTED
19	44	7188-598647-3250	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-03 09:56:51.311291	2023-03-03 09:56:51.311291	ACCEPTED
20	47	7185-018640-4846	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-08 09:24:17.179364	2023-03-08 09:24:17.179364	ACCEPTED
21	45	7185-482347-8895	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-14 07:10:20.223506	2023-03-14 07:10:20.223506	ACCEPTED
22	57	7185-824279-5983	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-14 10:54:45.812104	2023-03-14 10:54:45.812104	ACCEPTED
23	58	7185-511601-6447	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-15 09:17:47.374541	2023-03-15 09:17:47.374541	ACCEPTED
25	54	7185-847710-6556	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-15 12:16:14.950589	2023-03-15 12:16:14.950589	ACCEPTED
26	53	7185-847778-8217	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-15 12:17:35.781141	2023-03-15 12:17:35.781141	ACCEPTED
27	62	7185-237970-2140	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-16 09:08:33.950455	2023-03-16 09:08:33.950455	ACCEPTED
28	61	7185-237052-0625	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-16 09:37:44.303599	2023-03-16 09:37:44.303599	ACCEPTED
29	63	7185-283801-4559	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-16 14:13:08.772911	2023-03-16 14:13:08.772911	ACCEPTED
30	65	7182-941828-4036	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-21 06:05:22.69316	2023-03-21 06:05:22.69316	REJECTED
31	67	7182-985643-8508	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-21 07:46:15.84769	2023-03-21 07:46:15.84769	ACCEPTED
32	64	7182-943149-6591	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 05:58:15.198969	2023-03-24 05:58:15.198969	ACCEPTED
33	66	7182-988255-4493	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 06:07:18.942823	2023-03-24 06:07:18.942823	REJECTED
34	69	7182-198259-6128	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 06:11:49.509465	2023-03-24 06:11:49.509465	ACCEPTED
35	68	7182-198298-8553	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 06:30:24.214255	2023-03-24 06:30:24.214255	ACCEPTED
36	70	7182-167603-5255	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 07:11:00.960072	2023-03-24 07:11:00.960072	ACCEPTED
37	72	7182-111713-4327	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 13:56:26.238466	2023-03-24 13:56:26.238466	ACCEPTED
38	73	7182-111080-8508	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 13:58:10.041088	2023-03-24 13:58:10.041088	ACCEPTED
39	74	7182-111655-1167	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	ACCEPTED
40	75	7182-111847-6640	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-03-24 14:05:16.437264	2023-03-24 14:05:16.437264	ACCEPTED
\.


--
-- Data for Name: appointment_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_requests (appointment_request_id, booking_id, appointment_date, appointment_session_count, nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_start_time, appointment_end_time, created_at, updated_at, appointment_request_status, appointment_patient_symptoms, appointment_specific_request, total_payment_amount, fees_per_session, days, appointment_dates, payment_method, patient_booking_status) FROM stdin;
65	7182-941828-4036	2023-03-20	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	SINGLE_VISIT	2023-03-20	2023-03-20	16:00	20:00	2023-03-20 10:06:37.026265	2023-03-20 10:06:37.026265	REJECTED	\N	\N	\N	\N	\N	\N	\N	f
67	7182-985643-8508	2023-03-21	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	SINGLE_VISIT	2023-03-21	2023-03-21	11:30	16:00	2023-03-21 06:00:05.783046	2023-03-21 06:00:05.783046	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
64	7182-943149-6591	2022-11-19	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	SINGLE_VISIT	2022-11-19	2022-11-19	10:00	11:00	2023-03-20 09:46:43.485421	2023-03-20 09:46:43.485421	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
66	7182-988255-4493	2023-03-21	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	SINGLE_VISIT	2023-03-21	2023-03-21	12:00	16:00	2023-03-21 05:53:08.003679	2023-03-21 05:53:08.003679	REJECTED	\N	\N	\N	\N	\N	\N	\N	f
69	7182-198259-6128	2023-03-24	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	SINGLE_VISIT	2023-03-24	2023-03-24	16:40	22:00	2023-03-24 06:06:23.46978	2023-03-24 06:06:23.46978	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
68	7182-198298-8553	2023-03-24	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	SINGLE_VISIT	2023-03-24	2023-03-24	11:40	16:00	2023-03-24 06:05:37.789672	2023-03-24 06:05:37.789672	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
70	7182-167603-5255	2023-03-24	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	SINGLE_VISIT	2023-03-24	2023-03-24	11:59	15:59	2023-03-24 07:03:45.89856	2023-03-24 07:03:45.89856	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
71	7182-167603-5255	2023-03-24	1	18803b4e-6683-11ed-b767-0242ac110002	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	SINGLE_VISIT	2023-03-24	2023-03-24	11:59	15:59	2023-03-24 07:03:45.89856	2023-03-24 07:03:45.89856	REQUEST_FAILED	\N	\N	\N	\N	\N	\N	\N	f
72	7182-111713-4327	2023-03-24	5	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	RECURRING_VISIT	2023-03-24	2023-04-24	19:00	23:00	2023-03-24 13:56:05.088907	2023-03-24 13:56:05.088907	ACCEPTED	\N	\N	\N	\N	{0}	{2023-03-26,2023-04-02,2023-04-09,2023-04-16,2023-04-23}	\N	f
73	7182-111080-8508	2023-03-24	5	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	RECURRING_VISIT	2023-03-24	2023-04-24	10:00	14:00	2023-03-24 13:57:52.787806	2023-03-24 13:57:52.787806	ACCEPTED	\N	\N	\N	\N	{0}	{2023-03-26,2023-04-02,2023-04-09,2023-04-16,2023-04-23}	\N	f
74	7182-111655-1167	2023-03-24	10	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	RECURRING_VISIT	2023-03-24	2023-04-24	14:00	18:00	2023-03-24 14:01:28.67134	2023-03-24 14:01:28.67134	ACCEPTED	\N	\N	\N	\N	{0,1}	{2023-03-26,2023-03-27,2023-04-02,2023-04-03,2023-04-09,2023-04-10,2023-04-16,2023-04-17,2023-04-23,2023-04-24}	\N	f
75	7182-111847-6640	2023-03-24	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	SINGLE_VISIT	2023-03-24	2023-03-24	10:00	11:00	2023-03-24 14:05:01.440961	2023-03-24 14:05:01.440961	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
62	7185-237970-2140	2023-03-16	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	SINGLE_VISIT	2023-03-16	2023-03-16	14:00	16:00	2023-03-16 07:21:52.96104	2023-03-16 07:21:52.96104	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
61	7185-237052-0625	2023-03-16	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	SINGLE_VISIT	2023-03-16	2023-03-16	12:00	13:00	2023-03-16 07:21:29.249962	2023-03-16 07:21:29.249962	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
63	7185-283801-4559	2023-03-16	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	SINGLE_VISIT	2023-03-16	2023-03-16	19:38	23:38	2023-03-16 14:08:46.088633	2023-03-16 14:08:46.088633	ACCEPTED	\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- Data for Name: appointment_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_sessions (appointment_session_id, appointment_id, appointment_actual_end_time, appointment_actual_start_time, appointment_booked_end_time, appointment_booked_start_time, appointment_date, appointment_session, appointment_slot_time, appointment_session_status, created_at, updated_at, appointment_session_cancelled_by, appointment_actual_end_time_with_date, appointment_actual_start_time_with_date, appoinment_cancel_comments, appointment_session_user_reason) FROM stdin;
40	31	15:30	12:45	16:00	11:40	2023-03-24	1	11:40	COMPLETED	2023-03-24 06:30:24.214255	2023-03-24 06:30:24.214255	\N	2023-03-24 10:00:50.916541	2023-03-24 07:15:06.075717	\N	\N
39	30	18:59	15:25	22:00	16:40	2023-03-24	1	16:40	COMPLETED	2023-03-24 06:11:49.509465	2023-03-24 06:11:49.509465	\N	2023-03-24 13:29:21.009674	2023-03-24 09:55:46.348188	\N	\N
42	33	\N	\N	23:00	19:00	2023-03-26	1	19:00	UPCOMING	2023-03-24 13:56:26.238466	2023-03-24 13:56:26.238466	\N	\N	\N	\N	\N
43	33	\N	\N	23:00	19:00	2023-04-02	2	19:00	UPCOMING	2023-03-24 13:56:26.238466	2023-03-24 13:56:26.238466	\N	\N	\N	\N	\N
44	33	\N	\N	23:00	19:00	2023-04-09	3	19:00	UPCOMING	2023-03-24 13:56:26.238466	2023-03-24 13:56:26.238466	\N	\N	\N	\N	\N
45	33	\N	\N	23:00	19:00	2023-04-16	4	19:00	UPCOMING	2023-03-24 13:56:26.238466	2023-03-24 13:56:26.238466	\N	\N	\N	\N	\N
34	25	\N	15:51	16:00	14:00	2023-03-16	1	14:00	STARTED	2023-03-16 09:08:33.950455	2023-03-16 09:08:33.950455	\N	\N	2023-03-16 10:21:35.417073	\N	\N
35	26	\N	15:54	13:00	12:00	2023-03-16	1	12:00	STARTED	2023-03-16 09:37:44.303599	2023-03-16 09:37:44.303599	\N	\N	2023-03-16 10:24:07.42232	\N	\N
36	27	\N	\N	23:38	19:38	2023-03-16	1	19:38	UPCOMING	2023-03-16 14:13:08.772911	2023-03-16 14:13:08.772911	\N	\N	\N	\N	\N
46	33	\N	\N	23:00	19:00	2023-04-23	5	19:00	UPCOMING	2023-03-24 13:56:26.238466	2023-03-24 13:56:26.238466	\N	\N	\N	\N	\N
47	34	\N	\N	14:00	10:00	2023-03-26	1	10:00	UPCOMING	2023-03-24 13:58:10.041088	2023-03-24 13:58:10.041088	\N	\N	\N	\N	\N
48	34	\N	\N	14:00	10:00	2023-04-02	2	10:00	UPCOMING	2023-03-24 13:58:10.041088	2023-03-24 13:58:10.041088	\N	\N	\N	\N	\N
49	34	\N	\N	14:00	10:00	2023-04-09	3	10:00	UPCOMING	2023-03-24 13:58:10.041088	2023-03-24 13:58:10.041088	\N	\N	\N	\N	\N
50	34	\N	\N	14:00	10:00	2023-04-16	4	10:00	UPCOMING	2023-03-24 13:58:10.041088	2023-03-24 13:58:10.041088	\N	\N	\N	\N	\N
51	34	\N	\N	14:00	10:00	2023-04-23	5	10:00	UPCOMING	2023-03-24 13:58:10.041088	2023-03-24 13:58:10.041088	\N	\N	\N	\N	\N
52	35	\N	\N	18:00	14:00	2023-03-26	1	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
53	35	\N	\N	18:00	14:00	2023-03-27	2	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
54	35	\N	\N	18:00	14:00	2023-04-02	3	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
37	28	18:12	15:02	16:00	11:30	2023-03-21	1	11:30	COMPLETED	2023-03-21 07:46:15.84769	2023-03-21 07:46:15.84769	\N	2023-03-21 12:42:44.255329	2023-03-21 09:32:36.724984	\N	\N
38	29	\N	\N	11:00	10:00	2022-11-19	1	10:00	UPCOMING	2023-03-24 05:58:15.198969	2023-03-24 05:58:15.198969	\N	\N	\N	\N	\N
55	35	\N	\N	18:00	14:00	2023-04-03	4	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
56	35	\N	\N	18:00	14:00	2023-04-09	5	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
57	35	\N	\N	18:00	14:00	2023-04-10	6	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
41	32	15:27	\N	15:59	11:59	2023-03-24	1	11:59	COMPLETED	2023-03-24 07:11:00.960072	2023-03-24 07:11:00.960072	\N	2023-03-24 09:57:36.26314	\N	\N	\N
58	35	\N	\N	18:00	14:00	2023-04-16	7	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
59	35	\N	\N	18:00	14:00	2023-04-17	8	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
60	35	\N	\N	18:00	14:00	2023-04-23	9	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
61	35	\N	\N	18:00	14:00	2023-04-24	10	14:00	UPCOMING	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	\N	\N	\N	\N	\N
62	36	\N	\N	11:00	10:00	2023-03-24	1	10:00	UPCOMING	2023-03-24 14:05:16.437264	2023-03-24 14:05:16.437264	\N	\N	\N	\N	\N
\.


--
-- Data for Name: appointment_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_slots (slot_id, slots) FROM stdin;
1	{00:00,01:00,02:00,03:00,04:00,05:00,06:00,07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00,18:00,19:00,20:00,21:00,22:00,23:00}
\.


--
-- Data for Name: appointment_slots_nurse_default; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_slots_nurse_default (slot_id, nurse_id, slot_frequency, slots, created_at, updated_at) FROM stdin;
1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	{MON,TUE,WED}	{00:00,01:00,02:00,03:00,04:00,05:00,06:00,07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00,18:00,19:00,20:00,21:00,22:00,23:00}	2022-10-14 12:32:48.884814	2022-10-14 12:32:48.884814
\.


--
-- Data for Name: appointment_slots_nurse_specific; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointment_slots_nurse_specific (slot_id, nurse_id, slot_date, slots, created_at, updated_at) FROM stdin;
1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2022-10-20	{00:00,01:00,02:00,03:00,04:00,05:00,06:00,07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00,18:00,19:00,20:00,21:00,22:00,23:00}	2022-10-14 12:32:55.993117	2022-10-14 12:32:55.993117
\.


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (appointment_id, booking_id, appointment_date, appointment_status, appointment_session_count, nurse_id, patient_id, user_id, created_at, updated_at, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_patient_symptoms, appointment_specific_request, patient_booking_status) FROM stdin;
33	7182-111713-4327	2023-03-24	ACCEPTED	5	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-03-24 13:56:26.238466	2023-03-24 13:56:26.238466	RECURRING_VISIT	2023-03-24	2023-04-24	\N	\N	f
34	7182-111080-8508	2023-03-24	ACCEPTED	5	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-03-24 13:58:10.041088	2023-03-24 13:58:10.041088	RECURRING_VISIT	2023-03-24	2023-04-24	\N	\N	f
35	7182-111655-1167	2023-03-24	ACCEPTED	10	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-03-24 14:04:03.069293	2023-03-24 14:04:03.069293	RECURRING_VISIT	2023-03-24	2023-04-24	\N	\N	f
36	7182-111847-6640	2023-03-24	ACCEPTED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-03-24 14:05:16.437264	2023-03-24 14:05:16.437264	SINGLE_VISIT	2023-03-24	2023-03-24	\N	\N	f
25	7185-237970-2140	2023-03-16	COMPLETED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2023-03-16 09:08:33.950455	2023-03-16 09:08:33.950455	SINGLE_VISIT	2023-03-16	2023-03-16	\N	\N	f
26	7185-237052-0625	2023-03-16	COMPLETED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2023-03-16 09:37:44.303599	2023-03-16 09:37:44.303599	SINGLE_VISIT	2023-03-16	2023-03-16	\N	\N	f
27	7185-283801-4559	2023-03-16	COMPLETED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2023-03-16 14:13:08.772911	2023-03-16 14:13:08.772911	SINGLE_VISIT	2023-03-16	2023-03-16	\N	\N	f
28	7182-985643-8508	2023-03-21	COMPLETED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-03-21 07:46:15.84769	2023-03-21 07:46:15.84769	SINGLE_VISIT	2023-03-21	2023-03-21	\N	\N	f
29	7182-943149-6591	2022-11-19	COMPLETED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2023-03-24 05:58:15.198969	2023-03-24 05:58:15.198969	SINGLE_VISIT	2022-11-19	2022-11-19	\N	\N	f
30	7182-198259-6128	2023-03-24	COMPLETED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-03-24 06:11:49.509465	2023-03-24 06:11:49.509465	SINGLE_VISIT	2023-03-24	2023-03-24	\N	\N	f
31	7182-198298-8553	2023-03-24	COMPLETED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	d29e837b-44d2-4c59-9100-c6471a1ba5e6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-03-24 06:30:24.214255	2023-03-24 06:30:24.214255	SINGLE_VISIT	2023-03-24	2023-03-24	\N	\N	f
32	7182-167603-5255	2023-03-24	COMPLETED	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2e94a0f5-2662-4d50-a379-f02e93f9f464	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2023-03-24 07:11:00.960072	2023-03-24 07:11:00.960072	SINGLE_VISIT	2023-03-24	2023-03-24	\N	\N	f
\.


--
-- Data for Name: end_otp_for_appointment_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.end_otp_for_appointment_session (end_otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) FROM stdin;
1	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	37	$2a$10$diWcysJMM/84dIDwop431euxn1R8V27th8zjOIBFOjjRPA61me8Q2	2023-03-21 09:33:56.069254
14	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	919916522058	41	$2a$10$KuHbdc.zavpxcmS.f4ydKO4xlMsAUbsqdaYJBS780W4PlgfxC5Etm	2023-03-24 09:42:12.76587
16	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	40	$2a$10$vkVFae3OTapK.scGD9OjhO9On9N0aL7R.3ju8PFXmKbroSvC.ZFsC	2023-03-24 09:43:23.411699
13	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	39	$2a$10$c1fjjJYcDs3Xncqvhnice.YujBWPcCs5XBvc1J7KwVxwoV4U61uMq	2023-03-24 09:40:44.427944
\.


--
-- Data for Name: nurse_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_address (nurse_address_id, nurse_id, nurse_address_type, nurse_area, nurse_city, nurse_door_no_block, nurse_pincode, nurse_road, nurse_state, nurse_street) FROM stdin;
3879389c-71c2-41b2-ae0d-66b8826841b4	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	Home	6th Avenue	Chennai	601	600001	2nd Main Road	TamilNadu	5th Street
\.


--
-- Data for Name: nurse_appointment_complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_appointment_complaint (nurse_appointment_complaint_id, nurse_id, patient_id, appointment_session_id, nurse_complaint_reason, complaint_comments, complaint_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nurse_document_proof; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_document_proof (nurse_document_proof_id, nurse_id, adhar_proof_file_name, address_proof_file_name, photo_file_name, experience_certificate_file_name, agreement_file_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nurse_earnings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_earnings (nurse_earnings_id, nurse_id, appointment_id, appointment_session_id, booking_id, nurse_earning, payment_method, created_at, updated_at, payment_received_date, payment_status) FROM stdin;
6	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	29	38	7182-943149-6591	500	GPAY	2023-03-24 06:21:31.449168	2023-03-24 06:21:31.449168	\N	PAYMENT_PENDING
8	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	27	36	7185-283801-4559	500	GPAY	2023-03-24 06:26:00.142957	2023-03-24 06:26:00.142957	\N	PAYMENT_PENDING
9	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	32	41	7182-167603-5255	500	GPAY	2023-03-24 07:11:51.530666	2023-03-24 07:11:51.530666	2023-03-24	PAYMENT_COMPLETE
\.


--
-- Data for Name: nurse_education; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_education (nurse_education_id, nurse_education_name) FROM stdin;
1	Medical Graduate
\.


--
-- Data for Name: nurse_fees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_fees (nurse_fees_id, nurse_id, minimum_distance, distance_unit, minimum_session_fee, session_fee_currency, charges_for_extra_distance) FROM stdin;
1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	10	KM	500	INR	100
13	18803b4e-6683-11ed-b767-0242ac110002	10	KM	500	INR	100
\.


--
-- Data for Name: nurse_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_notifications (nurse_notifications_id, nurse_id, nurse_notifications_subject, appointment_session_id, notification_date, created_at, updated_at, is_read) FROM stdin;
11	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	Your appointment is completed	2	2023-03-20	2023-03-20 05:57:43.619245	2023-03-20 05:57:43.619245	t
12	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	Your appointment is completed	2	2023-03-20	2023-03-20 05:58:47.643863	2023-03-20 05:58:47.643863	t
\.


--
-- Data for Name: nurse_profile_visit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) FROM stdin;
1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-02-07	2023-02-07 15:08:20.465986	2023-02-07 15:08:20.465986	2023-02-07 15:08:20.465986
3	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-01-07	2023-02-07 15:12:24.046433	2023-02-07 15:12:24.046433	2023-02-07 15:12:24.046433
4	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	4294ebd4-3498-4a23-bd89-87c126483cf9	2022-01-07	2023-02-07 15:54:55.694543	2023-02-07 15:54:55.694543	2023-02-07 15:54:55.694543
5	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-02-08	2023-02-08 13:15:33.518739	2023-02-08 13:15:33.518739	2023-02-08 13:15:33.518739
6	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	4294ebd4-3498-4a23-bd89-87c126483cf9	2023-02-08	2023-02-08 13:15:57.48595	2023-02-08 13:15:57.48595	2023-02-08 13:15:57.48595
7	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	654bbd67-f821-488f-afa7-c89541040950	2023-02-28	2023-02-28 12:41:41.728944	2023-02-28 12:41:41.728944	2023-02-28 12:41:41.728944
8	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	654bbd67-f821-488f-afa7-c89541040950	2023-02-28	2023-02-28 12:41:42.422338	2023-02-28 12:41:42.422338	2023-02-28 12:41:42.422338
9	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	654bbd67-f821-488f-afa7-c89541040950	2023-02-28	2023-02-28 12:53:34.13066	2023-02-28 12:53:34.13066	2023-02-28 12:53:34.13066
10	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	654bbd67-f821-488f-afa7-c89541040950	2023-02-28	2023-02-28 12:53:34.435073	2023-02-28 12:53:34.435073	2023-02-28 12:53:34.435073
\.


--
-- Data for Name: nurse_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_ratings (nurse_ratings_id, nurse_id, patient_id, user_id, appointment_id, appointment_session_id, nurse_rating, nurse_rating_comments, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nurse_service_type_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) FROM stdin;
1	HOUSE_HOLD_TASKS	House Hold Tasks	House Hold and More
2	PERSONAL_CARE	Personal Care	Personal Care and More
3	COMPANION_SHIP	Companionship	Companionship and More
4	TRANSPORTATION	Transportation	Transportation and More
5	MOBILITY_ASSISTANCE	Mobility Assistance	Mobility Assistance and More
6	SPECIALIZED_CARE	Specialized Care	Specialized Care and More
7	PHYSICAL_EXAMINATIONS	Physical Examinations	Physical Examinations and More
8	NURSE_CONSULTATIONS	Nurse Consultations	Physical Examinations and More
\.


--
-- Data for Name: nurse_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_settings (nurse_settings_id, nurse_id, nurse_language, notifications_on, whatsapp_alerts_on, created_at, updated_at) FROM stdin;
1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	English	t	t	2023-01-16 08:46:17.417661	2023-01-19 09:36:14.58649
\.


--
-- Data for Name: nurse_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_skills (nurse_skill_id, nurse_skill_name) FROM stdin;
1	Certified Home Health Aide
\.


--
-- Data for Name: nurse_slots_recurring; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurse_slots_recurring (slot_id, nurse_id, slot_frequency, slot_start_time, slot_end_time, created_at, updated_at) FROM stdin;
1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	{SUN,MON,TUE}	10:00	18:00	2022-10-30 15:44:07.0442	2022-10-30 15:44:07.0442
\.


--
-- Data for Name: nurses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) FROM stdin;
f72fc29e-cdc5-48e2-87f4-b7330449f0c4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	91566202701	2023-01-13 06:17:49.681459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
18803b4e-6683-11ed-b767-0242ac110002	24	1997-01-01	def@elite.com	\N	MALE	\N	13.121699	1,2nd Street,Anna Nagar	80.201	YYY	\N	918144528548	2022-11-17 14:22:23.40142	2022-11-17 14:22:23.40142	0101000020E6100000F13F4349920D544048DFA46950482A40	NURSE	4	5	6	918144528548	t	t	Mrs.YYY is a well experienced nurse in Cardio	{Tamil,English,Hindi}	{HOUSE_HOLD_TASKS,PERSONAL_CARE}	1	1	t	\N	f
ee58f1f1-eb8b-4567-a15d-ddfc670252d6	23	1997-01-01	abc@elite.com		MALE		13.121699	2nd Street Iyappa Nagar	80.201	Attendar1	$2a$10$KJPTI8YlL.DHPY3XqtrOwO5o.G.FrCMk2WZn7fD3TazZIeSO/gxYW	919566202701	2022-08-25 06:59:59.145	2022-08-25 06:59:59.145	0101000020E6100000BE9F1A2FDD0C54406CE9D1544F3E2A40	NURSE	4.5	5	4	919566202701	t	t	Mrs.XYZ is a well experienced nurse in Cardio	{Tamil,English,Hindi}	{HOUSE_HOLD_TASKS,PERSONAL_CARE}	1	1	t	profile.jpg	f
c28ca255-0532-4e81-8af7-936c404861d6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9566202701	2023-03-02 10:41:59.820467	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
3c8190e8-c81d-4ee8-93d4-bcc7718b255e	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	919943960728	2023-03-13 05:53:08.909151	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
4763e8bb-eee2-4e92-afa5-39ca60c08bc7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	6957917529	2023-03-13 05:57:08.376819	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
7614fd8c-bbf3-492a-8a02-4b4f65accbe1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1318625477	2023-03-14 09:10:08.21405	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
aeda27c9-7c92-4b81-9448-b307062c8c4f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	919916522058	2023-03-15 12:05:18.03733	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- Data for Name: nurses_service_type_subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nurses_service_type_subscription (nurses_service_type_subscription_id, nurse_service_type_value_id, nurse_id) FROM stdin;
1	1	ee58f1f1-eb8b-4567-a15d-ddfc670252d6
2	2	ee58f1f1-eb8b-4567-a15d-ddfc670252d6
\.


--
-- Data for Name: otp_for_appointment_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) FROM stdin;
1	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	19	$2a$10$cyCVaXoRhkKaFIibQZcHr.Hllf2MKv41bcx8QDzrL7.DGIV86oicq	2022-12-31 05:14:15.666502
11	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	17	$2a$10$3XN7laITJgPmcbVZym.a9Oump9PeZy.xDJKp/Ka6ZjE1xoHsCwH4.	2023-01-02 09:46:47.604663
12	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	18	$2a$10$UMH1sfKEwbuEkSuqyRSCd.F4GONL3Pt/2tj8.saEwwSisMXT5ujxa	2023-01-02 09:48:55.76556
16	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	919916522058	26	$2a$10$5UCqtsEssE/ciWqf10ZbJuqOB01XDAHrjXi2Q/yQuAUOULrIaxb4q	2023-03-08 09:54:03.469795
17	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	919916522058	28	$2a$10$SSellRECyBASOuMPW3G3geujnBZSZ1XO3X.RE5hBCc3o/49/jcw7a	2023-03-14 11:29:20.176434
25	53645460-2c17-4518-b883-4f940980c5cd	919566202701	29	$2a$10$22vvzVU0GZRwUdwwCLZa2.PMPUikVgc3T0lME7uo9GNiQgBwS.Rgi	2023-03-15 12:22:30.872235
29	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	919916522058	35	$2a$10$TVLdzH65vWx0wHxSRcMp7OqzLi1NWhWVIEMQuImmN6wblQzq6.uxW	2023-03-16 10:19:36.930384
26	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	919916522058	34	$2a$10$8T1ifE/g7dtdnvpmfAJUd.Ie1c6zThl6BrEOVWxMkxNWXIk0cZCaC	2023-03-16 09:24:48.959865
35	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	37	$2a$10$lGpbrQjQGTsWk2G3Mv7OluVkL..geFyMd/aNoct9reb9JXKApn1d.	2023-03-21 09:32:11.207795
49	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	40	$2a$10$z2jNSKYW/3hX/O/x3njHzuDG6KoI5Iug3xRAd5DecEv8eXU4FCQZ6	2023-03-24 07:14:53.293353
48	4294ebd4-3498-4a23-bd89-87c126483cf9	918144528548	39	$2a$10$QaGd.Q20kX3FIV1GE0FNJOZCUY2vGRUEIEBdBBUxumtZyKRnmfdBa	2023-03-24 07:09:40.8669
\.


--
-- Data for Name: otp_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otp_phone (user_phone, otp, created_at) FROM stdin;
91566202701	$2a$10$3gEnyqKoICpCeqVU6TqdJuHLwWviGuEaCLlWLsyPsGIaRMgC1ltKG	2022-12-15 12:33:08.001039
919566202701	$2a$10$NNA3irNDsFfWZv8.bjauOefnQTZ93t4GYylw3jhiH6d/B14I2oi6a	2022-12-11 08:28:42.590945
9943960728	$2a$10$pDVCLcb/tngKfDejBiD4U.dHq7j0antPZsof0UqvTGSFMBatdyZx6	2023-02-27 09:19:20.965971
9195662027	$2a$10$i/pHV9jPN18GrzehxsmiieMNsj2qWh99gw2a7t989QypMMgPBK742	2023-02-27 10:13:30.336539
9916522056	$2a$10$u59D2jpeefhmzOV/XeAvBOfHV3f8LX9JQJWxLhLAv423v4/CtBUaa	2023-02-28 12:19:01.946539
2256520557	$2a$10$gsLY59WWC2VSiqLN57WHROXvBjY/QRgEDHRNCZJQUR5oICsfW8sE.	2023-03-16 14:11:53.585729
918144528548	$2a$10$CUNsgcqT3O1wwUX7NflDHuUQzQfWduiVNJgMCna9dfcJWyRYWGxAW	2022-12-30 05:22:49.053329
6957917529	$2a$10$siXCTAMMMtnt6/DNe/XrOe85qyEd7LWkIsMPxUnpfxRldTgBwC1A6	2023-03-13 05:57:08.528167
919916522058	$2a$10$81I.7NtjNQzHM8isBjqpDeLzLWhkFXGttlqaCsESb8Z.tirWr3YyG	2023-02-28 13:41:23.90021
919916522054	$2a$10$dbI32pQ7T6k.u6wPt4EXreRek4AtKeKdUnAgFKQkKaN2Dt3ujs4VG	2023-03-17 09:41:34.338418
919916522051	$2a$10$OIBuWGX06s3DTyrPq4IALus8hQOJOEvd2PIQJ2IojM2sBXXk.8see	2023-02-28 14:26:48.267474
919926522058	$2a$10$Cb..xckQyWF0h8fdOdeU5e9omrQcKjahpnLYe0LlY0UCarHvjO4HK	2023-03-13 04:50:19.350264
919943960728	$2a$10$bHNGVo3bgY9WWTO1IjO6lOtmuDZONVit8nicQCitNIruSmfkpJRSm	2023-03-13 05:53:09.057664
1318625477	$2a$10$OT8JL2p8ra/.ov6aT9NAwuWsd5Ys4ku3tgibNepxcWFC78HSQgjIW	2023-03-14 09:10:08.312844
9916522058	$2a$10$STIyq/JV6yzXDhBdlM9vKOCEoI9uYe5Dg5uWlEz0l1F2d13gYaz/a	2023-02-27 09:15:38.782763
919916522053	$2a$10$WF5KzywF3h7gOVf9yfjGCe5XimL6eI1WERG6eRAUWSSivB5Lg8d0S	2023-03-03 06:23:06.027404
9566202701	$2a$10$.SPR.xkelSAupYLW5DwP1OMfc1rY8xhkGeHwsEFvlFGV2xyYfWOnC	2023-02-27 09:54:56.20644
\.


--
-- Data for Name: patient_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient_ratings (patient_ratings_id, patient_id, nurse_id, user_id, appointment_id, appointment_session_id, patient_rating, patient_rating_comments, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) FROM stdin;
795c5e29-37d9-46a5-a3d7-3ebd05998bb0	20	2002-02-01	\N	\N	FEMALE	\N	\N	\N	\N	YYY	919566202701	\N	\N	53645460-2c17-4518-b883-4f940980c5cd	\N	\N	\N	SELF	919566202701	\N	\N
c0e1b0a4-b5ac-40d9-8528-aa743860ce37	21	2002-01-01	\N	\N	MALE	\N	\N	\N	\N	xxx	91566202702	\N	\N	53645460-2c17-4518-b883-4f940980c5cd	\N	\N	\N	PARENTS	91566202702	\N	\N
d29e837b-44d2-4c59-9100-c6471a1ba5e6	55	1977-01-01	devi@email.com	\N	MALE	\N	\N	\N	\N	YYY	918144528548	\N	\N	4294ebd4-3498-4a23-bd89-87c126483cf9	t	\N	\N	SELF	\N	\N	profile.jpg
4f883eea-74df-4a4b-af79-7e03da6093c5	21	2002-01-01	abc@elite.com	\N	MALE	\N	\N	\N	\N	xxx	9943960728	\N	\N	e2e89481-a51a-43b0-b79c-ba66cfec4064	\N	\N	\N	PARENTS	9943960728	\N	\N
fd1b5a82-3254-4a40-8a9d-cdc9351ef9ba	21	2002-01-01	abc@elite.com	\N	Male	\N	\N	\N	\N	Nadan	9916522058	\N	\N	654bbd67-f821-488f-afa7-c89541040950	\N	\N	\N	SELF	9916522058	\N	\N
f0b67253-9513-45de-8770-1fff7571f720	13	2009-04-02		\N	Male	\N	\N	\N	\N	Shree	9916522056	\N	\N	c6d7dc7d-734a-4e67-bb74-50295d972a49	\N	\N	\N	SELF	9916522056	\N	\N
e5e000c1-584b-4a41-ba46-6b036c5cf0b6	22	2000-10-02		\N	Male	\N	\N	\N	\N	Elite 3	919916522051	\N	\N	7d82d0fc-8f44-40a7-9cfe-d078ef627a3b	\N	\N	\N	SELF	919916522051	\N	\N
b70efebf-2151-476e-a91c-f8996c95c5f7	21	2002-01-01	abc@elite.com	\N	MALE	\N	\N	\N	\N	Etlite 3	919916522053	\N	\N	0f1e64ba-8f5c-462d-8cd4-0b804099f457	\N	\N	\N	SELF	919916522053	\N	\N
2e94a0f5-2662-4d50-a379-f02e93f9f464	21	2002-01-01		\N	MALE	\N	\N	\N	\N	Elite 58	919916522058	\N	\N	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	\N	\N	\N	SELF	919916522058	\N	profile.jpg
41745900-cece-42fd-b474-7fbbf4a12aad	13	2009-09-03		\N	Male	\N	\N	\N	\N	Elite 54	919916522054	\N	\N	a1bee6d7-2775-45e2-875b-1dd786ead852	\N	\N	\N	SELF	919916522054	\N	profile.jpg
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (payment_id, user_id, patient_id, booking_id, payment_method, appointment_session_count, fees_per_session, total_payment_amount, created_at, updated_at, appoinment_id, payment_date) FROM stdin;
4	4294ebd4-3498-4a23-bd89-87c126483cf9	d29e837b-44d2-4c59-9100-c6471a1ba5e6	7184-001696-3023	GPAY	3	500	1500	2023-02-18 14:04:38.95904	2023-02-18 14:04:38.95904	10	\N
5	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2e94a0f5-2662-4d50-a379-f02e93f9f464	7188-327550-2356	GPAY	1	500	500	2023-02-28 13:45:16.752568	2023-02-28 13:45:16.752568	15	\N
20	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2e94a0f5-2662-4d50-a379-f02e93f9f464	7185-018640-4846	GPAY	1	500	500	2023-03-08 09:25:43.881771	2023-03-08 09:25:43.881771	19	\N
21	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2e94a0f5-2662-4d50-a379-f02e93f9f464	7185-824279-5983	GPAY	1	500	500	2023-03-14 11:00:10.773668	2023-03-14 11:00:10.773668	21	\N
22	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2e94a0f5-2662-4d50-a379-f02e93f9f464	7185-237970-2140	GPAY	1	500	500	2023-03-16 09:36:52.471568	2023-03-16 09:36:52.471568	25	\N
26	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2e94a0f5-2662-4d50-a379-f02e93f9f464	7185-237052-0625	GPAY	1	500	500	2023-03-17 09:51:38.03779	2023-03-17 09:51:38.03779	26	\N
27	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2e94a0f5-2662-4d50-a379-f02e93f9f464	7185-283801-4559	GPAY	1	500	500	2023-03-17 09:51:56.476324	2023-03-17 09:51:56.476324	27	\N
28	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2e94a0f5-2662-4d50-a379-f02e93f9f464	7182-943149-6591	GPAY	1	500	500	2023-03-24 06:21:31.446492	2023-03-24 06:21:31.446492	29	2023-03-24
30	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	2e94a0f5-2662-4d50-a379-f02e93f9f464	7182-167603-5255	GPAY	1	500	500	2023-03-24 07:11:51.528454	2023-03-24 07:11:51.528454	32	2023-03-24
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: total_visit_count; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.total_visit_count (count) FROM stdin;
2
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) FROM stdin;
6e0a77bb-dcfc-4562-a1e7-3f7e8ade52cf	53645460-2c17-4518-b883-4f940980c5cd	Chennai	600012	TamilNadu	795c5e29-37d9-46a5-a3d7-3ebd05998bb0	21st Street	81.201	14.121699	0101000020E61000006CE9D1544F3E2C40BE9F1A2FDD4C5440	cdf location
1fe15723-25ae-4232-9835-4ce3ca1af342	53645460-2c17-4518-b883-4f940980c5cd	Chennai	600099	TamilNadu	c0e1b0a4-b5ac-40d9-8528-aa743860ce37	1st Street	80.201	13.121699	0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440	abc location
91b4e3ff-877a-49d1-b094-a59fe43d2ce3	4294ebd4-3498-4a23-bd89-87c126483cf9	Chennai	600012	TamilNadu	d29e837b-44d2-4c59-9100-c6471a1ba5e6	21st Street	81.201	14.121699	0101000020E61000006CE9D1544F3E2C40BE9F1A2FDD4C5440	cdf location
88ef520a-74ce-46ab-8ad8-86bb68d6e51c	e2e89481-a51a-43b0-b79c-ba66cfec4064	Chennai	600099	TamilNadu	4f883eea-74df-4a4b-af79-7e03da6093c5	1st Street	80.201	13.121699	0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440	abc location
2aed0409-b94b-4247-83fc-941d5c7dd219	654bbd67-f821-488f-afa7-c89541040950	Chennai	600099	TamilNadu	fd1b5a82-3254-4a40-8a9d-cdc9351ef9ba	1st Street	80.201	13.121699	0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440	
88c8ea6e-a6db-4ee1-9e02-7e2bc456a8b1	c6d7dc7d-734a-4e67-bb74-50295d972a49	Chennai 	600036	tamilnadu	f0b67253-9513-45de-8770-1fff7571f720	Ragavan Colony,West jafferkanpet	52.216515699999995	6.9459706	0101000020E6100000F5E85784ACC81B40074955C9B61B4A40	Ragavan Colony,West jafferkanpet
e64ad557-fdd3-4a0c-9156-b81ab5691999	7d82d0fc-8f44-40a7-9cfe-d078ef627a3b	chennai	600036	Tamilnadu	e5e000c1-584b-4a41-ba46-6b036c5cf0b6	Ragavan colony, Ashok pillar	52.216515699999995	6.9459706	0101000020E6100000F5E85784ACC81B40074955C9B61B4A40	Ragavan colony, Ashok pillar
eeb8ab47-a10c-431c-82f6-a42ae2e95db6	0f1e64ba-8f5c-462d-8cd4-0b804099f457	Chennai	600099	TamilNadu	b70efebf-2151-476e-a91c-f8996c95c5f7	1st Street	80.201	13.121699	0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440	abc location
0300e3cc-1b61-4e09-870b-11da9bb84c36	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	Chennai	600099	tamilnadu	2e94a0f5-2662-4d50-a379-f02e93f9f464	Raghavan Colony,jaferkanpet	52.216515699999995	13.121699	0101000020E61000006CE9D1544F3E2A40074955C9B61B4A40	Raghavan Colony,jaferkanpet
67227c8d-5e11-47c9-80cf-78e88b88e782	a1bee6d7-2775-45e2-875b-1dd786ead852	Chennai	600038	tamilnadu	41745900-cece-42fd-b474-7fbbf4a12aad	Raghavan Colony,jaferkanpet	52.216515699999995	6.9459706	0101000020E6100000F5E85784ACC81B40074955C9B61B4A40	
\.


--
-- Data for Name: user_appointment_complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_appointment_complaint (user_appointment_complaint_id, user_id, nurse_id, appointment_session_id, user_complaint_reason, complaint_comments, complaint_date, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_favourites (user_favourites_id, user_id, nurse_id, created_at, updated_at) FROM stdin;
3	4294ebd4-3498-4a23-bd89-87c126483cf9	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-01-18 11:50:52.656306	2023-01-18 11:50:52.656306
7	53645460-2c17-4518-b883-4f940980c5cd	ee58f1f1-eb8b-4567-a15d-ddfc670252d6	2023-01-18 11:58:38.078745	2023-01-18 11:58:38.078745
9	53645460-2c17-4518-b883-4f940980c5cd	18803b4e-6683-11ed-b767-0242ac110002	2023-01-19 04:37:23.943819	2023-01-19 04:37:23.943819
\.


--
-- Data for Name: user_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_notifications (user_notifications_id, user_id, user_notifications_subject, appointment_session_id, notification_date, created_at, updated_at, is_read) FROM stdin;
11	4294ebd4-3498-4a23-bd89-87c126483cf9	Your appointment is completed	4	2023-03-08	2023-03-08 08:19:30.317762	2023-03-08 08:19:30.317762	t
12	d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	Your appointment is completed	4	2023-03-13	2023-03-13 13:36:12.045018	2023-03-13 13:36:12.045018	t
\.


--
-- Data for Name: user_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_ratings (user_ratings_id, nurse_id, patient_id, user_id, appointment_id, appointment_session_id, user_rating, user_rating_comments, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_settings (user_settings_id, user_id, user_language, notifications_on, whatsapp_alerts_on, created_at, updated_at) FROM stdin;
1	53645460-2c17-4518-b883-4f940980c5cd	English	t	t	2023-01-16 10:09:03.527765	2023-01-16 10:09:03.527765
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) FROM stdin;
53645460-2c17-4518-b883-4f940980c5cd	20	2002-02-01	\N	xxx	FEMALE	yyy	80.201	abc location	13.121699	YYY	$2a$10$kLYwKtIBEP7LjAY31tEEzeALSsJ.hk49Nip/2Ixemc/J7jbck1oyO	919566202701	2022-12-13 13:18:03.435177	\N	0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440	\N	919566202701	\N	f
9326c643-b32c-4e0a-b483-373d56139772	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	91566202701	2022-12-15 12:33:07.902547	\N	0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440	\N	\N	\N	f
4294ebd4-3498-4a23-bd89-87c126483cf9	55	1977-01-01	xyz@elite.com	\N	MALE	\N	\N	\N	\N	XYZ	\N	918144528548	2022-08-31 13:20:59.248	2022-08-31 13:20:59.248	0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440	4.5	918144528548	profile.jpg	f
504f834c-f9e0-4362-bbdd-9541c4c061eb	20	2002-02-01	\N	xxx	FEMALE	yyy	80.201	abc location	13.121699	YYY	$2a$10$kLYwKtIBEP7LjAY31tEEzeALSsJ.hk49Nip/2Ixemc/J7jbck1oyO	919566202702	2022-12-13 13:18:03.435177	\N	0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440	\N	919566202702	\N	f
e2e89481-a51a-43b0-b79c-ba66cfec4064	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9943960728	2023-02-27 09:34:19.841433	\N	\N	\N	\N	\N	f
654bbd67-f821-488f-afa7-c89541040950	21	2002-01-01	abc@elite.com	\N	Male	\N	\N	\N	\N	Nadan	\N	9916522058	2023-02-27 09:15:38.679659	\N	\N	\N	9916522058	profile.jpg	f
c6d7dc7d-734a-4e67-bb74-50295d972a49	13	2009-04-02		\N	Male	\N	\N	\N	\N	Shree	\N	9916522056	2023-02-28 12:19:01.816181	\N	\N	\N	9916522056	profile.jpg	f
7d82d0fc-8f44-40a7-9cfe-d078ef627a3b	22	2000-10-02		\N	Male	\N	\N	\N	\N	Elite 3	\N	919916522051	2023-02-28 14:26:48.174859	\N	\N	\N	919916522051	\N	f
0f1e64ba-8f5c-462d-8cd4-0b804099f457	21	2002-01-01	abc@elite.com	\N	MALE	\N	\N	\N	\N	Etlite 3	\N	919916522053	2023-03-03 06:23:05.935515	\N	\N	\N	919916522053	\N	f
f08b7652-3b4f-4ac6-9484-7d9ea5646a93	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	919926522058	2023-03-13 04:50:19.243632	\N	\N	\N	\N	\N	f
25790e4b-bd27-4778-afa1-9b865347d662	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2256520557	2023-03-16 14:11:53.439428	\N	\N	\N	\N	\N	f
d0bb07f5-94e3-4a0e-bffe-2d8e413507f5	21	2002-01-01		\N	MALE	\N	\N	\N	\N	Elite 58	\N	919916522058	2023-02-28 13:41:23.782389	\N	\N	\N	919916522058	profile.jpg	f
a1bee6d7-2775-45e2-875b-1dd786ead852	13	2009-09-03		\N	Male	\N	\N	\N	\N	Elite 54	\N	919916522054	2023-03-17 09:41:34.223315	\N	\N	\N	919916522054	profile.jpg	f
\.


--
-- Name: appointment_request_status_appointment_request_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_request_status_appointment_request_status_id_seq', 40, true);


--
-- Name: appointment_requests_appointment_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_requests_appointment_request_id_seq', 75, true);


--
-- Name: appointment_sessions_appointment_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_sessions_appointment_session_id_seq', 62, true);


--
-- Name: appointment_slots_nurse_default_slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_slots_nurse_default_slot_id_seq', 1, true);


--
-- Name: appointment_slots_nurse_specific_slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_slots_nurse_specific_slot_id_seq', 1, true);


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 36, true);


--
-- Name: end_otp_for_appointment_sessi_end_otp_for_appointment_sessi_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.end_otp_for_appointment_sessi_end_otp_for_appointment_sessi_seq', 20, true);


--
-- Name: nurse_appointment_complaint_nurse_appointment_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_appointment_complaint_nurse_appointment_complaint_id_seq', 4, true);


--
-- Name: nurse_document_proof_nurse_document_proof_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_document_proof_nurse_document_proof_id_seq', 1, false);


--
-- Name: nurse_earnings_nurse_earnings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_earnings_nurse_earnings_id_seq', 10, true);


--
-- Name: nurse_education_nurse_education_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_education_nurse_education_id_seq', 1, true);


--
-- Name: nurse_fees_nurse_fees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_fees_nurse_fees_id_seq', 13, true);


--
-- Name: nurse_notifications_nurse_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_notifications_nurse_notifications_id_seq', 12, true);


--
-- Name: nurse_profile_visit_nurse_profile_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_profile_visit_nurse_profile_visit_id_seq', 10, true);


--
-- Name: nurse_ratings_nurse_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_ratings_nurse_ratings_id_seq', 15, true);


--
-- Name: nurse_service_type_values_nurse_service_type_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_service_type_values_nurse_service_type_value_id_seq', 8, true);


--
-- Name: nurse_settings_nurse_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_settings_nurse_settings_id_seq', 8, true);


--
-- Name: nurse_skills_nurse_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_skills_nurse_skill_id_seq', 1, true);


--
-- Name: nurse_slots_recurring_slot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurse_slots_recurring_slot_id_seq', 1, true);


--
-- Name: nurses_service_type_subscript_nurses_service_type_subscript_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nurses_service_type_subscript_nurses_service_type_subscript_seq', 2, true);


--
-- Name: otp_for_appointment_session_otp_for_appointment_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.otp_for_appointment_session_otp_for_appointment_session_id_seq', 50, true);


--
-- Name: patient_ratings_patient_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_ratings_patient_ratings_id_seq', 1, false);


--
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 31, true);


--
-- Name: user_appointment_complaint_user_appointment_complaint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_appointment_complaint_user_appointment_complaint_id_seq', 3, true);


--
-- Name: user_favourites_user_favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_favourites_user_favourites_id_seq', 9, true);


--
-- Name: user_notifications_user_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_notifications_user_notifications_id_seq', 12, true);


--
-- Name: user_ratings_user_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_ratings_user_ratings_id_seq', 3, true);


--
-- Name: user_settings_user_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_settings_user_settings_id_seq', 1, true);


--
-- Name: appointment_request_status appointment_request_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_request_status
    ADD CONSTRAINT appointment_request_status_pkey PRIMARY KEY (appointment_request_status_id);


--
-- Name: appointment_requests appointment_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_requests
    ADD CONSTRAINT appointment_requests_pkey PRIMARY KEY (appointment_request_id);


--
-- Name: appointment_sessions appointment_sessions_appointment_session_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_sessions
    ADD CONSTRAINT appointment_sessions_appointment_session_id_unique_key UNIQUE (appointment_session_id);


--
-- Name: appointment_slots_nurse_default appointment_slots_nurse_default_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_slots_nurse_default
    ADD CONSTRAINT appointment_slots_nurse_default_pkey PRIMARY KEY (slot_id);


--
-- Name: appointment_slots_nurse_specific appointment_slots_nurse_specific_nurse_id_slot_date_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_slots_nurse_specific
    ADD CONSTRAINT appointment_slots_nurse_specific_nurse_id_slot_date_key UNIQUE (nurse_id, slot_date);


--
-- Name: appointment_slots_nurse_specific appointment_slots_nurse_specific_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_slots_nurse_specific
    ADD CONSTRAINT appointment_slots_nurse_specific_pkey PRIMARY KEY (slot_id);


--
-- Name: appointment_slots appointment_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_slots
    ADD CONSTRAINT appointment_slots_pkey PRIMARY KEY (slot_id);


--
-- Name: appointments appointments_booking_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_booking_id_key UNIQUE (booking_id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: end_otp_for_appointment_session end_otp_for_appointment_session_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.end_otp_for_appointment_session
    ADD CONSTRAINT end_otp_for_appointment_session_unique_key UNIQUE (appointment_session_id);


--
-- Name: nurse_address nurse_address_nurse_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_address
    ADD CONSTRAINT nurse_address_nurse_id_key UNIQUE (nurse_id);


--
-- Name: nurse_address nurse_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_address
    ADD CONSTRAINT nurse_address_pkey PRIMARY KEY (nurse_address_id);


--
-- Name: nurse_appointment_complaint nurse_appointment_complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_appointment_complaint
    ADD CONSTRAINT nurse_appointment_complaint_pkey PRIMARY KEY (nurse_appointment_complaint_id);


--
-- Name: nurse_document_proof nurse_document_proof_nurse_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_document_proof
    ADD CONSTRAINT nurse_document_proof_nurse_id_unique_key UNIQUE (nurse_id);


--
-- Name: nurse_document_proof nurse_document_proof_primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_document_proof
    ADD CONSTRAINT nurse_document_proof_primary_key PRIMARY KEY (nurse_document_proof_id);


--
-- Name: nurse_earnings nurse_earnings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_earnings
    ADD CONSTRAINT nurse_earnings_pkey PRIMARY KEY (nurse_earnings_id);


--
-- Name: nurse_earnings nurse_earnings_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_earnings
    ADD CONSTRAINT nurse_earnings_unique_key UNIQUE (nurse_id, appointment_session_id);


--
-- Name: nurse_education nurse_education_nurse_education_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_education
    ADD CONSTRAINT nurse_education_nurse_education_name_key UNIQUE (nurse_education_name);


--
-- Name: nurse_education nurse_education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_education
    ADD CONSTRAINT nurse_education_pkey PRIMARY KEY (nurse_education_id);


--
-- Name: nurse_fees nurse_fees_nurse_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_fees
    ADD CONSTRAINT nurse_fees_nurse_id_key UNIQUE (nurse_id);


--
-- Name: nurse_fees nurse_fees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_fees
    ADD CONSTRAINT nurse_fees_pkey PRIMARY KEY (nurse_fees_id);


--
-- Name: nurse_notifications nurse_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_notifications
    ADD CONSTRAINT nurse_notifications_pkey PRIMARY KEY (nurse_notifications_id);


--
-- Name: nurse_profile_visit nurse_profile_visit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_profile_visit
    ADD CONSTRAINT nurse_profile_visit_pkey PRIMARY KEY (nurse_profile_visit_id);


--
-- Name: nurse_ratings nurse_ratings_appointment_session_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_ratings
    ADD CONSTRAINT nurse_ratings_appointment_session_id_unique_key UNIQUE (appointment_session_id);


--
-- Name: nurse_ratings nurse_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_ratings
    ADD CONSTRAINT nurse_ratings_pkey PRIMARY KEY (nurse_ratings_id);


--
-- Name: nurse_service_type_values nurse_service_type_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_service_type_values
    ADD CONSTRAINT nurse_service_type_values_pkey PRIMARY KEY (nurse_service_type_value_id);


--
-- Name: nurse_settings nurse_settings_nurse_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_settings
    ADD CONSTRAINT nurse_settings_nurse_id_unique_key UNIQUE (nurse_id);


--
-- Name: nurse_settings nurse_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_settings
    ADD CONSTRAINT nurse_settings_pkey PRIMARY KEY (nurse_settings_id);


--
-- Name: nurse_slots_recurring nurse_slots_recurring_default_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_slots_recurring
    ADD CONSTRAINT nurse_slots_recurring_default_pkey PRIMARY KEY (slot_id);


--
-- Name: nurses nurses_nurse_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurses
    ADD CONSTRAINT nurses_nurse_phone_key UNIQUE (nurse_phone);


--
-- Name: nurses nurses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurses
    ADD CONSTRAINT nurses_pkey PRIMARY KEY (nurse_id);


--
-- Name: nurses_service_type_subscription nurses_service_type_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurses_service_type_subscription
    ADD CONSTRAINT nurses_service_type_subscription_pkey PRIMARY KEY (nurses_service_type_subscription_id);


--
-- Name: otp_for_appointment_session otp_for_appointment_session_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp_for_appointment_session
    ADD CONSTRAINT otp_for_appointment_session_unique_key UNIQUE (appointment_session_id);


--
-- Name: otp_phone otp_phone_phone_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otp_phone
    ADD CONSTRAINT otp_phone_phone_unique_key UNIQUE (user_phone);


--
-- Name: patient_ratings patient_ratings_appointment_session_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_ratings
    ADD CONSTRAINT patient_ratings_appointment_session_id_unique_key UNIQUE (appointment_session_id);


--
-- Name: patient_ratings patient_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_ratings
    ADD CONSTRAINT patient_ratings_pkey PRIMARY KEY (patient_ratings_id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- Name: patients patients_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_unique_key UNIQUE (user_id, user_relationship_with_patient);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- Name: payments payments_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_unique_key UNIQUE (booking_id);


--
-- Name: user_address user_address_patient_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_patient_id_unique_key UNIQUE (patient_id);


--
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (user_address_id);


--
-- Name: user_appointment_complaint user_appointment_complaint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_appointment_complaint
    ADD CONSTRAINT user_appointment_complaint_pkey PRIMARY KEY (user_appointment_complaint_id);


--
-- Name: user_favourites user_favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favourites
    ADD CONSTRAINT user_favourites_pkey PRIMARY KEY (user_favourites_id);


--
-- Name: user_favourites user_favourites_user_id_nurse_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favourites
    ADD CONSTRAINT user_favourites_user_id_nurse_id_unique_key UNIQUE (user_id, nurse_id);


--
-- Name: user_notifications user_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notifications
    ADD CONSTRAINT user_notifications_pkey PRIMARY KEY (user_notifications_id);


--
-- Name: user_ratings user_ratings_appointment_session_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_ratings
    ADD CONSTRAINT user_ratings_appointment_session_id_unique_key UNIQUE (appointment_session_id);


--
-- Name: user_ratings user_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_ratings
    ADD CONSTRAINT user_ratings_pkey PRIMARY KEY (user_ratings_id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (user_settings_id);


--
-- Name: user_settings user_settings_user_id_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_unique_key UNIQUE (user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: nurse_document_proof_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nurse_document_proof_idx ON public.nurse_document_proof USING btree (nurse_id);


--
-- Name: otp_phone_user_phone_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX otp_phone_user_phone_idx ON public.otp_phone USING btree (user_phone);


--
-- Name: patients_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patients_user_id_idx ON public.patients USING btree (user_id);


--
-- Name: payments_booking_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payments_booking_id_idx ON public.payments USING btree (booking_id);


--
-- Name: payments_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payments_user_id_idx ON public.payments USING btree (user_id);


--
-- Name: user_address_patient_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_address_patient_id_idx ON public.user_address USING btree (patient_id);


--
-- Name: user_address_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_address_user_id_idx ON public.user_address USING btree (user_id);


--
-- Name: appointment_sessions fk_appointment_sessions_appointment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointment_sessions
    ADD CONSTRAINT fk_appointment_sessions_appointment_id FOREIGN KEY (appointment_id) REFERENCES public.appointments(appointment_id);


--
-- Name: nurse_appointment_complaint fk_nurse_appointment_complaint_appointment_session_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_appointment_complaint
    ADD CONSTRAINT fk_nurse_appointment_complaint_appointment_session_id FOREIGN KEY (appointment_session_id) REFERENCES public.appointment_sessions(appointment_session_id);


--
-- Name: nurse_appointment_complaint fk_nurse_appointment_complaint_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_appointment_complaint
    ADD CONSTRAINT fk_nurse_appointment_complaint_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurses(nurse_id);


--
-- Name: nurse_appointment_complaint fk_nurse_appointment_complaint_patient_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_appointment_complaint
    ADD CONSTRAINT fk_nurse_appointment_complaint_patient_id FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- Name: nurse_earnings fk_nurse_earnings_appointment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_earnings
    ADD CONSTRAINT fk_nurse_earnings_appointment_id FOREIGN KEY (appointment_id) REFERENCES public.appointments(appointment_id);


--
-- Name: nurse_earnings fk_nurse_earnings_appointment_session_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_earnings
    ADD CONSTRAINT fk_nurse_earnings_appointment_session_id FOREIGN KEY (appointment_session_id) REFERENCES public.appointment_sessions(appointment_session_id);


--
-- Name: nurse_earnings fk_nurse_earnings_booking_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_earnings
    ADD CONSTRAINT fk_nurse_earnings_booking_id FOREIGN KEY (booking_id) REFERENCES public.appointments(booking_id);


--
-- Name: nurse_earnings fk_nurse_earnings_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_earnings
    ADD CONSTRAINT fk_nurse_earnings_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurses(nurse_id);


--
-- Name: nurse_notifications fk_nurse_notifications_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_notifications
    ADD CONSTRAINT fk_nurse_notifications_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurses(nurse_id);


--
-- Name: nurse_ratings fk_nurse_ratings_appointment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_ratings
    ADD CONSTRAINT fk_nurse_ratings_appointment_id FOREIGN KEY (appointment_id) REFERENCES public.appointments(appointment_id);


--
-- Name: nurse_ratings fk_nurse_ratings_appointment_session_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_ratings
    ADD CONSTRAINT fk_nurse_ratings_appointment_session_id FOREIGN KEY (appointment_session_id) REFERENCES public.appointment_sessions(appointment_session_id);


--
-- Name: nurse_settings fk_nurse_settings_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurse_settings
    ADD CONSTRAINT fk_nurse_settings_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurses(nurse_id);


--
-- Name: nurses_service_type_subscription fk_nurses_service_type_subscription_nurse_service_type_value_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nurses_service_type_subscription
    ADD CONSTRAINT fk_nurses_service_type_subscription_nurse_service_type_value_id FOREIGN KEY (nurse_service_type_value_id) REFERENCES public.nurse_service_type_values(nurse_service_type_value_id);


--
-- Name: patient_ratings fk_patient_ratings_appointment_session_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_ratings
    ADD CONSTRAINT fk_patient_ratings_appointment_session_id FOREIGN KEY (appointment_session_id) REFERENCES public.appointment_sessions(appointment_session_id);


--
-- Name: user_appointment_complaint fk_user_appointment_complaint_appointment_session_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_appointment_complaint
    ADD CONSTRAINT fk_user_appointment_complaint_appointment_session_id FOREIGN KEY (appointment_session_id) REFERENCES public.appointment_sessions(appointment_session_id);


--
-- Name: user_appointment_complaint fk_user_appointment_complaint_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_appointment_complaint
    ADD CONSTRAINT fk_user_appointment_complaint_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurses(nurse_id);


--
-- Name: user_appointment_complaint fk_user_appointment_complaint_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_appointment_complaint
    ADD CONSTRAINT fk_user_appointment_complaint_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_notifications fk_user_notifications_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_notifications
    ADD CONSTRAINT fk_user_notifications_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_ratings fk_user_ratings_appointment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_ratings
    ADD CONSTRAINT fk_user_ratings_appointment_id FOREIGN KEY (appointment_id) REFERENCES public.appointments(appointment_id);


--
-- Name: user_ratings fk_user_ratings_appointment_session_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_ratings
    ADD CONSTRAINT fk_user_ratings_appointment_session_id FOREIGN KEY (appointment_session_id) REFERENCES public.appointment_sessions(appointment_session_id);


--
-- Name: user_settings fk_user_settings_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT fk_user_settings_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: user_favourites user_favourites_nurse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favourites
    ADD CONSTRAINT user_favourites_nurse_id FOREIGN KEY (nurse_id) REFERENCES public.nurses(nurse_id);


--
-- Name: user_favourites user_favourites_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favourites
    ADD CONSTRAINT user_favourites_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

