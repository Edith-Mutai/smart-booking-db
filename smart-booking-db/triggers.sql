-- Function to update property status after booking
CREATE OR REPLACE FUNCTION update_property_status()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE properties
    SET status = 'booked'
    WHERE property_id = NEW.property_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger that runs after a booking is inserted
CREATE TRIGGER after_booking_insert
AFTER INSERT ON bookings
FOR EACH ROW
EXECUTE FUNCTION update_property_status();