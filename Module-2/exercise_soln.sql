--Exercise 1: User Upcoming Events
SELECT 
    u.full_name AS User_Name,
    e.title AS Event_Title,
    e.city AS Event_City,
    e.start_date AS Event_Start_Date
FROM 
    Users u
JOIN 
    Registrations r ON u.user_id = r.user_id
JOIN 
    Events e ON r.event_id = e.event_id
WHERE 
    e.status = 'upcoming' 
    AND u.city = e.city
ORDER BY 
    e.start_date;

--Exercise 2: Top Rated Events 
SELECT 
    e.title AS Event_Title,
    AVG(f.rating) AS Average_Rating,
    COUNT(f.feedback_id) AS Feedback_Count
FROM 
    Events e
JOIN 
    Feedback f ON e.event_id = f.event_id
GROUP BY 
    e.event_id, e.title
HAVING 
    COUNT(f.feedback_id) >= 10
ORDER BY 
    Average_Rating DESC;


--Exercise 3: Inactive Users
SELECT 
    u.full_name AS User_Name,
    u.email AS Email,
    MAX(r.registration_date) AS Last_Registration_Date
FROM 
    Users u
LEFT JOIN 
    Registrations r ON u.user_id = r.user_id
GROUP BY 
    u.user_id, u.full_name, u.email
HAVING 
    MAX(r.registration_date) < CURDATE() - INTERVAL 90 DAY
    OR MAX(r.registration_date) IS NULL;


--Exercise 4: Peak Session Hours
SELECT 
    e.title AS Event_Title,
    COUNT(s.session_id) AS Session_Count
FROM 
    Sessions s
JOIN 
    Events e ON s.event_id = e.event_id
WHERE 
    TIME(s.start_time) >= '10:00:00' 
    AND TIME(s.start_time) < '12:00:00'
GROUP BY 
    e.event_id, e.title;


--Exercise 5: Most Active Cities
SELECT 
    e.city AS City,
    COUNT(DISTINCT r.user_id) AS Distinct_User_Registrations
FROM 
    Events e
JOIN 
    Registrations r ON e.event_id = r.event_id
GROUP BY 
    e.city
ORDER BY 
    Distinct_User_Registrations DESC
LIMIT 5;


--Exercise 6: Event Resource Summary
SELECT 
    e.title AS Event_Title,
    COUNT(CASE WHEN r.resource_type = 'pdf' THEN 1 END) AS PDF_Count,
    COUNT(CASE WHEN r.resource_type = 'image' THEN 1 END) AS Image_Count,
    COUNT(CASE WHEN r.resource_type = 'link' THEN 1 END) AS Link_Count
FROM 
    Events e
LEFT JOIN 
    Resources r ON e.event_id = r.event_id
GROUP BY 
    e.event_id, e.title;


--Exercise 7: Low Feedback Alerts
SELECT 
    u.full_name AS User_Name,
    f.rating AS Rating,
    f.comments AS Comments,
    e.title AS Event_Title
FROM 
    Feedback f
JOIN 
    Users u ON f.user_id = u.user_id
JOIN 
    Events e ON f.event_id = e.event_id
WHERE 
    f.rating < 3;


--Exercise 8: Sessions per Upcoming Event
SELECT 
    e.title AS Event_Title,
    COUNT(s.session_id) AS Session_Count
FROM 
    Events e
LEFT JOIN 
    Sessions s ON e.event_id = s.event_id
WHERE 
    e.status = 'upcoming'
GROUP BY 
    e.event_id, e.title;


--Exercise 9: Organizer Event Summary
SELECT 
    u.full_name AS Organizer_Name,
    e.status AS Event_Status,
    COUNT(e.event_id) AS Event_Count
FROM 
    Users u
JOIN 
    Events e ON u.user_id = e.organizer_id
GROUP BY 
    u.user_id, u.full_name, e.status;


--Exercise 10: Feedback Gap
SELECT 
    e.title AS Event_Title
FROM 
    Events e
JOIN 
    Registrations r ON e.event_id = r.event_id
LEFT JOIN 
    Feedback f ON e.event_id = f.event_id
WHERE 
    f.feedback_id IS NULL
GROUP BY 
    e.event_id, e.title;

--Exercise 11: Daily New User Count
SELECT 
    registration_date AS Date,
    COUNT(user_id) AS New_User_Count
FROM 
    Users
WHERE 
    registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY 
    registration_date;


--Exercise 12: Event with Maximum Sessions
SELECT 
    e.title AS Event_Title,
    COUNT(s.session_id) AS Session_Count
FROM 
    Events e
JOIN 
    Sessions s ON e.event_id = s.event_id
GROUP BY 
    e.event_id, e.title
ORDER BY 
    Session_Count DESC
LIMIT 1;

--Exercise 13: Average Rating per City
SELECT 
    e.city AS City,
    AVG(f.rating) AS Average_Rating
FROM 
    Feedback f
JOIN 
    Events e ON f.event_id = e.event_id
GROUP BY 
    e.city;

--Exercise 14: Most Registered Events
SELECT 
    e.title AS Event_Title,
    COUNT(r.registration_id) AS Registration_Count
FROM 
    Events e
JOIN 
    Registrations r ON e.event_id = r.event_id
GROUP BY 
    e.event_id, e.title
ORDER BY 
    Registration_Count DESC
LIMIT 3;


--Exercise 15: Event Session Time Conflict
SELECT 
    s1.event_id,
    s1.title AS Session_1,
    s2.title AS Session_2
FROM 
    Sessions s1
JOIN 
    Sessions s2 ON s1.event_id = s2.event_id
WHERE 
    s1.session_id != s2.session_id
    AND s1.start_time < s2.end_time
    AND s1.end_time > s2.start_time;


--Exercise 16: Unregistered Active Users
SELECT 
    u.full_name AS User_Name,
    u.email AS Email
FROM 
    Users u
LEFT JOIN 
    Registrations r ON u.user_id = r.user_id
WHERE 
    u.registration_date >= CURDATE() - INTERVAL 30 DAY
    AND r.registration_id IS NULL;


--Exercise 17: Multi-Session Speakers
SELECT 
    s.speaker_name AS Speaker_Name,
    COUNT(s.session_id) AS Session_Count
FROM 
    Sessions s
GROUP BY 
    s.speaker_name
HAVING 
    COUNT(s.session_id) > 1;


--Exercise 18: Resource Availability Check
SELECT 
    e.title AS Event_Title
FROM 
    Events e
LEFT JOIN 
    Resources r ON e.event_id = r.event_id
WHERE 
    r.resource_id IS NULL;


--Exercise 19: Completed Events with Feedback Summary
SELECT 
    e.title AS Event_Title,
    COUNT(r.registration_id) AS Total_Registrations,
    AVG(f.rating) AS Average_Rating
FROM 
    Events e
LEFT JOIN 
    Registrations r ON e.event_id = r.event_id
LEFT JOIN 
    Feedback f ON e.event_id = f.event_id
WHERE 
    e.status = 'completed'
GROUP BY 
    e.event_id, e.title;


--Exercise 20: User Engagement Index
SELECT 
    u.full_name AS User_Name,
    COUNT(DISTINCT r.event_id) AS Events_Attended,
    COUNT(DISTINCT f.feedback_id) AS Feedback_Submitted
FROM 
    Users u
LEFT JOIN 
    Registrations r ON u.user_id = r.user_id
LEFT JOIN 
    Feedback f ON u.user_id = f.user_id
GROUP BY 
    u.user_id, u.full_name;


--Exercise 21: Top Feedback Providers
SELECT 
    u.full_name AS User_Name,
    COUNT(f.feedback_id) AS Feedback_Count
FROM 
    Users u
JOIN 
    Feedback f ON u.user_id = f.user_id
GROUP BY 
    u.user_id, u.full_name
ORDER BY 
    Feedback_Count DESC
LIMIT 5;


--Exercise 22: Duplicate Registrations Check
SELECT 
    r.user_id,
    r.event_id,
    COUNT(r.registration_id) AS Registration_Count
FROM 
    Registrations r
GROUP BY 
    r.user_id, r.event_id
HAVING 
    COUNT(r.registration_id) > 1;


--Exercise 23: Registration Trends
SELECT 
    DATE_FORMAT(r.registration_date, '%Y-%m') AS Registration_Month,
    COUNT(r.registration_id) AS Registration_Count
FROM 
    Registrations r
WHERE 
    r.registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY 
    Registration_Month
ORDER BY 
    Registration_Month;


--Exercise 24: Average Session Duration per Event
SELECT 
    e.title AS Event_Title,
    AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time)) AS Avg_Session_Duration
FROM 
    Events e
JOIN 
    Sessions s ON e.event_id = s.event_id
GROUP BY 
    e.event_id, e.title;


--Exercise 25: Events Without Sessions
SELECT 
    e.title AS Event_Title
FROM 
    Events e
LEFT JOIN 
    Sessions s ON e.event_id = s.event_id
WHERE 
    s.session_id IS NULL;