const { Pool } = require('pg');
const properties = require('./json/properties.json');
const users = require('./json/users.json');

const pool = new Pool({
  user:'vagrant',
  password:'123',
  host:'localhost',
  database:'lightbnb'
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function(email) {

  const queryString = `
    SELECT * FROM users
    WHERE email = $1
  `
  return pool.query(queryString, [`${email}`])
  .then(res => {
    console.log(res.rows[0]);
    return res.rows[0];
  })
  .catch(err => console.log('cannot find user!', err.stack));
}
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function(id) {
  const queryString = `
    SELECT * FROM users
    WHERE id = $1
  `
  return pool.query(queryString, [`${id}`])
  .then(res => {
    console.log(res.rows[0]);
    return res.rows[0];
  })
  .catch(err => console.log('cannot find user!', err.stack));
}
exports.getUserWithId = getUserWithId;


/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser =  function(user) {

  
  const queryString = `
    INSERT INTO users (name, email, password)
    VALUES ($1, $2, $3)
    RETURNING *;
  `
  return pool.query(queryString, [`${user.name}`, `${user.email}`, `${user.password}`])
  .then(res => {
    res.rows
    console.log(`grabbed ${res.rows}`);
  })
  .catch(err => console.log(`error error error!!!!`, err.stack));

  // const userId = Object.keys(users).length + 1;
  // user.id = userId;
  // users[userId] = user;
  // return Promise.resolve(user);
}
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {
  queryString = `
  SELECT reservations.*, properties.*, avg(property_reviews.rating) 
  FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON property_reviews.property_id = properties.id
  WHERE reservations.guest_id = $1
  AND end_date < now()::date
  GROUP BY properties.id, reservations.id
  ORDER BY start_date ASC
  LIMIT $2;
  `
  return pool.query(queryString, [`${guest_id}`, `${limit}`])
  .then(res => {
    console.log(res.rows);
    return res.rows
  })
  .catch(err => console.log('QUERY FAILED.', err.stack));

}
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function(options, limit = 10) { 
  
  const values = [`${limit}`];
  const queryString = `
    SELECT *, avg(property_reviews.rating) as average_rating FROM properties
    JOIN property_reviews ON property_id = properties.id
    GROUP BY property_reviews.id, properties.id
    LIMIT $1
  `;

  return pool.query(queryString, values)
  .then(res => res.rows)
  .catch(err => console.log('QUERY FAILED.', err.stack));
  
}
// const limitedProperties = {};
// for (let i = 1; i <= limit; i++) {
//   limitedProperties[i] = properties[i];
// }
// return Promise.resolve(limitedProperties);
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;
