-- Monthly revenue view
CREATE OR REPLACE VIEW monthly_revenue AS
SELECT 
    DATE_TRUNC('month', p.paid_at) AS month,
    SUM(p.amount) AS total_revenue
FROM payments p
WHERE p.payment_status = 'successful'
GROUP BY month
ORDER BY month;

-- Top earning properties
CREATE OR REPLACE VIEW top_properties AS
SELECT 
    p.property_id,
    p.title,
    p.location,
    SUM(b.total_amount) AS total_revenue
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_status = 'completed'
GROUP BY p.property_id, p.title, p.location
ORDER BY total_revenue DESC;

-- Most popular locations
CREATE OR REPLACE VIEW popular_locations AS
SELECT 
    pr.location,
    COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN properties pr ON b.property_id = pr.property_id
GROUP BY pr.location
ORDER BY total_bookings DESC;

-- Customer booking summary
CREATE OR REPLACE VIEW customer_activity AS
SELECT 
    user_id,
    COUNT(booking_id) AS total_bookings,
    SUM(total_amount) AS total_spent
FROM bookings
GROUP BY user_id
ORDER BY total_spent DESC;

-- Advanced Host performance ranking
CREATE OR REPLACE VIEW host_performance AS
SELECT
    u.user_id,
    u.full_name,
    COUNT(p.property_id) AS total_properties,
    SUM(b.total_amount) AS total_earnings,
    RANK() OVER (ORDER BY SUM(b.total_amount) DESC) AS host_rank
FROM users u
JOIN properties p ON u.user_id = p.host_id
JOIN bookings b ON p.property_id = b.property_id
WHERE b.booking_status = 'completed'
GROUP BY u.user_id, u.full_name;

