INSERT INTO customer (id, name) VALUES
  (1, 'Acme Corporation'),
  (2, 'Globex Inc.'),
  (3, 'Initech'),
  (4, 'Umbrella Corp'),
  (5, 'Stark Industries');

INSERT INTO system_user (id, fullname, email, mailing_list, customer_id, admin) VALUES
  (1, 'Alice Smith', 'alice@acme.com', false, 1, false),
  (2, 'Bob Jones', 'bob@acme.com', false, 1, false),
  (3, 'Charlie Brown', 'charlie@acme.com', false, 1, false),
  (4, 'Dave Wilson', 'dave@globex.com', false, 2, false),
  (5, 'Eve Adams', 'eve@globex.com', false, 2, false),
  (6, 'Frank Underwood', 'frank@initech.com', false, 3, false),
  (7, 'Grace Hopper', 'grace@initech.com', false, 3, false),
  (8, 'Heidi Klum', 'heidi@initech.com', false, 3, false),
  (9, 'Ivy League', 'ivy@umbrella.com', false, 4, false),
  (10, 'Jack Ryan', 'jack@umbrella.com', false, 4, false),
  (11, 'Karen Page', 'karen@stark.com', false, 5, false),
  (12, 'Leo Messi', 'leo@stark.com', false, 5, false),
  (13, 'Mona Lisa', 'mona@stark.com', false, 5, false),
  (14, 'Operator B', 'bee@feedback.example.com', false, NULL, true),
  (15, 'A Operator', 'a.op@feedback.example.com', false, NULL, true),
  (16, 'Support Tech', 'support@feedback.example.com', false, NULL, true);

INSERT INTO ticket_status (id, description) VALUES
  (1, 'open'),
  (2, 'working on'),
  (3, 'done'),
  (4, 'closed');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (1, 1, 'Ticket 1 for Acme Corporation', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (1, 1, NULL, 2, 'Initial message for ticket 1 for Acme Corporation');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (2, 1, 'Ticket 2 for Acme Corporation', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (2, 2, NULL, 3, 'Initial message for ticket 2 for Acme Corporation');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (3, 2, 2, 14, 'Admin reply to ticket 2 for Acme Corporation');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (3, 1, 'Ticket 3 for Acme Corporation', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (4, 3, NULL, 2, 'Initial message for ticket 3 for Acme Corporation');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (4, 1, 'Ticket 4 for Acme Corporation', NULL, 4);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (5, 4, NULL, 3, 'Initial message for ticket 4 for Acme Corporation');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (6, 4, 5, 14, 'Admin reply to ticket 4 for Acme Corporation');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (5, 1, 'Ticket 5 for Acme Corporation', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (7, 5, NULL, 2, 'Initial message for ticket 5 for Acme Corporation');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (6, 1, 'Ticket 6 for Acme Corporation', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (8, 6, NULL, 3, 'Initial message for ticket 6 for Acme Corporation');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (9, 6, 8, 15, 'Admin reply to ticket 6 for Acme Corporation');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (7, 2, 'Ticket 1 for Globex Inc.', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (10, 7, NULL, 5, 'Initial message for ticket 1 for Globex Inc.');
  
INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (8, 2, 'Ticket 2 for Globex Inc.', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (11, 8, NULL, 5, 'Initial message for ticket 2 for Globex Inc.');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (12, 8, 11, 16, 'Admin reply to ticket 2 for Globex Inc.');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (9, 2, 'Ticket 3 for Globex Inc.', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (13, 9, NULL, 5, 'Initial message for ticket 3 for Globex Inc.');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (10, 2, 'Ticket 4 for Globex Inc.', NULL, 4);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (14, 10, NULL, 5, 'Initial message for ticket 4 for Globex Inc.');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (15, 10, 14, 14, 'Admin reply to ticket 4 for Globex Inc.');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (11, 2, 'Ticket 5 for Globex Inc.', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (16, 11, NULL, 5, 'Initial message for ticket 5 for Globex Inc.');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (12, 2, 'Ticket 6 for Globex Inc.', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (17, 12, NULL, 5, 'Initial message for ticket 6 for Globex Inc.');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (18, 12, 17, 14, 'Admin reply to ticket 6 for Globex Inc.');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (13, 2, 'Ticket 7 for Globex Inc.', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (19, 13, NULL, 5, 'Initial message for ticket 7 for Globex Inc.');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (14, 3, 'Ticket 1 for Initech', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (20, 14, NULL, 7, 'Initial message for ticket 1 for Initech');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (15, 3, 'Ticket 2 for Initech', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (21, 15, NULL, 8, 'Initial message for ticket 2 for Initech');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (22, 15, 21, 16, 'Admin reply to ticket 2 for Initech');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (16, 3, 'Ticket 3 for Initech', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (23, 16, NULL, 7, 'Initial message for ticket 3 for Initech');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (17, 3, 'Ticket 4 for Initech', NULL, 4);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (24, 17, NULL, 8, 'Initial message for ticket 4 for Initech');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (25, 17, 24, 16, 'Admin reply to ticket 4 for Initech');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (18, 3, 'Ticket 5 for Initech', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (26, 18, NULL, 7, 'Initial message for ticket 5 for Initech');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (19, 3, 'Ticket 6 for Initech', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (27, 19, NULL, 8, 'Initial message for ticket 6 for Initech');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (28, 19, 27, 16, 'Admin reply to ticket 6 for Initech');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (20, 3, 'Ticket 7 for Initech', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (29, 20, NULL, 7, 'Initial message for ticket 7 for Initech');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (21, 3, 'Ticket 8 for Initech', NULL, 4);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (30, 21, NULL, 8, 'Initial message for ticket 8 for Initech');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (31, 21, 30, 15, 'Admin reply to ticket 8 for Initech');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (22, 4, 'Ticket 1 for Umbrella Corp', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (32, 22, NULL, 10, 'Initial message for ticket 1 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (23, 4, 'Ticket 2 for Umbrella Corp', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (33, 23, NULL, 10, 'Initial message for ticket 2 for Umbrella Corp');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (34, 23, 33, 14, 'Admin reply to ticket 2 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (24, 4, 'Ticket 3 for Umbrella Corp', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (35, 24, NULL, 10, 'Initial message for ticket 3 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (25, 4, 'Ticket 4 for Umbrella Corp', NULL, 4);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (36, 25, NULL, 10, 'Initial message for ticket 4 for Umbrella Corp');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (37, 25, 36, 15, 'Admin reply to ticket 4 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (26, 4, 'Ticket 5 for Umbrella Corp', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (38, 26, NULL, 10, 'Initial message for ticket 5 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (27, 4, 'Ticket 6 for Umbrella Corp', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (39, 27, NULL, 10, 'Initial message for ticket 6 for Umbrella Corp');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (40, 27, 39, 16, 'Admin reply to ticket 6 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (28, 4, 'Ticket 7 for Umbrella Corp', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (41, 28, NULL, 10, 'Initial message for ticket 7 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (29, 4, 'Ticket 8 for Umbrella Corp', NULL, 4);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (42, 29, NULL, 10, 'Initial message for ticket 8 for Umbrella Corp');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (43, 29, 42, 14, 'Admin reply to ticket 8 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (30, 4, 'Ticket 9 for Umbrella Corp', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (44, 30, NULL, 10, 'Initial message for ticket 9 for Umbrella Corp');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (31, 5, 'Ticket 1 for Stark Industries', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (45, 31, NULL, 12, 'Initial message for ticket 1 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (32, 5, 'Ticket 2 for Stark Industries', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (46, 32, NULL, 13, 'Initial message for ticket 2 for Stark Industries');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (47, 32, 46, 14, 'Admin reply to ticket 2 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (33, 5, 'Ticket 3 for Stark Industries', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (48, 33, NULL, 12, 'Initial message for ticket 3 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (34, 5, 'Ticket 4 for Stark Industries', NULL, 4);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (49, 34, NULL, 13, 'Initial message for ticket 4 for Stark Industries');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (50, 34, 49, 15, 'Admin reply to ticket 4 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (35, 5, 'Ticket 5 for Stark Industries', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (51, 35, NULL, 12, 'Initial message for ticket 5 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (36, 5, 'Ticket 6 for Stark Industries', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (52, 36, NULL, 13, 'Initial message for ticket 6 for Stark Industries');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (53, 36, 52, 15, 'Admin reply to ticket 6 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (37, 5, 'Ticket 7 for Stark Industries', NULL, 3);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (54, 37, NULL, 12, 'Initial message for ticket 7 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (38, 5, 'Ticket 8 for Stark Industries', NULL, 4);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (55, 38, NULL, 13, 'Initial message for ticket 8 for Stark Industries');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (56, 38, 55, 16, 'Admin reply to ticket 8 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (39, 5, 'Ticket 9 for Stark Industries', NULL, 1);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (57, 39, NULL, 12, 'Initial message for ticket 9 for Stark Industries');

INSERT INTO support_ticket (id, customer_id, description, handled, status)
  VALUES (40, 5, 'Ticket 10 for Stark Industries', NULL, 2);
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (58, 40, NULL, 13, 'Initial message for ticket 10 for Stark Industries');
INSERT INTO support_message (id, ticket_id, reply_to, from_user, body)
  VALUES (59, 40, 58, 15, 'Admin reply to ticket 10 for Stark Industries');

INSERT INTO feedback (guest_name, guest_email, feedback, handled) VALUES
  ('John Doe', 'john@example.com', 'Great service overall!', NULL),
  ('Jane Roe', 'jane@example.com', 'I had some trouble finding help.', NULL),
  ('Bob Guest', 'bob.guest@example.com', 'The website is very user friendly.', NULL),
  ('Alice Visitor', 'alice.visitor@example.com', 'Support was a bit slow.', NULL),
  ('Sam Tester', 'sam@test.com', 'Loved the quick responses!', NULL),
  ('Megan Public', 'megan.public@example.com', 'Good, but could be improved.', NULL),
  ('Tom Random', 'tom.random@example.com', 'Satisfied with the service.', NULL),
  ('Lucy Lee', 'lucy.lee@example.com', 'Feedback: service quality is high.', NULL),
  ('Gary Nonuser', 'gary@example.com', 'I appreciate the follow-ups.', NULL),
  ('Nina External', 'nina@extern.com', 'Helpful and friendly support.', NULL),
  ('Oliver Out', 'oliver.out@example.com', 'The support portal is intuitive.', NULL),
  ('Paula Free', 'paula.free@example.com', 'No issues so far.', NULL),
  ('Quincy Q', 'quincyq@example.com', 'Very prompt assistance!', NULL),
  ('Rachel R', 'rachel.r@example.com', 'Great experience.', NULL),
  ('Steve S', 'steve.s@example.com', 'Could use more updates.', NULL);

INSERT INTO feedback (from_user, feedback, handled) VALUES
  (2, 'I had an issue but it was resolved quickly.', NOW()),
  (3, 'The ticketing system works as expected.', NOW()),
  (5, 'I appreciate the timely responses.', NOW()),
  (7, 'Support has been very helpful.', NOW()),
  (8, 'There was a slight delay in response.', NOW()),
  (10, 'Our support team is great!', NOW()),
  (12, 'Smooth experience with the support portal.', NOW()),
  (13, 'The admin reply clarified my doubts.', NOW()),
  (4, 'I am satisfied with the current workflow.', NOW()),
  (11, 'Happy with the improvements in support.', NOW()),
  (1, 'Everything is running perfectly.', NOW()),
  (6, 'The system performance is top-notch.', NOW()),
  (9, 'The support system is efficient.', NOW());
