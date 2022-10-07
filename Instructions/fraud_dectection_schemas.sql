DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS transaction CASCADE;

-- 1. Create a Merchant Category table
CREATE TABLE merchant_category (
    category_id int2 NOT NULL,
    category_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (category_id)
);

-- 2. Create Merchant table
CREATE TABLE merchant (
    merchant_id int2 NOT NULL,
    merchant_name VARCHAR(30) NOT NULL,
	category_id int2 NOT NULL,
    PRIMARY KEY (merchant_id),
    FOREIGN KEY (category_id) REFERENCES merchant_category(category_id)
);

-- 3. Create Card Holder table
CREATE TABLE card_holder (
    card_holder_id int2 NOT NULL,
    card_holder_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (card_holder_id)
);

-- 4. Credit Card Card table
CREATE TABLE credit_card (
    credit_card_number varchar(20) NOT NULL,
	card_holder_id int2 NOT NULL,
    PRIMARY KEY (credit_card_number),
	FOREIGN KEY (card_holder_id) REFERENCES card_holder(card_holder_id)
);

-- 5. Transaction table
CREATE TABLE transaction (
    transaction_id int NOT NULL,
	transaction_date TIMESTAMP NOT NULL,
	amount float(2) NOT NULL,
	credit_card_number varchar(20) NOT NULL,
	merchant_id int2 NOT NULL,
    PRIMARY KEY (transaction_id),
	FOREIGN KEY (credit_card_number) REFERENCES credit_card(credit_card_number),
	FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
);










