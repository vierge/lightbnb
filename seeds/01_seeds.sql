-- i put jokes in the bcrypt hashes. the actual passwords can be deciphered at a bcrypt translator website

INSERT INTO users (id, name, email, password)
VALUES 
(1, 'Mara Gray', 'marancholia@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
(2, 'Haley Phoenix', 'haleysemail@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
(3, 'pockyenthusiast420', 'i.luv.the.pock@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
(4, 'Jeff Benzos', 'god-emperor@amazon.com', '$2y$12$v4A9sOTBrodyGaw1caexmOS3BSxd2m4HycPDc1klg7pCjEqPmol/.'),
(5, 'landlord', 'capitalist@scum.me', '$2y$12$o5GFdw7c3vLjpE74lrDmk.XUAA/2GSGoh.esDa8QGgmEmsurs7mbm');

INSERT INTO properties (id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES 
(1, 2, 'Eevee Themed Pillow Fort', 'A Place For Sleepy Eevee Enthusiasts', 'url', 'url', 90, 9, 1, 1, 'present world', 'present state', 'present day', 'present time', '666 666', true),
(2, 4, 'Palace Of Defeated Proles', 'Get Away From The Stench Of The Poor And Appreciate My Jeff-Like Bezo-ddling Adonis Body In The Company Of Several Famous Musicians That I Have Subjugated At This Stunning 17th Century Manse In The Heart Of The Quickly-Warming Pacific Northwest', 'url', 'url', 8900, 420, 69, 1, 'present world', 'present state', 'present day', 'present time', '666 666', true),
(3, 3, 'Green Tea Flavour', 'Trans Fats: 0.1g, Saturated Fats: 6g - 31% Daily Value Per Pack', 'url', 'url', 79, 16, 0, 8, 'present world', 'present state', 'present day', 'present time', '666 666', false),
(4, 1, 'garbage basement', 'beautiful north toronto city views - full kitchen complete w/ bathtub', 'url', 'url', 2999, 0, 1, 0, 'present world', 'present state', 'present day', 'present time', '666 666', true),
(5, 5, 'apartment', 'affordable', 'url', 'url', 1050, 1, 2, 2, 'present world', 'present state', 'present day', 'present time', '666 666', false);

INSERT INTO reservations (id, start_date, end_date, property_id, guest_id)
VALUES
(1, Now(), Now(), 5, 1),
(2, Now(), Now(), 4, 2),
(3, Now(), Now(), 4, 5),
(4, Now(), Now(), 4, 1),
(5, Now(), Now(), 1, 3);

INSERT INTO property_reviews (id, reservation_id, guest_id, property_id, rating, message)
VALUES
(1, 3, 1, 5, 5, 'i cannot fill this out right now'),
(2, 1, 2, 2, 3, 'you have asked me to seed a database by hand'),
(3, 2, 3, 3, 3, 'this is actual torture and should be illegal. you would not expect someone to do this professionally for free'),
(4, 4, 4, 4, 3, 'it hurts. this is goblin work'),
(5, 2, 5, 1, 100, 'this is actually really mean i feel very insulted rn');