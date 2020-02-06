INSERT INTO users (id, name, email, password)
  VALUES 
  (0, 'Mara Gray', 'marancholia@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
  (1, 'Haley Phoenix', 'haleysemail@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
  (2, 'pockyenthusiast420', 'i.luv.the.pock@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
  (3, 'Jeff Benzos', 'god-emperor@amazon.com', '$2y$12$v4A9sOTBrodyGaw1caexmOS3BSxd2m4HycPDc1klg7pCjEqPmol/.'),
  (4, 'landlord', 'capitalist@scum.me', '$2y$12$o5GFdw7c3vLjpE74lrDmk.XUAA/2GSGoh.esDa8QGgmEmsurs7mbm');

INSERT INTO properties (id, title, description, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, active)
VALUES 
(0, 'Eevee Themed Pillow Fort', 'A Place For Sleepy Eevee Enthusiasts', 90, 9, 1, 1, true),
(1, 'Palace Of Defeated Proles', 'Get Away From The Stench Of The Poor And Appreciate My Jeff-Like Bezo-ddling Adonis Body In The Company Of Several Famous Musicians That I Have Subjugated At This Stunning 17th Century Manse In The Heart Of The Quickly-Warming Pacific Northwest', 8900, 420, 69, 1, true),
(2, 'Green Tea Flavour', 'Trans Fats: 0.1g, Saturated Fats: 6g - 31% Daily Value Per Pack', 79, 16, 0, 8, false),
(3, 'garbage basement', 'beautiful north toronto city views - full kitchen complete w/ bathtub', 2999, 0, 1, 0, true),
(4, 'apartment', 'affordable', 1050, 1, 2, 2, false);

INSERT INTO addresses (property_id, country, street, city, province_or_state, post_code_or_zip)
VALUES
(0, 'present world', 'present state', 'present day', 'present time', '666 666'),
(1, 'present world', 'present state', 'present day', 'present time', '666 666'),
(2, 'present world', 'present state', 'present day', 'present time', '666 666'),
(3, 'present world', 'present state', 'present day', 'present time', '666 666'),
(4, 'present world', 'present state', 'present day', 'present time', '666 666');

INSERT INTO reservations (id, start_date, end_date, property_id, guest_id)
VALUES
(0, Now(), Now(), 0, 1),
(1, Now(), Now(), 4, 2),
(2, Now(), Now(), 4, 0),
(3, Now(), Now(), 4, 1),
(4, Now(), Now(), 1, 3);

INSERT INTO property_reviews (id, reservation_id, guest_id, rating, message)
VALUES
(0, 3, 1, 5, 'i cannot fill this out right now'),
(1, 1, 2, 3, 'you have asked me to seed a database by hand'),
(2, 2, 3, 3, 'this is actual torture and should be illegal. you would not expect someone to do this professionally for free'),
(3, 4, 4, 3, 'please do not do this to people. we have so many better things to do that are actually interesting and not goblin work'),
(4, 0, 0, 100, 'this is actually really mean. please reconsider this assignment. please');