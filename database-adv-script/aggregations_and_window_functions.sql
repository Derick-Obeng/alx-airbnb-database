SELECT 
  u.id AS user_id,
  u.name,
  COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name
ORDER BY total_bookings DESC;




SELECT 
  p.id AS property_id,
  p.title,
  COUNT(b.id) AS total_bookings,
  ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY booking_rank;


SELECT 
  p.id AS property_id,
  p.title,
  COUNT(b.id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank_with_ties
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.title
ORDER BY rank_with_ties;


