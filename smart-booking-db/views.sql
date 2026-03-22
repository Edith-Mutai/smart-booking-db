-- Monthly revenue view
CREATE VIEW monthly_revenue AS
SELECT 
    DATE_TRUNC('month', p.paid_at) AS month,
    SUM(p.amount) AS total_revenue
FROM payments p
WHERE p.payment_status = 'successful'
GROUP BY month;

-- Top earning properties
CREATE VIEW top_properties AS
SELECT 
    p.property_id,
    p.title,
    SUM(b.total_amount) AS total_revenue
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.booking_status = 'completed'
GROUP BY p.property_id, p.title;

-- Most popular locations
CREATE VIEW popular_locations AS
SELECT 
    pr.location,
    COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN properties pr ON b.property_id = pr.property_id
GROUP BY pr.location;

-- Customer booking summary
CREATE VIEW customer_activity AS
SELECT 
    user_id,
    COUNT(booking_id) AS total_bookings
FROM bookings
GROUP BY user_id;