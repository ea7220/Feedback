DROP DATABASE IF EXISTS feedback;
CREATE DATABASE feedback;
USE feedback;

DROP TABLE IF EXISTS support_message;
DROP TABLE IF EXISTS support_ticket;
DROP TABLE IF EXISTS feedback;
DROP TABLE IF EXISTS system_user;
DROP TABLE IF EXISTS ticket_status;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(256) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE system_user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fullname VARCHAR(256),
  email VARCHAR(256) NOT NULL,
  mailing_list BOOLEAN NOT NULL DEFAULT false,
  customer_id INT,
  admin BOOLEAN NOT NULL DEFAULT false,
  CONSTRAINT fk_user_customer
    FOREIGN KEY (customer_id) REFERENCES customer(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ticket_status (
  id INT AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(256) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE support_ticket (
  id INT AUTO_INCREMENT PRIMARY KEY,
  arrived TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  customer_id INT,
  description VARCHAR(1024),
  handled TIMESTAMP NULL,
  status INT,
  CONSTRAINT fk_ticket_customer
    FOREIGN KEY (customer_id) REFERENCES customer(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_ticket_status
    FOREIGN KEY (status) REFERENCES ticket_status(id)
) ENGINE=InnoDB;

CREATE TABLE support_message (
  id INT AUTO_INCREMENT PRIMARY KEY,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ticket_id INT,
  reply_to INT,
  from_user INT,
  body VARCHAR(1024),
  CONSTRAINT fk_message_ticket
    FOREIGN KEY (ticket_id) REFERENCES support_ticket(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_message_reply
    FOREIGN KEY (reply_to) REFERENCES support_message(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_message_user
    FOREIGN KEY (from_user) REFERENCES system_user(id)
) ENGINE=InnoDB;

CREATE TABLE feedback (
  id INT AUTO_INCREMENT PRIMARY KEY,
  arrived TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  from_user INT,
  guest_name VARCHAR(256),
  guest_email VARCHAR(256),
  feedback VARCHAR(1024),
  handled TIMESTAMP NULL,
  CONSTRAINT fk_feedback_user
    FOREIGN KEY (from_user) REFERENCES system_user(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB;
