INSERT INTO 
	RESTAURANTS (NAME, LOCATION, ABOUT)
VALUES ('McDonalds', 'Kyiv, Ukrainskykh Heroyiv sqr', 'Cool restaurant, with cool dishes'),
	   ('KFC', 'Kyiv, Vasylkivska str', 'Cool chicken');
	  
INSERT INTO 
	MENU (DISH_NAME, PRICE, ABOUT)
VALUES
	('Burger', 140, 'Very nice!'),
	('Nuggets', 100, 'It`s incredible'),
	('Twist', 250, 'ET dish');
	
INSERT INTO
	ORDERS (RESTAURANTS_ID, MENU_ID, ORDER_AMOUNT)
VALUES 
	(1, 2, 100),
	(2, 3, 250),
	(1, 2, 100);
	

SELECT *
FROM MENU
