-- Top 5 customers by total spending
SELECT 
    u.user_id,
    u.full_name,
    SUM(b.total_amount) AS total_spent
FROM users u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_status = 'completed'
GROUP BY u.user_id, u.full_name
ORDER BY total_spent DESC
LIMIT 5;

-- Average stay duration
SELECT 
    AVG(check_out - check_in) AS avg_stay_days
FROM bookings
WHERE booking_status = 'completed';

-- Monthly revenue with growth
WITH monthly AS (
    SELECT 
        DATE_TRUNC('month', p.paid_at) AS month,
        SUM(p.amount) AS revenue
    FROM payments p
    WHERE p.payment_status = 'successful'
    GROUP BY month
)
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month,
    (revenue - LAG(revenue) OVER (ORDER BY month)) AS growth
FROM monthly;

-- Most booked property
SELECT 
    p.property_id,
    p.title,
    COUNT(b.booking_id) AS total_bookings
FROM properties p
JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY total_bookings DESC
LIMIT 1;

-- Booking cancellation rate
SELECT 
    COUNT(*) FILTER (WHERE booking_status = 'cancelled') * 100.0 / COUNT(*) AS cancellation_rate
FROM bookings;

-- Customers with more than 1 booking
SELECT 
    user_id,
    COUNT(*) AS booking_count
FROM bookings
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Revenue by location
SELECT 
    p.location,
    SUM(b.total_amount) AS total_revenue
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_status = 'completed'
GROUP BY p.location
ORDER BY total_revenue DESC;

