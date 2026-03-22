INSERT INTO users (full_name, email, role)
VALUES
('Edith Mutai', 'edith@freelance.com', 'host'),
('Jane Guest', 'jane@traveller.com', 'guest'),
('Admin User', 'admin@smartbook.com', 'admin'),
('John Host', 'john@listings.com', 'host'),
('Mary Guest', 'mary@guest.com', 'guest'),
('Alex Host', 'alex@airbnbclone.com', 'host'),
('Lily Guest', 'lily@traveller.com', 'guest'),
('Mark Host', 'mark@rentals.com', 'host'),
('Nina Guest', 'nina@traveller.com', 'guest'),
('Sam Guest', 'sam@guest.com', 'guest');

INSERT INTO bookings (user_id, property_id, check_in, check_out, booking_status, total_amount)
VALUES
(2, 1, '2026-03-10', '2026-03-15', 'confirmed', 250.00),
(5, 2, '2026-04-01', '2026-04-05', 'completed', 480.00),
(7, 3, '2026-03-20', '2026-03-23', 'pending', 240.00),
(9, 4, '2026-03-12', '2026-03-14', 'cancelled', 120.00),
(2, 5, '2026-03-18', '2026-03-20', 'completed', 80.00),
(5, 6, '2026-03-25', '2026-03-30', 'confirmed', 1000.00);

INSERT INTO payments (booking_id, payment_method, payment_status, amount)
VALUES
(1, 'Credit Card', 'successful', 250.00),
(2, 'MPesa', 'successful', 480.00),
(3, 'Credit Card', 'pending', 240.00),
(4, 'PayPal', 'failed', 120.00),
(5, 'MPesa', 'successful', 80.00),
(6, 'Credit Card', 'successful', 1000.00);

INSERT INTO reviews (booking_id, rating, comment)
VALUES
(2, 5, 'Amazing beach house! Loved the view.'),
(5, 4, 'Cozy and clean apartment in Nairobi.'),
(6, 5, 'Luxury villa, very spacious and comfortable.');
