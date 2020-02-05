# Requirements

## OBJECTS
- The app will have 
  - users, 
  - properties, 
  - reservations, 
  - and property reviews.

### USER
- A user will have a 
  - name, 
  - email address, 
  - and password.

### PROPERTY
- A property will have a title, description, costpernight, parking_spaces, numberofbathrooms, and numberofbedrooms.
  - A property will need to have images associated with it, so for now we will store a url for a small thumbnail photo and a large cover photo.
  - A property will need address data associated with it including country, street, city, province, post_code
  - A property can either be active or not active depending on weather the owner is currently renting it out or not.
  - A property will have an owner which will be one of the registered users.

### RESERVATIONS
- A reservation will have a start date and an end date
  - A reservation will be made by a guest, which will be a registered user, and will be associated with a single property
  
### PROPERTY REVIEW
- A property review will have a message and a rating from 1 to 5
  - A property review can be made by a guest and will be associated with a single reservation


### RELATIONSHIPS
- A user can own many properties
- A property belongs to one owner
- A user can make many reservation
- A reservation belongs to one guest
- A property can be reviewed by many guests

user **IS HIERARCH**
property **BELONGS TO** owner (user)
reservation **BELONGS TO** guest (user)
property review **BELONGS TO** property, guest
address **BELONGS TO** property



