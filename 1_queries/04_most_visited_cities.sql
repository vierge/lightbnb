SELECT city as name, count(reservations.id) as total_reservations FROM properties 
JOIN reservations ON property_id = properties.id
GROUP BY city
ORDER BY count(reservations.id) DESC; 