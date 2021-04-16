-- Find the earliest date a user joined
SELECT 
    DATE_FORMAT(MIN(created_at), "%M %D %Y") AS 'Earliest User'
FROM users;

-- Find the email of the earliest user
SELECT * FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);

-- How many users signed up each month
SELECT 
    MONTHNAME(created_at) AS month,
    COUNT(*) AS total
FROM users
GROUP BY month
ORDER BY total DESC;

-- Count the number of users with Yahoo emails
SELECT COUNT(*) AS Yahoo_Users
FROM users 
WHERE email LIKE '%@yahoo.com';

-- Calculate total number of users for each email host
SELECT 
    CASE
        WHEN email LIKE '%@yahoo.com' THEN 'Yahoo'
        WHEN email LIKE '%@gmail.com' THEN 'Gmail'
        WHEN email LIKE '%@hotmail.com' THEN 'Hotmail'
        ELSE 'Other'
    END AS provider,
    COUNT(*) AS 'Amount'
FROM users
GROUP BY provider
ORDER BY Amount DESC;

     