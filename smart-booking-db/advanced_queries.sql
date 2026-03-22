-- Top earning properties
SELECT 
    p.property_id,
    p.title,
    SUM(b.total_amount) AS total_revenue
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_status = 'completed'
GROUP BY p.property_id, p.title
ORDER BY total_revenue DESC;

-- Top hosts ranking
SELECT 
    host_id,
    COUNT(property_id) AS total_properties,
    RANK() OVER (ORDER BY COUNT(property_id) DESC) AS host_rank
FROM properties
GROUP BY host_id;

-- Monthly revenue
SELECT 
    DATE_TRUNC('month', paid_at) AS month,
    SUM(amount) AS total_revenue
FROM payments
WHERE payment_status = 'successful'
GROUP BY month
ORDER BY month;

-- Most popular locations
SELECT 
    pr.location,
    COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN properties pr ON b.property_id = pr.property_id
GROUP BY pr.location
ORDER BY total_bookings DESC;

-- Average booking duration
SELECT 
    AVG(check_out - check_in) AS avg_days
FROM bookings;

-- Repeat customers
SELECT 
    user_id,
    COUNT(booking_id) AS total_bookings
FROM bookings
GROUP BY user_id
HAVING COUNT(booking_id) > 1;

-- Cancellation rate
SELECT 
    COUNT(*) FILTER (WHERE booking_status = 'cancelled') * 100.0 
    / COUNT(*) AS cancellation_rate
FROM bookings;