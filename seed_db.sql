
-- DELETE FROM HireItem;
-- DELETE FROM HireAgreement;
-- DELETE FROM EquipmentItem;
-- DELETE FROM EquipmentType;
-- DELETE FROM TripRegistration;
-- DELETE FROM ScheduledTrip;
-- DELETE FROM TripType;
-- DELETE FROM Customer;
-- 
INSERT INTO Customer (name, phone, dob, is_member, sponsor_id) VALUES
('Professor Professorson', '0211234567', '1990-04-15', TRUE, NULL), -- id 1
('Underpaid Tutor', '0227654321', '1985-09-20', TRUE, 1),			-- id 2
('David Goggins', '0208888888', '2000-02-12', FALSE, NULL),			-- id 3
('Noam Chomsky', '0273333333', '1995-07-05', TRUE, 1),				-- id 4
('Bob Bobbington', '0215555555', '1988-12-22', FALSE, NULL);		-- id 5

INSERT INTO TripType (trip_code, trip_name, difficulty_level, fee, length_days) VALUES
('4123', 'Beginners Kayaking', 'Easy', 120.00, 2),
('5123', 'Advanced Kayaking', 'Hard', 450.00, 4),
('4123B', 'Begginers Kayaking (Long Course)', 'Moderate', 300.00, 6);

INSERT INTO ScheduledTrip (trip_code, trip_date, leader_id, assistant_id) VALUES
('4123', '2025-11-01', 1, 2),
('5123', '2025-12-01', 1, 4), 
('4123B', '2025-11-01', 1, 2), -- Test that we can have a different trip on same day
('4123', '2026-01-21', 4, 1);

INSERT INTO TripRegistration (scheduled_trip_id, customer_id, signed_waiver) VALUES
(1, 1, TRUE),	-- PP going on trip 1
(1, 3, TRUE),	-- DG going on trip 1
(2, 2, TRUE), 	-- UT going on trip 2
(2, 5, FALSE),  -- BB going on trip 2
(3, 4, TRUE);	-- NC going on trip 3

INSERT INTO EquipmentType (name, daily_rate_student, daily_rate_staff_alumni, daily_rate_guest) VALUES
('Kayak', 10.00, 12.00, 15.00), 			-- id 1
('Sleeping Bag', 5.00, 6.00, 8.00),			-- id 2
('Backpack', 7.00, 8.00, 10.00),			-- id 3
('Climbing Rope', 12.00, 14.00, 18.00);		-- id 4

INSERT INTO EquipmentItem (equipment_type_id, `condition`) VALUES
(1, 'Good'), 	-- Kayak, id 1
(1, 'Fair'),	-- Kayak, id 2
(2, 'Good'),	-- Sleeping bag, id 3
(3, 'Poor'),	-- backpack, id 4
(4, 'Good'),	-- rope, id 5
(4, 'Fair');    -- rope, id 6

INSERT INTO HireAgreement (customer_id, staff_id, hire_date) VALUES
(1, 2, '2025-10-29'),	-- PP hire overseen by UT, id 1
(3, 4, '2025-10-02'),	-- DG hire overseen by NC, id 2
(4, 2, '2025-10-03');	-- NC hise overseen by UT, id 3

INSERT INTO HireItem (hire_id, equipment_id, expected_return, actual_return) VALUES
(1, 1, '2025-11-06', '2025-11-05'), 	-- PP hired KAYAK, returned early
(1, 4, '2025-11-06', NULL),				-- PP hired backpack, not returned
(2, 3, '2025-10-06', '2025-10-06'),		-- DG hired sleeping bag, returned
(3, 5, '2025-10-07', NULL);				-- NC hired rope, not returned