-- B1: tạo database cho website movie

create database db_movie; -- chỉ chạy 1 lần

use db_movie;

# xóa database
DROP DATABASE IF EXISTS db_movie;

-- B2: tạo các table cho website movie
-- tạo table users

-- datatype:
-- number: int, bigint, double, float,...
-- chuỗi: varchar, char,...
-- boolean: 0(false), 1(true)

-- VARCHAR và INT

CREATE TABLE users (
	username VARCHAR(50),
	email VARCHAR(255),
	address VARCHAR(255),
	age INT
)

-- update table
-- sửa kiểu dữ liệu column, thêm mới column,...
-- case 1: sửa kiểu dữ liệu column
ALTER TABLE users
modify COLUMN username VARCHAR(200);

-- rename column
ALTER TABLE users
RENAME COLUMN username TO user_name;

-- case 2: tạo column mới
ALTER TABLE users
ADD COLUMN cmnd VARCHAR(20);

-- tạo data cho table users
insert into users(username, email, address, age)
VALUES
('user1', 'user1@example.com', '123 Main St', 25),
('user2', 'user2@example.com', '456 Elm St', 30),
('user3', 'user3@example.com', '789 Oak St', 22),
('user4', 'user4@example.com', '321 Pine St', 28),
('user5', 'user5@example.com', '654 Maple St', 35),
('user6', 'user6@example.com', '987 Birch St', 27),
('user7', 'user7@example.com', '147 Cedar St', 24),
('user8', 'user8@example.com', '258 Spruce St', 29),
('user9', 'user9@example.com', '369 Aspen St', 26),
('user10', 'user10@example.com', '741 Willow St', 33),
('user11', 'user11@example.com', '852 Cypress St', 32),
('user12', 'user12@example.com', '963 Redwood St', 31),
('user13', 'user13@example.com', '159 Poplar St', 23),
('user14', 'user14@example.com', '753 Sequoia St', 34),
('user15', 'user15@example.com', '951 Fir St', 21),
('user16', 'user16@example.com', '357 Ash St', 20),
('user17', 'user17@example.com', '258 Linden St', 36),
('user18', 'user18@example.com', '951 Alder St', 27),
('user19', 'user19@example.com', '753 Hawthorn St', 29),
('user20', 'user20@example.com', '357 Chestnut St', 28);

-- kiểm tra data đã được thêm chưa
SELECT * FROM users

-- data -> lấy dữ liệu -> select
-- tạo dữ liệu -> insert
-- update dữ liệu -> update
-- xóa dữ liệu -> delete

-- update dữ liệu
UPDATE users
SET username = "Nguyễn Văn A"
WHERE email = "user1@example.com"

-- xóa dữ liệu
DELETE FROM users
WHERE email = "user1@example.com"

-- đổi tên column trong quá trình select data
SELECT username as user_name from users

-- lấy người có tuổi từ 20 đến 25
-- c1
SELECT * FROM users
WHERE age >= 20 and age <= 25

-- c2
SELECT * FROM users
WHERE age BETWEEN 20 and 25

-- sắp xếp -> order by -> tăng dần (ASC), giảm dần (DESC)
SELECT * FROM users
WHERE age BETWEEN 20 and 25
ORDER BY age ASC
LIMIT 3 -- lấy số lượng data cho trước -> lấy 3 dữ liệu

-- tìm kiếm tương đối -> LIKE
SELECT * FROM users
WHERE username LIKE "user1%" -- lấy từ đầu tiên

--ví dụ: tìm kiếm người có họ "Tăng"

-- "Tăng%" -> lấy đầu tiên (họ) - Tăng abc, Tăng xyz,...
-- "%Tăng" -> lấy cuối cùng (tên) - abc Tăng, xyz Tăng,...
-- "%...%" -> lấy hết

-- tìm tuổi lớn nhất -> MAX
SELECT MAX(age) FROM users

-- show họ tên, email người có tuổi lớn nhất -> sub query
-- bước 1: tìm tuổi lớn nhất
-- bước 2: select những người có tuổi lớn nhất (dựa vào bước 1)
SELECT * FROM users
WHERE age = (SELECT MAX(age) FROM users)

-- KHÓA CHÍNH
-- thêm khóa chính cho table users
ALTER TABLE users
ADD COLUMN user_id INT PRIMARY KEY AUTO_INCREMENT
SELECT * FROM users
-- khóa chính không được null

-- KHÓA NGOẠI
SELECT * FROM users

-- table restaurant
CREATE TABLE restaurants(
	res_id INT PRIMARY KEY AUTO_INCREMENT,
	res_name VARCHAR(255),
	image VARCHAR(255),
	description VARCHAR(255)
)

-- tạo data table restaurants
INSERT INTO restaurants (res_name, image, description) VALUES
('Golden Dragon', 'http://example.com/image_1.jpg', 'A perfect place for seafood lovers.'),
('Sunset Grill', 'http://example.com/image_2.jpg', 'Best grill in town with a sunset view.'),
('Ocean Breeze', 'http://example.com/image_3.jpg', 'Enjoy a breezy dining experience by the ocean.'),
('Mountain Delight', 'http://example.com/image_4.jpg', 'Delightful meals with a mountain view.'),
('Urban Eatery', 'http://example.com/image_5.jpg', 'Urban style dining with a trendy menu.'),
('Savory Corner', 'http://example.com/image_6.jpg', 'Savor the best corner of flavor.'),
('Spice Route', 'http://example.com/image_7.jpg', 'A journey through spices from around the world.'),
('Garden Bistro', 'http://example.com/image_8.jpg', 'Relax in our beautiful garden setting.'),
('Lakeview Tavern', 'http://example.com/image_9.jpg', 'Tavern with a breathtaking lake view.'),
('Metro Diner', 'http://example.com/image_10.jpg', 'Classic diner with a modern twist.'),
('Seaside Cafe', 'http://example.com/image_11.jpg', 'Cozy cafe by the seaside.'),
('Rustic Table', 'http://example.com/image_12.jpg', 'Rustic dishes served with love.'),
('Hometown Kitchen', 'http://example.com/image_13.jpg', 'Homemade meals with a touch of tradition.'),
('Royal Feast', 'http://example.com/image_14.jpg', 'Experience a royal feast like never before.'),
('City Lights', 'http://example.com/image_15.jpg', 'Dine under the city lights.'),
('Highland Grill', 'http://example.com/image_16.jpg', 'Grill with a highland ambiance.'),
('Cozy Nook', 'http://example.com/image_17.jpg', 'Cozy nook for intimate dining.'),
('Harbor House', 'http://example.com/image_18.jpg', 'Harbor side dining at its finest.'),
('Epicurean Escape', 'http://example.com/image_19.jpg', 'An escape into epicurean delights.'),
('The Green Olive', 'http://example.com/image_20.jpg', 'Mediterranean flavors at The Green Olive.');

-- do table users và table restaurant có quan hệ n-n
-- => tạo table trung gian
CREATE TABLE like_res(
	like_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id), 
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	date_like DATE
)

-- tạo data cho table like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(19, 3, '2024-04-05'),
(15, 13, '2024-06-23'),
(13, 9, '2023-10-22'),
(8, 19, '2024-01-24'),
(15, 9, '2024-03-26'),
(2, 7, '2023-07-20'),
(10, 5, '2023-11-25'),
(3, 18, '2024-01-05'),
(9, 7, '2024-05-03'),
(3, 5, '2023-11-07');

-- case 1: inner join => lấy những dữ liệu có liên quan giữa 2 table
-- kinh nghiệm: lấy table trung gian làm gốc
SELECT * FROM like_res
INNER JOIN restaurants AS res ON like_res.res_id = res.res_id

-- case 2: left join => lấy tất cả dữ liệu trong table A và những data 
-- liên quan với table B
SELECT * FROM restaurants as res
LEFT JOIN like_res ON res.res_id = like_res.res_id

-- tạo table rate_res
CREATE TABLE rate_res(
	rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	res_id INT,
	FOREIGN KEY (res_id) REFERENCES restaurants(res_id),
	amount INT,
	date_rate DATE
)

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 3, 5, "2024-07-03"),  -- User 1 rates Taco Fiesta 5 stars on 2024-07-03
(2, 5, 4, "2024-06-20"),  -- User 2 rates Burger Barn 4 stars on 2024-06-20
(3, 1, 4, "2024-05-12"),  -- User 3 rates Pizza Palace 4 stars on 2024-05-12
(4, 7, 5, "2024-07-02"),  -- User 4 rates Crepe Heaven 5 stars on 2024-07-02
(1, 2, 3, "2024-06-22"),  -- User 1 rates Noodle Nirvana 3 stars on 2024-06-22
(5, 10, 5, "2024-06-19"),  -- User 5 rates The Grill House 5 stars on 2024-06-19
(3, 8, 4, "2024-07-01"),  -- User 3 rates Happy Wok 4 stars on 2024-07-01
(2, 14, 4, "2024-06-27"),  -- User 2 rates The Ramen Shop 4 stars on 2024-06-27
(4, 16, 5, "2024-06-12"),  -- User 4 rates Taco Tuesday Everyday 5 stars on 2024-06-12
(1, 18, 3, "2024-06-25"),  -- User 1 rates The Healthy Choice 3 stars on 2024-06-25
(6, 1, 5, "2024-03-15"),  -- Additional entries with different users and restaurants
(7, 9, 4, "2024-05-08"),
(8, 12, 5, "2024-04-20"),
(9, 6, 3, "2024-02-10"),
(10, 15, 4, "2024-01-25")

-- tạo table food_type
CREATE TABLE food_type(
	type_id INT PRIMARY KEY AUTO_INCREMENT,
	type_name VARCHAR(255)
)

INSERT INTO food_type (type_name) VALUES
("Italian"),
("Mexican"),
("Asian"),
("American"),
("French"),
("Mediterranean"),
("Indian"),
("Vegetarian"),
("Healthy"),
("Fast Food");

-- tạo table food
CREATE TABLE food(
	food_id INT PRIMARY KEY AUTO_INCREMENT,
	food_name VARCHAR(255),
	image VARCHAR(255),
	price FLOAT,
	description VARCHAR(255),
	type_id INT,
	FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)

ALTER TABLE food
modify COLUMN description TEXT

INSERT INTO food (food_name, price, image, description, type_id) VALUES
("Margherita Pizza", 12.99, "images/margherita_pizza.jpg", "Classic pizza with tomato sauce, mozzarella cheese, and fresh basil.", 1),  /* Italian */
("Chicken Fajitas", 15.50, "images/chicken_fajitas.jpg", "Sizzling grilled chicken strips with peppers and onions, served with tortillas, salsa, and guacamole.", 2),  /* Mexican */
("Pad Thai", 11.75, "images/pad_thai.jpg", "Stir-fried rice noodles with chicken, vegetables, and a flavorful peanut sauce.", 3),  /* Asian */
("Cheeseburger", 9.99, "images/cheeseburger.jpg", "All-American cheeseburger with a juicy beef patty, melted cheddar cheese, lettuce, tomato, and onion on a toasted bun.", 4),  /* American */
("Ratatouille", 14.25, "images/ratatouille.jpg", "Provençal vegetable stew with eggplant, zucchini, tomatoes, and herbs.", 6),  /* Mediterranean */
("Butter Chicken", 13.95, "images/butter_chicken.jpg", "Creamy Indian curry with tender chicken in a spiced tomato gravy.", 7), /* Indian */
("Black Bean Burger", 10.50, "images/black_bean_burger.jpg", "Vegetarian burger made with black beans, corn, and spices, served on a whole wheat bun.", 6),  /* Vegetarian */
("Salmon with Roasted Vegetables", 18.75, "images/salmon_roasted_vegetables.jpg", "Grilled salmon fillet with roasted seasonal vegetables", 5),  /* French (can be considered healthy) */
("Quinoa Salad", 11.25, "images/quinoa_salad.jpg", "Healthy and flavorful salad with quinoa, vegetables, and a light vinaigrette dressing.", 9),  /* Healthy */
("Chicken Tenders", 8.99, "images/chicken_tenders.jpg", "Crispy breaded chicken tenders with dipping sauces.", 10),  /* Fast Food */
("Sushi Set", 17.50, "images/sushi_set.jpg", "Assortment of sushi pieces and nigiri.", 3),  /* Asian */
("Beef Lasagna", 14.95, "images/beef_lasagna.jpg", "Classic Italian layered pasta dish with ground beef, tomato sauce, and béchamel sauce.", 1), /* Italian */
("Tacos Al Pastor", 12.25, "images/tacos_al_pastor.jpg", "Marinated pork tacos with pineapple, onions, and cilantro.", 2), /* Mexican */
("Chicken Tikka Masala", 13.75, "images/chicken_tikka_masala.jpg", "Creamy Indian curry with marinated chicken in a tomato-based sauce.", 7), /* Indian */
("French Fries", 3.50, "images/french_fries.jpg", "Classic side dish of crispy French fries.", 10) /* Fast Food */

-- tạo table orders
CREATE TABLE orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY (user_id) REFERENCES users(user_id),
	food_id INT,
	FOREIGN KEY (food_id) REFERENCES food(food_id),
	amount INT,
	code VARCHAR(255),
	arr_sub_id VARCHAR(255)
)

INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 3, 2, "ORDER123", "[1,2,3]"),  -- User 1 orders 2 Margherita Pizzas (food_id 3)
(2, 5, 1, "ORDER456", "[4,2,3]"),  -- User 2 orders 1 Cheeseburger (food_id 5)
(3, 1, 1, "ORDER789", "[1,2,3]"),  -- User 3 orders 1 Pad Thai (food_id 1)
(4, 7, 3, "ORDER012", "[]"),  -- User 4 orders 3 Black Bean Burgers (food_id 7)
(1, 12, 1, "ORDER345", "[]"),  -- User 1 orders 1 Sushi Set (food_id 12)
(5, 2, 2, "ORDER678", "[]"),  -- User 5 orders 2 Chicken Fajitas (food_id 2)
(3, 8, 1, "ORDER901", "[]"),  -- User 3 orders 1 Salmon with Roasted Vegetables (food_id 😎
(2, 10, 2, "ORDER234", "[]"),  -- User 2 orders 2 Chicken Tenders (food_id 10)
(4, 14, 1, "ORDER567", "[]"),  -- User 4 orders 1 Chicken Tikka Masala (food_id 14)
(1, 4, 1, "ORDER890", "[5,6,7]"),  -- User 1 orders 1 Butter Chicken (food_id 4)
(6, 11, 1, "ORDER102", "[1]"),  -- User 6 orders 1 Quinoa Salad (food_id 11) with additional notes in arr_sub_id (replace with actual notes)
(7, 9, 2, "ORDER349", "[]"),  -- User 7 orders 2 Tacos Al Pastor (food_id 9)
(8, 6, 1, "ORDER781", "[3,7,9]"),  -- User 8 orders 1 Beef Lasagna (food_id 6)
(5, 13, 1, "ORDER092", "[]"),  -- User 5 orders 1 French Fries (food_id 13)
(9, 15, 3, "ORDER510", "[]")

-- câu 1: tìm 5 người like nhà hàng nhiều nhất
-- table: like_res, users
-- đếm số lượng record -> dùng keyword COUNT - (đi kèm với GROUP BY)
-- những keyword liên quan tới tổng hợp dữ liệu: COUNT, SUM, MIN, MAX, AVG -> đi kèm với GROUP BY
SELECT COUNT(u.user_id) as count_like, u.username FROM like_res as lr
INNER JOIN users as u
ON u.user_id = lr.user_id
GROUP BY u.username
ORDER BY COUNT(u.user_id) DESC
LIMIT 5

-- câu 2: tìm 2 nhà hàng có lượt like nhiều nhất
SELECT COUNT(r.res_id) as count_like, r.res_name FROM like_res as lr
INNER JOIN restaurants as r
ON r.res_id = lr.res_id
GROUP BY r.res_name
ORDER BY COUNT(r.res_id) DESC
LIMIT 2

-- câu 3: tìm người đặt hàng nhiều nhất
SELECT COUNT(u.user_id) as count_order, u.username FROM orders
INNER JOIN users as u
ON u.user_id = orders.user_id
GROUP BY u.username
ORDER BY COUNT(u.user_id) DESC
LIMIT 1

-- câu 4: tìm người không hoạt động
SELECT u.user_id, u.username FROM users as u
LEFT JOIN rate_res as rr ON u.user_id = rr.user_id
LEFT JOIN like_res as lr ON u.user_id = lr.user_id
LEFT JOIN orders as o ON u.user_id = o.user_id
WHERE rr.user_id IS NULL
AND lr.user_id IS NULL
AND o.user_id IS NULL