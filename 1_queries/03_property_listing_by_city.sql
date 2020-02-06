SELECT properties.id, title, city, cost_per_night, avg(property_reviews.rating) as avg_rating FROM properties
INNER JOIN property_reviews ON properties.id = property_id
WHERE city = 'Vancouver'
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY cost_per_night ASC;
