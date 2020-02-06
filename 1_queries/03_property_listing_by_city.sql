SELECT properties.id, title, province FROM properties
-- JOIN property_reviews ON properties.id = property_id
WHERE province = 'Vancouver'
-- ORDER BY cost_per_night ASC;
