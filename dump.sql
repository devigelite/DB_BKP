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
-- Data for Name: appointment_request_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (4, 7, 'booking-123-567-123', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2022-11-18 07:19:22.625362', '2022-11-18 07:19:22.625362', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (5, 17, '7115-783958-3899', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2022-11-18 07:52:13.074166', '2022-11-18 07:52:13.074166', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (6, 13, '7115-711725-3108', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2022-11-18 14:30:30.62272', '2022-11-18 14:30:30.62272', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (7, 14, '7115-711682-7483', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2022-11-18 14:50:54.862458', '2022-11-18 14:50:54.862458', 'REJECTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (11, 28, '7184-001696-3023', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2022-12-05 08:14:13.054062', '2022-12-05 08:14:13.054062', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (12, 29, '7184-002032-9595', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2022-12-05 08:43:22.894358', '2022-12-05 08:43:22.894358', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (13, 30, '7184-064646-3655', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2022-12-05 11:42:00.009', '2022-12-05 11:42:00.009', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (14, 36, '7188-627292-6245', '450b15fb-4044-4c08-9a80-06bd7c2f4e43', '2023-02-27 10:17:52.772544', '2023-02-27 10:17:52.772544', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (15, 37, '7188-620095-9168', '450b15fb-4044-4c08-9a80-06bd7c2f4e43', '2023-02-28 12:46:39.008611', '2023-02-28 12:46:39.008611', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (16, 41, '7188-327550-2356', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-02-28 13:44:56.778234', '2023-02-28 13:44:56.778234', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (17, 42, '7188-320767-2116', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-02-28 13:50:24.988239', '2023-02-28 13:50:24.988239', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (18, 43, '7188-320929-5437', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-02-28 13:53:24.117046', '2023-02-28 13:53:24.117046', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (19, 44, '7188-598647-3250', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-03 09:56:51.311291', '2023-03-03 09:56:51.311291', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (20, 47, '7185-018640-4846', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-08 09:24:17.179364', '2023-03-08 09:24:17.179364', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (21, 45, '7185-482347-8895', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-14 07:10:20.223506', '2023-03-14 07:10:20.223506', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (22, 57, '7185-824279-5983', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-14 10:54:45.812104', '2023-03-14 10:54:45.812104', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (23, 58, '7185-511601-6447', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-15 09:17:47.374541', '2023-03-15 09:17:47.374541', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (25, 54, '7185-847710-6556', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-15 12:16:14.950589', '2023-03-15 12:16:14.950589', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (26, 53, '7185-847778-8217', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-15 12:17:35.781141', '2023-03-15 12:17:35.781141', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (27, 62, '7185-237970-2140', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-16 09:08:33.950455', '2023-03-16 09:08:33.950455', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (28, 61, '7185-237052-0625', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-16 09:37:44.303599', '2023-03-16 09:37:44.303599', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (29, 63, '7185-283801-4559', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-16 14:13:08.772911', '2023-03-16 14:13:08.772911', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (30, 65, '7182-941828-4036', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-21 06:05:22.69316', '2023-03-21 06:05:22.69316', 'REJECTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (31, 67, '7182-985643-8508', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-21 07:46:15.84769', '2023-03-21 07:46:15.84769', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (32, 64, '7182-943149-6591', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 05:58:15.198969', '2023-03-24 05:58:15.198969', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (33, 66, '7182-988255-4493', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 06:07:18.942823', '2023-03-24 06:07:18.942823', 'REJECTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (34, 69, '7182-198259-6128', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 06:11:49.509465', '2023-03-24 06:11:49.509465', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (35, 68, '7182-198298-8553', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 06:30:24.214255', '2023-03-24 06:30:24.214255', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (36, 70, '7182-167603-5255', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 07:11:00.960072', '2023-03-24 07:11:00.960072', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (37, 72, '7182-111713-4327', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 13:56:26.238466', '2023-03-24 13:56:26.238466', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (38, 73, '7182-111080-8508', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 13:58:10.041088', '2023-03-24 13:58:10.041088', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (39, 74, '7182-111655-1167', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 14:04:03.069293', '2023-03-24 14:04:03.069293', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (40, 75, '7182-111847-6640', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-03-24 14:05:16.437264', '2023-03-24 14:05:16.437264', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (41, 76, '7157-871077-9763', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-04-17 09:40:50.912569', '2023-04-17 09:40:50.912569', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (42, 81, '7157-809652-5145', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-04-17 09:41:18.89224', '2023-04-17 09:41:18.89224', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (43, 78, '7157-800503-9255', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-04-17 09:41:36.881972', '2023-04-17 09:41:36.881972', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (44, 79, '7157-800514-8545', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-04-17 09:41:48.031811', '2023-04-17 09:41:48.031811', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (45, 77, '7157-800814-2128', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-04-17 09:41:59.165126', '2023-04-17 09:41:59.165126', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (46, 84, '7157-808260-4240', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-04-17 10:50:52.867113', '2023-04-17 10:50:52.867113', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (47, 85, '7157-896615-9287', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-04-17 12:28:40.474104', '2023-04-17 12:28:40.474104', 'ACCEPTED');
INSERT INTO public.appointment_request_status (appointment_request_status_id, appointment_request_id, booking_id, nurse_id, created_at, updated_at, appointment_request_status) VALUES (48, 86, '7157-284842-8416', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-04-20 06:10:47.584977', '2023-04-20 06:10:47.584977', 'ACCEPTED');


--
-- Data for Name: appointment_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appointment_requests (appointment_request_id, booking_id, appointment_date, appointment_session_count, nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_start_time, appointment_end_time, created_at, updated_at, appointment_request_status, appointment_patient_symptoms, appointment_specific_request, total_payment_amount, fees_per_session, days, appointment_dates, payment_method, patient_booking_status) VALUES (83, '7157-806869-2183', '2023-04-20', 1, '18803b4e-6683-11ed-b767-0242ac110002', '58b4c1ff-b79d-4a45-a123-c4ec79ffb9f8', '75d59e13-85a5-48ce-9a3b-81db9065000e', 'SINGLE_VISIT', '2023-04-20', '2023-04-20', '15:15', '19:15', '2023-04-17 09:45:43.96832', '2023-04-17 09:45:43.96832', 'WAITINGFORNURSETOACCEPT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.appointment_requests (appointment_request_id, booking_id, appointment_date, appointment_session_count, nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_start_time, appointment_end_time, created_at, updated_at, appointment_request_status, appointment_patient_symptoms, appointment_specific_request, total_payment_amount, fees_per_session, days, appointment_dates, payment_method, patient_booking_status) VALUES (84, '7157-808260-4240', '2023-04-17', 1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '58b4c1ff-b79d-4a45-a123-c4ec79ffb9f8', '75d59e13-85a5-48ce-9a3b-81db9065000e', 'SINGLE_VISIT', '2023-04-17', '2023-04-17', '19:08', '23:8', '2023-04-17 10:39:02.091842', '2023-04-17 10:39:02.091842', 'ACCEPTED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.appointment_requests (appointment_request_id, booking_id, appointment_date, appointment_session_count, nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_start_time, appointment_end_time, created_at, updated_at, appointment_request_status, appointment_patient_symptoms, appointment_specific_request, total_payment_amount, fees_per_session, days, appointment_dates, payment_method, patient_booking_status) VALUES (85, '7157-896615-9287', '2023-04-20', 1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '08f5614e-af6f-42fb-99ee-8e1bdb1cf001', '027483e7-69d3-4f6e-99f6-9bff532f44e7', 'SINGLE_VISIT', '2023-04-20', '2023-04-20', '17:45', '23:45', '2023-04-17 12:27:48.398357', '2023-04-17 12:27:48.398357', 'ACCEPTED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.appointment_requests (appointment_request_id, booking_id, appointment_date, appointment_session_count, nurse_id, patient_id, user_id, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_start_time, appointment_end_time, created_at, updated_at, appointment_request_status, appointment_patient_symptoms, appointment_specific_request, total_payment_amount, fees_per_session, days, appointment_dates, payment_method, patient_booking_status) VALUES (86, '7157-284842-8416', '2023-04-20', 1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '13dde1c5-4bc8-4618-bac4-03d652570868', '00e4bcbe-9160-4e45-8f08-10999be2ef20', 'SINGLE_VISIT', '2023-04-20', '2023-04-20', '11:34', '17:34', '2023-04-20 06:05:09.70635', '2023-04-20 06:05:09.70635', 'ACCEPTED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appointments (appointment_id, booking_id, appointment_date, appointment_status, appointment_session_count, nurse_id, patient_id, user_id, created_at, updated_at, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_patient_symptoms, appointment_specific_request, patient_booking_status) VALUES (42, '7157-808260-4240', '2023-04-17', 'ACCEPTED', 1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '58b4c1ff-b79d-4a45-a123-c4ec79ffb9f8', '75d59e13-85a5-48ce-9a3b-81db9065000e', '2023-04-17 10:50:52.867113', '2023-04-17 10:50:52.867113', 'SINGLE_VISIT', '2023-04-17', '2023-04-17', NULL, NULL, false);
INSERT INTO public.appointments (appointment_id, booking_id, appointment_date, appointment_status, appointment_session_count, nurse_id, patient_id, user_id, created_at, updated_at, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_patient_symptoms, appointment_specific_request, patient_booking_status) VALUES (43, '7157-896615-9287', '2023-04-20', 'ACCEPTED', 1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '08f5614e-af6f-42fb-99ee-8e1bdb1cf001', '027483e7-69d3-4f6e-99f6-9bff532f44e7', '2023-04-17 12:28:40.474104', '2023-04-17 12:28:40.474104', 'SINGLE_VISIT', '2023-04-20', '2023-04-20', NULL, NULL, false);
INSERT INTO public.appointments (appointment_id, booking_id, appointment_date, appointment_status, appointment_session_count, nurse_id, patient_id, user_id, created_at, updated_at, appointment_visit_type, appointment_start_date, appointment_end_date, appointment_patient_symptoms, appointment_specific_request, patient_booking_status) VALUES (44, '7157-284842-8416', '2023-04-20', 'ACCEPTED', 1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '13dde1c5-4bc8-4618-bac4-03d652570868', '00e4bcbe-9160-4e45-8f08-10999be2ef20', '2023-04-20 06:10:47.584977', '2023-04-20 06:10:47.584977', 'SINGLE_VISIT', '2023-04-20', '2023-04-20', NULL, NULL, false);


--
-- Data for Name: appointment_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appointment_sessions (appointment_session_id, appointment_id, appointment_actual_end_time, appointment_actual_start_time, appointment_booked_end_time, appointment_booked_start_time, appointment_date, appointment_session, appointment_slot_time, appointment_session_status, created_at, updated_at, appointment_session_cancelled_by, appointment_actual_end_time_with_date, appointment_actual_start_time_with_date, appoinment_cancel_comments, appointment_session_user_reason) VALUES (68, 42, NULL, NULL, '23:8', '19:08', '2023-04-17', 1, '19:08', 'UPCOMING', '2023-04-17 10:50:52.867113', '2023-04-17 10:50:52.867113', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.appointment_sessions (appointment_session_id, appointment_id, appointment_actual_end_time, appointment_actual_start_time, appointment_booked_end_time, appointment_booked_start_time, appointment_date, appointment_session, appointment_slot_time, appointment_session_status, created_at, updated_at, appointment_session_cancelled_by, appointment_actual_end_time_with_date, appointment_actual_start_time_with_date, appoinment_cancel_comments, appointment_session_user_reason) VALUES (70, 44, NULL, NULL, '17:34', '11:34', '2023-04-20', 1, '11:34', 'UPCOMING', '2023-04-20 06:10:47.584977', '2023-04-20 06:10:47.584977', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.appointment_sessions (appointment_session_id, appointment_id, appointment_actual_end_time, appointment_actual_start_time, appointment_booked_end_time, appointment_booked_start_time, appointment_date, appointment_session, appointment_slot_time, appointment_session_status, created_at, updated_at, appointment_session_cancelled_by, appointment_actual_end_time_with_date, appointment_actual_start_time_with_date, appoinment_cancel_comments, appointment_session_user_reason) VALUES (69, 43, NULL, '11:43', '23:45', '17:45', '2023-04-20', 1, '17:45', 'STARTED', '2023-04-17 12:28:40.474104', '2023-04-17 12:28:40.474104', NULL, NULL, '2023-04-20 06:13:18.522512', NULL, NULL);


--
-- Data for Name: appointment_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appointment_slots (slot_id, slots) VALUES (1, '{00:00,01:00,02:00,03:00,04:00,05:00,06:00,07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00,18:00,19:00,20:00,21:00,22:00,23:00}');


--
-- Data for Name: appointment_slots_nurse_default; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appointment_slots_nurse_default (slot_id, nurse_id, slot_frequency, slots, created_at, updated_at) VALUES (1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '{MON,TUE,WED}', '{00:00,01:00,02:00,03:00,04:00,05:00,06:00,07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00,18:00,19:00,20:00,21:00,22:00,23:00}', '2022-10-14 12:32:48.884814', '2022-10-14 12:32:48.884814');


--
-- Data for Name: appointment_slots_nurse_specific; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.appointment_slots_nurse_specific (slot_id, nurse_id, slot_date, slots, created_at, updated_at) VALUES (1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2022-10-20', '{00:00,01:00,02:00,03:00,04:00,05:00,06:00,07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00,18:00,19:00,20:00,21:00,22:00,23:00}', '2022-10-14 12:32:55.993117', '2022-10-14 12:32:55.993117');


--
-- Data for Name: end_otp_for_appointment_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.end_otp_for_appointment_session (end_otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (1, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 37, '$2a$10$diWcysJMM/84dIDwop431euxn1R8V27th8zjOIBFOjjRPA61me8Q2', '2023-03-21 09:33:56.069254');
INSERT INTO public.end_otp_for_appointment_session (end_otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (14, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', '919916522058', 41, '$2a$10$KuHbdc.zavpxcmS.f4ydKO4xlMsAUbsqdaYJBS780W4PlgfxC5Etm', '2023-03-24 09:42:12.76587');
INSERT INTO public.end_otp_for_appointment_session (end_otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (16, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 40, '$2a$10$vkVFae3OTapK.scGD9OjhO9On9N0aL7R.3ju8PFXmKbroSvC.ZFsC', '2023-03-24 09:43:23.411699');
INSERT INTO public.end_otp_for_appointment_session (end_otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (13, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 39, '$2a$10$c1fjjJYcDs3Xncqvhnice.YujBWPcCs5XBvc1J7KwVxwoV4U61uMq', '2023-03-24 09:40:44.427944');


--
-- Data for Name: nurse_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_address (nurse_address_id, nurse_id, nurse_address_type, nurse_area, nurse_city, nurse_door_no_block, nurse_pincode, nurse_road, nurse_state, nurse_street) VALUES ('3879389c-71c2-41b2-ae0d-66b8826841b4', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 'Home', '6th Avenue', 'Chennai', '601', '600001', '2nd Main Road', 'TamilNadu', '5th Street');


--
-- Data for Name: nurses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) VALUES ('f72fc29e-cdc5-48e2-87f4-b7330449f0c4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '91566202701', '2023-01-13 06:17:49.681459', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) VALUES ('18803b4e-6683-11ed-b767-0242ac110002', 24, '1997-01-01', 'def@elite.com', NULL, 'MALE', NULL, 13.121699, '1,2nd Street,Anna Nagar', 80.201, 'YYY', NULL, '918144528548', '2022-11-17 14:22:23.40142', '2022-11-17 14:22:23.40142', '0101000020E6100000F13F4349920D544048DFA46950482A40', 'NURSE', 4, 5, 6, '918144528548', true, true, 'Mrs.YYY is a well experienced nurse in Cardio', '{Tamil,English,Hindi}', '{HOUSE_HOLD_TASKS,PERSONAL_CARE}', 1, 1, true, NULL, false);
INSERT INTO public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) VALUES ('ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 23, '1997-01-01', 'abc@elite.com', '', 'MALE', '', 13.121699, '2nd Street Iyappa Nagar', 80.201, 'Attendar1', '$2a$10$KJPTI8YlL.DHPY3XqtrOwO5o.G.FrCMk2WZn7fD3TazZIeSO/gxYW', '919566202701', '2022-08-25 06:59:59.145', '2022-08-25 06:59:59.145', '0101000020E6100000BE9F1A2FDD0C54406CE9D1544F3E2A40', 'NURSE', 4.5, 5, 4, '919566202701', true, true, 'Mrs.XYZ is a well experienced nurse in Cardio', '{Tamil,English,Hindi}', '{HOUSE_HOLD_TASKS,PERSONAL_CARE}', 1, 1, true, 'profile.jpg', false);
INSERT INTO public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) VALUES ('c28ca255-0532-4e81-8af7-936c404861d6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9566202701', '2023-03-02 10:41:59.820467', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) VALUES ('3c8190e8-c81d-4ee8-93d4-bcc7718b255e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '919943960728', '2023-03-13 05:53:08.909151', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) VALUES ('4763e8bb-eee2-4e92-afa5-39ca60c08bc7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6957917529', '2023-03-13 05:57:08.376819', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) VALUES ('7614fd8c-bbf3-492a-8a02-4b4f65accbe1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1318625477', '2023-03-14 09:10:08.21405', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.nurses (nurse_id, nurse_age, nurse_dob, nurse_email, nurse_firstname, nurse_gender, nurse_lastname, nurse_latitude, nurse_location, nurse_longitude, nurse_name, nurse_password, nurse_phone, created_at, updated_at, nurse_geolocation, nurse_type, nurse_avg_rating, nurse_experience, nurse_rating_count, nurse_whatsapp_phone, nurse_verified, nurse_is_licensed, nurse_description, nurse_languages_known, nurse_service_type, nurse_education_id, nurse_skill_id, is_criminal_record_checked, nurse_profile_image_name, nurse_is_deleted) VALUES ('aeda27c9-7c92-4b81-9448-b307062c8c4f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '919916522058', '2023-03-15 12:05:18.03733', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false);


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('795c5e29-37d9-46a5-a3d7-3ebd05998bb0', 20, '2002-02-01', NULL, NULL, 'FEMALE', NULL, NULL, NULL, NULL, 'YYY', '919566202701', NULL, NULL, '53645460-2c17-4518-b883-4f940980c5cd', NULL, NULL, NULL, 'SELF', '919566202701', NULL, NULL);
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('c0e1b0a4-b5ac-40d9-8528-aa743860ce37', 21, '2002-01-01', NULL, NULL, 'MALE', NULL, NULL, NULL, NULL, 'xxx', '91566202702', NULL, NULL, '53645460-2c17-4518-b883-4f940980c5cd', NULL, NULL, NULL, 'PARENTS', '91566202702', NULL, NULL);
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('d29e837b-44d2-4c59-9100-c6471a1ba5e6', 55, '1977-01-01', 'devi@email.com', NULL, 'MALE', NULL, NULL, NULL, NULL, 'YYY', '918144528548', NULL, NULL, '4294ebd4-3498-4a23-bd89-87c126483cf9', true, NULL, NULL, 'SELF', NULL, NULL, 'profile.jpg');
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('4f883eea-74df-4a4b-af79-7e03da6093c5', 21, '2002-01-01', 'abc@elite.com', NULL, 'MALE', NULL, NULL, NULL, NULL, 'xxx', '9943960728', NULL, NULL, 'e2e89481-a51a-43b0-b79c-ba66cfec4064', NULL, NULL, NULL, 'PARENTS', '9943960728', NULL, NULL);
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('fd1b5a82-3254-4a40-8a9d-cdc9351ef9ba', 21, '2002-01-01', 'abc@elite.com', NULL, 'Male', NULL, NULL, NULL, NULL, 'Nadan', '9916522058', NULL, NULL, '654bbd67-f821-488f-afa7-c89541040950', NULL, NULL, NULL, 'SELF', '9916522058', NULL, NULL);
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('f0b67253-9513-45de-8770-1fff7571f720', 13, '2009-04-02', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Shree', '9916522056', NULL, NULL, 'c6d7dc7d-734a-4e67-bb74-50295d972a49', NULL, NULL, NULL, 'SELF', '9916522056', NULL, NULL);
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('e5e000c1-584b-4a41-ba46-6b036c5cf0b6', 22, '2000-10-02', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Elite 3', '919916522051', NULL, NULL, '7d82d0fc-8f44-40a7-9cfe-d078ef627a3b', NULL, NULL, NULL, 'SELF', '919916522051', NULL, NULL);
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('b70efebf-2151-476e-a91c-f8996c95c5f7', 21, '2002-01-01', 'abc@elite.com', NULL, 'MALE', NULL, NULL, NULL, NULL, 'Etlite 3', '919916522053', NULL, NULL, '0f1e64ba-8f5c-462d-8cd4-0b804099f457', NULL, NULL, NULL, 'SELF', '919916522053', NULL, NULL);
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('2e94a0f5-2662-4d50-a379-f02e93f9f464', 21, '2002-01-01', '', NULL, 'MALE', NULL, NULL, NULL, NULL, 'Elite 58', '919916522058', NULL, NULL, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', NULL, NULL, NULL, 'SELF', '919916522058', NULL, 'profile.jpg');
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('41745900-cece-42fd-b474-7fbbf4a12aad', 13, '2009-09-03', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Elite 54', '919916522054', NULL, NULL, 'a1bee6d7-2775-45e2-875b-1dd786ead852', NULL, NULL, NULL, 'SELF', '919916522054', NULL, 'profile.jpg');
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('58b4c1ff-b79d-4a45-a123-c4ec79ffb9f8', 27, '1995-04-18', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Elite 55', '919916522057', NULL, NULL, '75d59e13-85a5-48ce-9a3b-81db9065000e', NULL, NULL, NULL, 'SELF', '919916522057', NULL, NULL);
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('08f5614e-af6f-42fb-99ee-8e1bdb1cf001', 0, '2023-04-17', 'hxcucucu@yffufugu', NULL, 'Female', NULL, NULL, NULL, NULL, 'hchchc', '911234567833', NULL, NULL, '027483e7-69d3-4f6e-99f6-9bff532f44e7', NULL, NULL, NULL, 'SELF', NULL, NULL, 'profile.jpg');
INSERT INTO public.patients (patient_id, patient_age, patient_dob, patient_email, patient_firstname, patient_gender, patient_lastname, patient_latitude, patient_location, patient_longitude, patient_name, patient_phone, created_at, updated_at, user_id, self_or_others, patient_avg_rating, patient_ratings, user_relationship_with_patient, patient_whatsapp_phone, patient_more_description, patient_profile_image_name) VALUES ('13dde1c5-4bc8-4618-bac4-03d652570868', 28, '1995-04-18', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Elite y', '919919522055', NULL, NULL, '00e4bcbe-9160-4e45-8f08-10999be2ef20', NULL, NULL, NULL, 'SELF', '919919522055', NULL, NULL);


--
-- Data for Name: nurse_appointment_complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nurse_document_proof; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nurse_earnings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nurse_education; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_education (nurse_education_id, nurse_education_name) VALUES (1, 'Medical Graduate');


--
-- Data for Name: nurse_fees; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_fees (nurse_fees_id, nurse_id, minimum_distance, distance_unit, minimum_session_fee, session_fee_currency, charges_for_extra_distance) VALUES (1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 10, 'KM', 500, 'INR', 100);
INSERT INTO public.nurse_fees (nurse_fees_id, nurse_id, minimum_distance, distance_unit, minimum_session_fee, session_fee_currency, charges_for_extra_distance) VALUES (13, '18803b4e-6683-11ed-b767-0242ac110002', 10, 'KM', 500, 'INR', 100);


--
-- Data for Name: nurse_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_notifications (nurse_notifications_id, nurse_id, nurse_notifications_subject, appointment_session_id, notification_date, created_at, updated_at, is_read) VALUES (11, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 'Your appointment is completed', 2, '2023-03-20', '2023-03-20 05:57:43.619245', '2023-03-20 05:57:43.619245', true);
INSERT INTO public.nurse_notifications (nurse_notifications_id, nurse_id, nurse_notifications_subject, appointment_session_id, notification_date, created_at, updated_at, is_read) VALUES (12, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 'Your appointment is completed', 2, '2023-03-20', '2023-03-20 05:58:47.643863', '2023-03-20 05:58:47.643863', true);


--
-- Data for Name: nurse_profile_visit; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '4294ebd4-3498-4a23-bd89-87c126483cf9', '2023-02-07', '2023-02-07 15:08:20.465986', '2023-02-07 15:08:20.465986', '2023-02-07 15:08:20.465986');
INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (3, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '4294ebd4-3498-4a23-bd89-87c126483cf9', '2023-01-07', '2023-02-07 15:12:24.046433', '2023-02-07 15:12:24.046433', '2023-02-07 15:12:24.046433');
INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (4, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '4294ebd4-3498-4a23-bd89-87c126483cf9', '2022-01-07', '2023-02-07 15:54:55.694543', '2023-02-07 15:54:55.694543', '2023-02-07 15:54:55.694543');
INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (5, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '4294ebd4-3498-4a23-bd89-87c126483cf9', '2023-02-08', '2023-02-08 13:15:33.518739', '2023-02-08 13:15:33.518739', '2023-02-08 13:15:33.518739');
INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (6, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '4294ebd4-3498-4a23-bd89-87c126483cf9', '2023-02-08', '2023-02-08 13:15:57.48595', '2023-02-08 13:15:57.48595', '2023-02-08 13:15:57.48595');
INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (7, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '654bbd67-f821-488f-afa7-c89541040950', '2023-02-28', '2023-02-28 12:41:41.728944', '2023-02-28 12:41:41.728944', '2023-02-28 12:41:41.728944');
INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (8, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '654bbd67-f821-488f-afa7-c89541040950', '2023-02-28', '2023-02-28 12:41:42.422338', '2023-02-28 12:41:42.422338', '2023-02-28 12:41:42.422338');
INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (9, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '654bbd67-f821-488f-afa7-c89541040950', '2023-02-28', '2023-02-28 12:53:34.13066', '2023-02-28 12:53:34.13066', '2023-02-28 12:53:34.13066');
INSERT INTO public.nurse_profile_visit (nurse_profile_visit_id, nurse_id, user_id, visit_date, visit_time, created_at, updated_at) VALUES (10, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '654bbd67-f821-488f-afa7-c89541040950', '2023-02-28', '2023-02-28 12:53:34.435073', '2023-02-28 12:53:34.435073', '2023-02-28 12:53:34.435073');


--
-- Data for Name: nurse_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nurse_service_type_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) VALUES (1, 'HOUSE_HOLD_TASKS', 'House Hold Tasks', 'House Hold and More');
INSERT INTO public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) VALUES (2, 'PERSONAL_CARE', 'Personal Care', 'Personal Care and More');
INSERT INTO public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) VALUES (3, 'COMPANION_SHIP', 'Companionship', 'Companionship and More');
INSERT INTO public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) VALUES (4, 'TRANSPORTATION', 'Transportation', 'Transportation and More');
INSERT INTO public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) VALUES (5, 'MOBILITY_ASSISTANCE', 'Mobility Assistance', 'Mobility Assistance and More');
INSERT INTO public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) VALUES (6, 'SPECIALIZED_CARE', 'Specialized Care', 'Specialized Care and More');
INSERT INTO public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) VALUES (7, 'PHYSICAL_EXAMINATIONS', 'Physical Examinations', 'Physical Examinations and More');
INSERT INTO public.nurse_service_type_values (nurse_service_type_value_id, nurse_service_type, nurse_service_type_name, nurse_service_type_description) VALUES (8, 'NURSE_CONSULTATIONS', 'Nurse Consultations', 'Physical Examinations and More');


--
-- Data for Name: nurse_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_settings (nurse_settings_id, nurse_id, nurse_language, notifications_on, whatsapp_alerts_on, created_at, updated_at) VALUES (1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', 'English', true, true, '2023-01-16 08:46:17.417661', '2023-01-19 09:36:14.58649');


--
-- Data for Name: nurse_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_skills (nurse_skill_id, nurse_skill_name) VALUES (1, 'Certified Home Health Aide');


--
-- Data for Name: nurse_slots_recurring; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurse_slots_recurring (slot_id, nurse_id, slot_frequency, slot_start_time, slot_end_time, created_at, updated_at) VALUES (1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '{SUN,MON,TUE}', '10:00', '18:00', '2022-10-30 15:44:07.0442', '2022-10-30 15:44:07.0442');


--
-- Data for Name: nurses_service_type_subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nurses_service_type_subscription (nurses_service_type_subscription_id, nurse_service_type_value_id, nurse_id) VALUES (1, 1, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6');
INSERT INTO public.nurses_service_type_subscription (nurses_service_type_subscription_id, nurse_service_type_value_id, nurse_id) VALUES (2, 2, 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6');


--
-- Data for Name: otp_for_appointment_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (1, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 19, '$2a$10$cyCVaXoRhkKaFIibQZcHr.Hllf2MKv41bcx8QDzrL7.DGIV86oicq', '2022-12-31 05:14:15.666502');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (11, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 17, '$2a$10$3XN7laITJgPmcbVZym.a9Oump9PeZy.xDJKp/Ka6ZjE1xoHsCwH4.', '2023-01-02 09:46:47.604663');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (12, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 18, '$2a$10$UMH1sfKEwbuEkSuqyRSCd.F4GONL3Pt/2tj8.saEwwSisMXT5ujxa', '2023-01-02 09:48:55.76556');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (16, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', '919916522058', 26, '$2a$10$5UCqtsEssE/ciWqf10ZbJuqOB01XDAHrjXi2Q/yQuAUOULrIaxb4q', '2023-03-08 09:54:03.469795');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (17, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', '919916522058', 28, '$2a$10$SSellRECyBASOuMPW3G3geujnBZSZ1XO3X.RE5hBCc3o/49/jcw7a', '2023-03-14 11:29:20.176434');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (25, '53645460-2c17-4518-b883-4f940980c5cd', '919566202701', 29, '$2a$10$22vvzVU0GZRwUdwwCLZa2.PMPUikVgc3T0lME7uo9GNiQgBwS.Rgi', '2023-03-15 12:22:30.872235');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (29, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', '919916522058', 35, '$2a$10$TVLdzH65vWx0wHxSRcMp7OqzLi1NWhWVIEMQuImmN6wblQzq6.uxW', '2023-03-16 10:19:36.930384');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (26, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', '919916522058', 34, '$2a$10$8T1ifE/g7dtdnvpmfAJUd.Ie1c6zThl6BrEOVWxMkxNWXIk0cZCaC', '2023-03-16 09:24:48.959865');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (35, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 37, '$2a$10$lGpbrQjQGTsWk2G3Mv7OluVkL..geFyMd/aNoct9reb9JXKApn1d.', '2023-03-21 09:32:11.207795');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (49, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 40, '$2a$10$z2jNSKYW/3hX/O/x3njHzuDG6KoI5Iug3xRAd5DecEv8eXU4FCQZ6', '2023-03-24 07:14:53.293353');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (48, '4294ebd4-3498-4a23-bd89-87c126483cf9', '918144528548', 39, '$2a$10$QaGd.Q20kX3FIV1GE0FNJOZCUY2vGRUEIEBdBBUxumtZyKRnmfdBa', '2023-03-24 07:09:40.8669');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (51, '75d59e13-85a5-48ce-9a3b-81db9065000e', '919916522057', 68, '$2a$10$dIzAUUYncpiwZlQUmlDSIeMED8Rl9KNij.PXi75OyDqdMhG/kigVi', '2023-04-17 12:37:04.025892');
INSERT INTO public.otp_for_appointment_session (otp_for_appointment_session_id, user_id, user_phone, appointment_session_id, otp, created_at) VALUES (53, '027483e7-69d3-4f6e-99f6-9bff532f44e7', '911234567833', 69, '$2a$10$XOhR0r4pgDFf8CTXdJnnI.V4K5iMyoQwTzYo3NoOVsNCM2ea0Sfwy', '2023-04-20 06:12:55.285407');


--
-- Data for Name: otp_phone; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('91566202701', '$2a$10$3gEnyqKoICpCeqVU6TqdJuHLwWviGuEaCLlWLsyPsGIaRMgC1ltKG', '2022-12-15 12:33:08.001039');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919916522058', '$2a$10$.Uzgh01MopVzXaDipIHCpek4pjI3HOb4qWk5/cqis0Ah7LbjVfzi.', '2023-02-28 13:41:23.90021');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919919522055', '$2a$10$tiJGd4SVGqcPF5zgxwZ9Ye4KdgMhMnkVL4kFewT/9LU.9lwDRrORq', '2023-04-20 05:54:18.837472');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919566202701', '$2a$10$lCduuTZvkhB0.CcWalOkfOQ0Hy0Rnjnsi8v/pIHt/m9kwyAd7Ekna', '2022-12-11 08:28:42.590945');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('9943960728', '$2a$10$pDVCLcb/tngKfDejBiD4U.dHq7j0antPZsof0UqvTGSFMBatdyZx6', '2023-02-27 09:19:20.965971');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('9195662027', '$2a$10$i/pHV9jPN18GrzehxsmiieMNsj2qWh99gw2a7t989QypMMgPBK742', '2023-02-27 10:13:30.336539');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('9916522056', '$2a$10$u59D2jpeefhmzOV/XeAvBOfHV3f8LX9JQJWxLhLAv423v4/CtBUaa', '2023-02-28 12:19:01.946539');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('2256520557', '$2a$10$gsLY59WWC2VSiqLN57WHROXvBjY/QRgEDHRNCZJQUR5oICsfW8sE.', '2023-03-16 14:11:53.585729');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('918144528548', '$2a$10$CUNsgcqT3O1wwUX7NflDHuUQzQfWduiVNJgMCna9dfcJWyRYWGxAW', '2022-12-30 05:22:49.053329');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('6957917529', '$2a$10$siXCTAMMMtnt6/DNe/XrOe85qyEd7LWkIsMPxUnpfxRldTgBwC1A6', '2023-03-13 05:57:08.528167');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('9916522058', '$2a$10$1NU401Lnjfm7zriEKHtBEeDvH7FWGsH8Q4sIVbgKmDCOJaVQ5l95W', '2023-02-27 09:15:38.782763');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919916522051', '$2a$10$OIBuWGX06s3DTyrPq4IALus8hQOJOEvd2PIQJ2IojM2sBXXk.8see', '2023-02-28 14:26:48.267474');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919926522058', '$2a$10$Cb..xckQyWF0h8fdOdeU5e9omrQcKjahpnLYe0LlY0UCarHvjO4HK', '2023-03-13 04:50:19.350264');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919943960728', '$2a$10$bHNGVo3bgY9WWTO1IjO6lOtmuDZONVit8nicQCitNIruSmfkpJRSm', '2023-03-13 05:53:09.057664');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('1318625477', '$2a$10$OT8JL2p8ra/.ov6aT9NAwuWsd5Ys4ku3tgibNepxcWFC78HSQgjIW', '2023-03-14 09:10:08.312844');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919916522053', '$2a$10$WF5KzywF3h7gOVf9yfjGCe5XimL6eI1WERG6eRAUWSSivB5Lg8d0S', '2023-03-03 06:23:06.027404');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919916522054', '$2a$10$w.c0Mo3IXgD9lk6qyu2aVuzu.XelKpr.M6bvaCPIhPLAOL7ubIKSu', '2023-03-17 09:41:34.338418');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('9566202701', '$2a$10$.SPR.xkelSAupYLW5DwP1OMfc1rY8xhkGeHwsEFvlFGV2xyYfWOnC', '2023-02-27 09:54:56.20644');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('919916522057', '$2a$10$ZCPd5K12/YwCOibp30c8CuKpYR9/j6pIZ2pnHDVwZ/j0uL03r/6za', '2023-04-17 07:47:01.400812');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('911234567888', '$2a$10$J3p0S0lCjVSl5I.BceuAlulnfUP1PIrXjGVB3xb.GVgcolNOdoKDK', '2023-04-17 09:34:34.961212');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('911234567855', '$2a$10$H0p8rsJBJmj0NwBbLskMrO.MhuMFJBSx3J7gaZ5JdSWZE95D3OG8W', '2023-04-17 09:35:50.941831');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('911234567853', '$2a$10$tkeVujv.OOR2WvgvxTDtAexwdUT/HBE/LJaabALaLob6H5yar5OdW', '2023-04-17 09:35:57.589022');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('911234567838', '$2a$10$BZRQgFb/AZzZIfhupr9RAOc90l9EKoH1e5uIf36EU9KRCE6k4PUcC', '2023-04-17 09:36:02.389624');
INSERT INTO public.otp_phone (user_phone, otp, created_at) VALUES ('911234567833', '$2a$10$xgj1Z94kEc8ywVGP/hHFFOkaKOyJxDRQlhM0kCFLlEhF2klO1.l0C', '2023-04-17 09:36:16.549202');


--
-- Data for Name: patient_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payments (payment_id, user_id, patient_id, booking_id, payment_method, appointment_session_count, fees_per_session, total_payment_amount, created_at, updated_at, appoinment_id, payment_date) VALUES (4, '4294ebd4-3498-4a23-bd89-87c126483cf9', 'd29e837b-44d2-4c59-9100-c6471a1ba5e6', '7184-001696-3023', 'GPAY', 3, 500, 1500, '2023-02-18 14:04:38.95904', '2023-02-18 14:04:38.95904', 10, NULL);
INSERT INTO public.payments (payment_id, user_id, patient_id, booking_id, payment_method, appointment_session_count, fees_per_session, total_payment_amount, created_at, updated_at, appoinment_id, payment_date) VALUES (5, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', '2e94a0f5-2662-4d50-a379-f02e93f9f464', '7188-327550-2356', 'GPAY', 1, 500, 500, '2023-02-28 13:45:16.752568', '2023-02-28 13:45:16.752568', 15, NULL);
INSERT INTO public.payments (payment_id, user_id, patient_id, booking_id, payment_method, appointment_session_count, fees_per_session, total_payment_amount, created_at, updated_at, appoinment_id, payment_date) VALUES (20, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', '2e94a0f5-2662-4d50-a379-f02e93f9f464', '7185-018640-4846', 'GPAY', 1, 500, 500, '2023-03-08 09:25:43.881771', '2023-03-08 09:25:43.881771', 19, NULL);
INSERT INTO public.payments (payment_id, user_id, patient_id, booking_id, payment_method, appointment_session_count, fees_per_session, total_payment_amount, created_at, updated_at, appoinment_id, payment_date) VALUES (21, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', '2e94a0f5-2662-4d50-a379-f02e93f9f464', '7185-824279-5983', 'GPAY', 1, 500, 500, '2023-03-14 11:00:10.773668', '2023-03-14 11:00:10.773668', 21, NULL);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: total_visit_count; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.total_visit_count (count) VALUES (2);


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('6e0a77bb-dcfc-4562-a1e7-3f7e8ade52cf', '53645460-2c17-4518-b883-4f940980c5cd', 'Chennai', '600012', 'TamilNadu', '795c5e29-37d9-46a5-a3d7-3ebd05998bb0', '21st Street', 81.201, 14.121699, '0101000020E61000006CE9D1544F3E2C40BE9F1A2FDD4C5440', 'cdf location');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('1fe15723-25ae-4232-9835-4ce3ca1af342', '53645460-2c17-4518-b883-4f940980c5cd', 'Chennai', '600099', 'TamilNadu', 'c0e1b0a4-b5ac-40d9-8528-aa743860ce37', '1st Street', 80.201, 13.121699, '0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440', 'abc location');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('91b4e3ff-877a-49d1-b094-a59fe43d2ce3', '4294ebd4-3498-4a23-bd89-87c126483cf9', 'Chennai', '600012', 'TamilNadu', 'd29e837b-44d2-4c59-9100-c6471a1ba5e6', '21st Street', 81.201, 14.121699, '0101000020E61000006CE9D1544F3E2C40BE9F1A2FDD4C5440', 'cdf location');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('88ef520a-74ce-46ab-8ad8-86bb68d6e51c', 'e2e89481-a51a-43b0-b79c-ba66cfec4064', 'Chennai', '600099', 'TamilNadu', '4f883eea-74df-4a4b-af79-7e03da6093c5', '1st Street', 80.201, 13.121699, '0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440', 'abc location');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('2aed0409-b94b-4247-83fc-941d5c7dd219', '654bbd67-f821-488f-afa7-c89541040950', 'Chennai', '600099', 'TamilNadu', 'fd1b5a82-3254-4a40-8a9d-cdc9351ef9ba', '1st Street', 80.201, 13.121699, '0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440', '');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('88c8ea6e-a6db-4ee1-9e02-7e2bc456a8b1', 'c6d7dc7d-734a-4e67-bb74-50295d972a49', 'Chennai ', '600036', 'tamilnadu', 'f0b67253-9513-45de-8770-1fff7571f720', 'Ragavan Colony,West jafferkanpet', 52.216515699999995, 6.9459706, '0101000020E6100000F5E85784ACC81B40074955C9B61B4A40', 'Ragavan Colony,West jafferkanpet');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('e64ad557-fdd3-4a0c-9156-b81ab5691999', '7d82d0fc-8f44-40a7-9cfe-d078ef627a3b', 'chennai', '600036', 'Tamilnadu', 'e5e000c1-584b-4a41-ba46-6b036c5cf0b6', 'Ragavan colony, Ashok pillar', 52.216515699999995, 6.9459706, '0101000020E6100000F5E85784ACC81B40074955C9B61B4A40', 'Ragavan colony, Ashok pillar');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('eeb8ab47-a10c-431c-82f6-a42ae2e95db6', '0f1e64ba-8f5c-462d-8cd4-0b804099f457', 'Chennai', '600099', 'TamilNadu', 'b70efebf-2151-476e-a91c-f8996c95c5f7', '1st Street', 80.201, 13.121699, '0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440', 'abc location');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('0300e3cc-1b61-4e09-870b-11da9bb84c36', 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', 'Chennai', '600099', 'tamilnadu', '2e94a0f5-2662-4d50-a379-f02e93f9f464', 'Raghavan Colony,jaferkanpet', 52.216515699999995, 13.121699, '0101000020E61000006CE9D1544F3E2A40074955C9B61B4A40', 'Raghavan Colony,jaferkanpet');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('67227c8d-5e11-47c9-80cf-78e88b88e782', 'a1bee6d7-2775-45e2-875b-1dd786ead852', 'Chennai', '600038', 'tamilnadu', '41745900-cece-42fd-b474-7fbbf4a12aad', 'Raghavan Colony,jaferkanpet', 52.216515699999995, 6.9459706, '0101000020E6100000F5E85784ACC81B40074955C9B61B4A40', '');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('59cb1e5c-0496-4584-ba29-a68fab78a03d', '75d59e13-85a5-48ce-9a3b-81db9065000e', 'Chennai ', '600001', 'tamilnadu ', '58b4c1ff-b79d-4a45-a123-c4ec79ffb9f8', 'Ragavan Colony, 1st link Street, ashok nagar', 52.216515699999995, 6.9459706, '0101000020E6100000F5E85784ACC81B40074955C9B61B4A40', 'Ragavan Colony, 1st link Street, ashok nagar');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('d39c818e-9403-4a98-8d03-773cb146d5aa', '027483e7-69d3-4f6e-99f6-9bff532f44e7', '.^¥°¥°¥÷`÷`π`××`×``°{`{¥=$=', '054646', '.√¥°¥={¥=¥°¥}{¥==¥{¥{¥{', '08f5614e-af6f-42fb-99ee-8e1bdb1cf001', '.&#&#--#-#+#+#((#)#)#(#+#+#(##(#((#(#(#', 52.216515699999995, 6.9459706, '0101000020E6100000F5E85784ACC81B40074955C9B61B4A40', '.&#&#--#-#+#+#((#)#)#(#+#+#(##(#((#(#(#');
INSERT INTO public.user_address (user_address_id, user_id, user_city, user_pincode, user_state, patient_id, user_address_line, user_latitude, user_longitude, user_geolocation, user_location) VALUES ('8c459c03-f47c-495f-a7f9-66bba73508aa', '00e4bcbe-9160-4e45-8f08-10999be2ef20', 'Chennai ', '600031', 'tamilnadu', '13dde1c5-4bc8-4618-bac4-03d652570868', 'ashok pillar ', 52.216515699999995, 6.9459706, '0101000020E6100000F5E85784ACC81B40074955C9B61B4A40', 'ashok pillar ');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('53645460-2c17-4518-b883-4f940980c5cd', 20, '2002-02-01', NULL, 'xxx', 'FEMALE', 'yyy', 80.201, 'abc location', 13.121699, 'YYY', '$2a$10$kLYwKtIBEP7LjAY31tEEzeALSsJ.hk49Nip/2Ixemc/J7jbck1oyO', '919566202701', '2022-12-13 13:18:03.435177', NULL, '0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440', NULL, '919566202701', NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('9326c643-b32c-4e0a-b483-373d56139772', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '91566202701', '2022-12-15 12:33:07.902547', NULL, '0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440', NULL, NULL, NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('4294ebd4-3498-4a23-bd89-87c126483cf9', 55, '1977-01-01', 'xyz@elite.com', NULL, 'MALE', NULL, NULL, NULL, NULL, 'XYZ', NULL, '918144528548', '2022-08-31 13:20:59.248', '2022-08-31 13:20:59.248', '0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440', 4.5, '918144528548', 'profile.jpg', false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('504f834c-f9e0-4362-bbdd-9541c4c061eb', 20, '2002-02-01', NULL, 'xxx', 'FEMALE', 'yyy', 80.201, 'abc location', 13.121699, 'YYY', '$2a$10$kLYwKtIBEP7LjAY31tEEzeALSsJ.hk49Nip/2Ixemc/J7jbck1oyO', '919566202702', '2022-12-13 13:18:03.435177', NULL, '0101000020E61000006CE9D1544F3E2A40BE9F1A2FDD0C5440', NULL, '919566202702', NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('e2e89481-a51a-43b0-b79c-ba66cfec4064', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '9943960728', '2023-02-27 09:34:19.841433', NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('654bbd67-f821-488f-afa7-c89541040950', 21, '2002-01-01', 'abc@elite.com', NULL, 'Male', NULL, NULL, NULL, NULL, 'Nadan', NULL, '9916522058', '2023-02-27 09:15:38.679659', NULL, NULL, NULL, '9916522058', 'profile.jpg', false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('c6d7dc7d-734a-4e67-bb74-50295d972a49', 13, '2009-04-02', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Shree', NULL, '9916522056', '2023-02-28 12:19:01.816181', NULL, NULL, NULL, '9916522056', 'profile.jpg', false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('7d82d0fc-8f44-40a7-9cfe-d078ef627a3b', 22, '2000-10-02', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Elite 3', NULL, '919916522051', '2023-02-28 14:26:48.174859', NULL, NULL, NULL, '919916522051', NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('0f1e64ba-8f5c-462d-8cd4-0b804099f457', 21, '2002-01-01', 'abc@elite.com', NULL, 'MALE', NULL, NULL, NULL, NULL, 'Etlite 3', NULL, '919916522053', '2023-03-03 06:23:05.935515', NULL, NULL, NULL, '919916522053', NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('f08b7652-3b4f-4ac6-9484-7d9ea5646a93', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '919926522058', '2023-03-13 04:50:19.243632', NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('25790e4b-bd27-4778-afa1-9b865347d662', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2256520557', '2023-03-16 14:11:53.439428', NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('d0bb07f5-94e3-4a0e-bffe-2d8e413507f5', 21, '2002-01-01', '', NULL, 'MALE', NULL, NULL, NULL, NULL, 'Elite 58', NULL, '919916522058', '2023-02-28 13:41:23.782389', NULL, NULL, NULL, '919916522058', 'profile.jpg', false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('a1bee6d7-2775-45e2-875b-1dd786ead852', 13, '2009-09-03', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Elite 54', NULL, '919916522054', '2023-03-17 09:41:34.223315', NULL, NULL, NULL, '919916522054', 'profile.jpg', false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('75d59e13-85a5-48ce-9a3b-81db9065000e', 27, '1995-04-18', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Elite 55', NULL, '919916522057', '2023-04-17 07:47:01.289654', NULL, NULL, NULL, '919916522057', NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('907ce649-a378-41ad-bb2d-3a00444a197d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '911234567888', '2023-04-17 09:34:34.721257', NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('5f0e3e51-f3d6-4780-9fca-6cf92c511211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '911234567855', '2023-04-17 09:35:50.837088', NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('69e635ba-e2d7-4fe9-b5b3-65399ed6fc20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '911234567853', '2023-04-17 09:35:57.496652', NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('8ef04636-958a-49c3-9346-b3b254c5a66b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '911234567838', '2023-04-17 09:36:02.23844', NULL, NULL, NULL, NULL, NULL, false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('027483e7-69d3-4f6e-99f6-9bff532f44e7', 0, '2023-04-17', 'hxcucucu@yffufugu', NULL, 'Female', NULL, NULL, NULL, NULL, 'hchchc', NULL, '911234567833', '2023-04-17 09:36:16.439716', NULL, NULL, NULL, NULL, 'profile.jpg', false);
INSERT INTO public.users (user_id, user_age, user_dob, user_email, user_firstname, user_gender, user_lastname, user_latitude, user_location, user_longitude, user_name, user_password, user_phone, created_at, updated_at, user_geolocation, user_avg_rating, user_whatsapp_phone, user_profile_image_name, user_is_deleted) VALUES ('00e4bcbe-9160-4e45-8f08-10999be2ef20', 28, '1995-04-18', '', NULL, 'Male', NULL, NULL, NULL, NULL, 'Elite y', NULL, '919919522055', '2023-04-20 05:54:18.649647', NULL, NULL, NULL, '919919522055', NULL, false);


--
-- Data for Name: user_appointment_complaint; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user_favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_favourites (user_favourites_id, user_id, nurse_id, created_at, updated_at) VALUES (3, '4294ebd4-3498-4a23-bd89-87c126483cf9', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-01-18 11:50:52.656306', '2023-01-18 11:50:52.656306');
INSERT INTO public.user_favourites (user_favourites_id, user_id, nurse_id, created_at, updated_at) VALUES (7, '53645460-2c17-4518-b883-4f940980c5cd', 'ee58f1f1-eb8b-4567-a15d-ddfc670252d6', '2023-01-18 11:58:38.078745', '2023-01-18 11:58:38.078745');
INSERT INTO public.user_favourites (user_favourites_id, user_id, nurse_id, created_at, updated_at) VALUES (9, '53645460-2c17-4518-b883-4f940980c5cd', '18803b4e-6683-11ed-b767-0242ac110002', '2023-01-19 04:37:23.943819', '2023-01-19 04:37:23.943819');


--
-- Data for Name: user_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_notifications (user_notifications_id, user_id, user_notifications_subject, appointment_session_id, notification_date, created_at, updated_at, is_read) VALUES (11, '4294ebd4-3498-4a23-bd89-87c126483cf9', 'Your appointment is completed', 4, '2023-03-08', '2023-03-08 08:19:30.317762', '2023-03-08 08:19:30.317762', true);
INSERT INTO public.user_notifications (user_notifications_id, user_id, user_notifications_subject, appointment_session_id, notification_date, created_at, updated_at, is_read) VALUES (12, 'd0bb07f5-94e3-4a0e-bffe-2d8e413507f5', 'Your appointment is completed', 4, '2023-03-13', '2023-03-13 13:36:12.045018', '2023-03-13 13:36:12.045018', true);


--
-- Data for Name: user_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_settings (user_settings_id, user_id, user_language, notifications_on, whatsapp_alerts_on, created_at, updated_at) VALUES (1, '53645460-2c17-4518-b883-4f940980c5cd', 'English', true, true, '2023-01-16 10:09:03.527765', '2023-01-16 10:09:03.527765');


--
-- Name: appointment_request_status_appointment_request_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_request_status_appointment_request_status_id_seq', 48, true);


--
-- Name: appointment_requests_appointment_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_requests_appointment_request_id_seq', 86, true);


--
-- Name: appointment_sessions_appointment_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointment_sessions_appointment_session_id_seq', 70, true);


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

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 44, true);


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

SELECT pg_catalog.setval('public.nurse_earnings_nurse_earnings_id_seq', 15, true);


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

SELECT pg_catalog.setval('public.otp_for_appointment_session_otp_for_appointment_session_id_seq', 53, true);


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
-- PostgreSQL database dump complete
--

