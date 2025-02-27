-- Додавання тестових складів 
INSERT INTO warehouses (id, location, capacity) VALUES
(1, 'Київ, склад №1', 1000),
(2, 'Львів, склад №2', 500),
(3, 'Одеса, склад №3', 800),
(4, 'Харків, склад №4', 1200);

-- Додавання тестових товарів 
INSERT INTO products (id, name, description, price, stock_quanity, warehouse_id) VALUES
(1, 'Ноутбук', 'Потужний ноутбук для роботи', 1500.00, 10, 1),
(2, 'Смартфон', 'Новий смартфон з великим екраном', 800.00, 15, 2),
(3, 'Навушники', 'Бездротові навушники', 150.00, 20, 3),
(4, 'Рюкзак', 'Зручний рюкзак для ноутбука', 50.00, 25, 4);

-- Додавання тестових клієнтів
INSERT INTO customers (id, name, contact_info, addres, created_at) VALUES
(1, 'Іван Петренко', 'ivan@example.com', 'Київ, вул. Шевченка, 10', NOW()),
(2, 'Марія Іванова', 'maria@example.com', 'Львів, вул. Франка, 15', NOW()),
(3, 'Олег Сидоренко', 'oleg@example.com', 'Одеса, вул. Дерибасівська, 5', NOW()),
(4, 'Анна Коваленко', 'anna@example.com', 'Харків, вул. Сумська, 20', NOW());

-- Додавання тестових замовлень
INSERT INTO orders (id, customer_id, total_amount, status, created_at) VALUES
(1, 1, 250.50, 'Оплачено', NOW()),
(2, 2, 120.00, 'Очікує оплату', NOW()),
(3, 3, 310.75, 'Доставлено', NOW()),
(4, 4, 95.30, 'В обробці', NOW());

-- Додавання тестових кур'єрів
INSERT INTO couriers (id, name, contact_info, vehicle) VALUES
(1, 'Павло Андрійович', '+380971234567', 'Авто'),
(2, 'Ірина Олександрівна', '+380981234568', 'Скутер'),
(3, 'Олексій Сергійович', '+380991234569', 'Велосипед'),
(4, 'Світлана Миколаївна', '+380951234570', 'Авто');

-- Додавання тестових платежів
INSERT INTO payments (id, order_id, payment_method, status, created_at) VALUES
(1, 1, 'Картка', 'Підтверджено', NOW()),
(2, 2, 'Готівка', 'Очікує оплату', NOW()),
(3, 3, 'Картка', 'Підтверджено', NOW()),
(4, 4, 'PayPal', 'Очікує оплату', NOW());

-- Виведення всіх даних із таблиць
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM couriers;
SELECT * FROM warehouses;
SELECT * FROM payments;

-- 1. Вибірка всіх даних із таблиці customers
SELECT * FROM customers;

-- 2. Вибірка замовлень, які ще не оплачені (WHERE)
SELECT * FROM orders WHERE status = 'Очікує оплату';

-- 3. Вибірка клієнтів, відсортованих за датою реєстрації (ORDER BY)
SELECT * FROM customers ORDER BY created_at DESC;

-- 4. Групування замовлень за статусом та підрахунок їх кількості (GROUP BY + HAVING)
SELECT status, COUNT(*) AS total_orders 
FROM orders 
GROUP BY status 
HAVING COUNT(*) > 1;

-- 5. Об'єднання таблиць: список замовлень разом з іменами клієнтів (JOIN)
SELECT orders.id, customers.name, orders.total_amount, orders.status 
FROM orders 
JOIN customers ON orders.customer_id = customers.id;

-- 6. Підрахунок загальної кількості замовлень у системі (COUNT)
SELECT COUNT(*) AS total_orders FROM orders;

-- 7. Знаходження унікальних статусів замовлень (DISTINCT)
SELECT DISTINCT status FROM orders;

-- 8. Знаходження максимального та мінімального значення суми замовлень (MAX, MIN)
SELECT MAX(total_amount) AS max_order_amount, MIN(total_amount) AS min_order_amount 
FROM orders;

-- 9. Визначення середньої кількості замовлень на клієнта (AVG)
SELECT AVG(order_count) AS avg_orders_per_customer 
FROM (SELECT customer_id, COUNT(*) AS order_count FROM orders GROUP BY customer_id) AS subquery;

-- 10. Підрахунок кількості замовлень зі статусом "Доставлено"
SELECT COUNT(*) AS delivered_orders FROM orders WHERE status = 'Доставлено';

-- 11. Обчислення загальної суми всіх платежів (SUM)
SELECT SUM(total_amount) AS total_revenue FROM orders;

