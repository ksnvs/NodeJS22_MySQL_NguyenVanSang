--Create table users

CREATE TABLE users (
id INT AUTO_INCREMENT,
username VARCHAR(255),
created_at DATETIME,

PRIMARY KEY (id)
)

--Create table photos

CREATE TABLE photos (
id INT AUTO_INCREMENT,
image_url VARCHAR(255),
user_id INT,
created_at DATETIME,

PRIMARY KEY (id),
	CONSTRAINT FK_users_photos
	FOREIGN KEY (id) REFERENCES users(id)
)

--Create table likes

CREATE TABLE likes(
photo_id INT,
user_id INT,
created_at DATETIME,
CONSTRAINT FK_photos_likes
	FOREIGN KEY (photo_id) REFERENCES photos(id),
	CONSTRAINT FK_users_likes
	FOREIGN KEY (user_id) REFERENCES users(id)
)

--Create table comments

CREATE TABLE comments(
id INT AUTO_INCREMENT,
comment_text VARCHAR(255),
user_id INT,
photo_id INT,
created_at DATETIME,
PRIMARY KEY (id),
CONSTRAINT FK_photos_comments
	FOREIGN KEY (photo_id) REFERENCES photos(id),
	CONSTRAINT FK_users_comments
	FOREIGN KEY (user_id) REFERENCES users(id)
)

--Create table tags

CREATE TABLE tags(
id INT AUTO_INCREMENT,
tag_name VARCHAR(255),
created_at DATETIME,
PRIMARY KEY (id)
)

--Create table photo_tags

CREATE TABLE photo_tags(
photo_id INT,
tag_id INT,
CONSTRAINT FK_photos_photo_tags
	FOREIGN KEY (photo_id) REFERENCES photos(id),
	CONSTRAINT FK_tags_photo_tags
	FOREIGN KEY (tag_id) REFERENCES tags(id)
)

--Create table follows

CREATE TABLE follows(
follower_id INT,
followee_id INT,
created_at DATETIME,
CONSTRAINT FK_users_follows_follower_id
	FOREIGN KEY (follower_id) REFERENCES users(id),
	CONSTRAINT FK_users_follows_followee_id
	FOREIGN KEY (followee_id) REFERENCES users(id)
)

--Add data to users table

INSERT INTO users (username, created_at)
VALUES ('sang', '2022-06-11 00:00:00');
INSERT INTO users (username, created_at)
VALUES ('dung', '2022-06-12 00:00:00');
INSERT INTO users (username, created_at)
VALUES ('hai', '2022-06-13 00:00:00');
INSERT INTO users (username, created_at)
VALUES ('khai', '2022-06-14 00:00:00');
INSERT INTO users (username, created_at)
VALUES ('hung', '2022-06-15 00:00:00');
INSERT INTO users (username, created_at)
VALUES ('khanh', '2022-06-16 00:00:00');
INSERT INTO users (username, created_at)
VALUES ('thao', '2022-06-14 00:00:00');
INSERT INTO users (username, created_at)
VALUES ('hue', '2022-06-15 00:00:00');
INSERT INTO users (username, created_at)
VALUES ('bao', '2022-06-15 00:00:00');

--Add data to photos table

INSERT INTO photos (image_url, user_id, created_at)
VALUES ('https://dantri.com.vn/nhip-song-tre/hinh-anh-khong-the-khong-yeu-cua-be-gai-5-tuoi-truoc-ong-kinh-may-anh-20180524125231589.htm', 1, '2022-06-17 00:00:00');
INSERT INTO photos (image_url, user_id, created_at)
VALUES ('https://dantri.com.vn/nhip-song-tre/hinh-anh-khong-the-khong-yeu-cua-be-gai-5-tuoi-truoc-ong-kinh-may-anh-20180524125231589.htm', 2, '2022-06-18 00:00:00');
INSERT INTO photos (image_url, user_id, created_at)
VALUES ('https://dantri.com.vn/nhip-song-tre/hinh-anh-khong-the-khong-yeu-cua-be-gai-5-tuoi-truoc-ong-kinh-may-anh-20180524125231589.htm', 4, '2022-06-17 00:00:00');


--Add data to likes table

INSERT INTO likes (photo_id, user_id, created_at)
VALUES (1, 3, '2022-06-18 00:00:00');
INSERT INTO likes (photo_id, user_id, created_at)
VALUES (2, 4, '2022-06-18 00:00:00');
INSERT INTO likes (photo_id, user_id, created_at)
VALUES (3, 1, '2022-06-18 00:00:00');
INSERT INTO likes (photo_id, user_id, created_at)
VALUES (1, 5, '2022-06-18 00:00:00');
INSERT INTO likes (photo_id, user_id, created_at)
VALUES (2, 1, '2022-06-18 00:00:00');
INSERT INTO likes (photo_id, user_id, created_at)
VALUES (3, 6, '2022-06-18 00:00:00');

--Add data to follows table

INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (1, 3, '2022-06-18 00:00:00');
INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (1, 4, '2022-06-18 00:00:00');
INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (2, 5, '2022-06-18 00:00:00');
INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (3, 1, '2022-06-18 00:00:00');
INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (2, 3, '2022-06-18 00:00:00');
INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (3, 2, '2022-06-18 00:00:00');
INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (4, 3, '2022-06-18 00:00:00');
INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (5, 3, '2022-06-18 00:00:00');
INSERT INTO follows (follower_id, followee_id, created_at)
VALUES (2, 6, '2022-06-18 00:00:00');

--Add data to comments table

INSERT INTO comments (comment_text, user_id, photo_id, created_at)
VALUES ('I like your photo', 1, 3, '2022-06-18 00:00:00');
INSERT INTO comments (comment_text, user_id, photo_id, created_at)
VALUES ('I like your photo', 1, 2, '2022-06-18 00:00:00');
INSERT INTO comments (comment_text, user_id, photo_id, created_at)
VALUES ('I like your photo', 2, 3, '2022-06-18 00:00:00');
INSERT INTO comments (comment_text, user_id, photo_id, created_at)
VALUES ('I like your photo', 2, 1, '2022-06-18 00:00:00');
INSERT INTO comments (comment_text, user_id, photo_id, created_at)
VALUES ('I like your photo', 3, 1, '2022-06-18 00:00:00');
INSERT INTO comments (comment_text, user_id, photo_id, created_at)
VALUES ('I like your photo', 6, 3, '2022-06-18 00:00:00');

--Add data to tags table

INSERT INTO tags (tag_name, created_at)
VALUES ('photoTag1', '2022-06-18 00:00:00');
INSERT INTO tags (tag_name, created_at)
VALUES ('photoTag2', '2022-06-18 00:00:00');
INSERT INTO tags (tag_name, created_at)
VALUES ('photoTag3', '2022-06-18 00:00:00');
INSERT INTO tags (tag_name, created_at)
VALUES ('photoTag4', '2022-06-18 00:00:00');
INSERT INTO tags (tag_name, created_at)
VALUES ('photoTag5', '2022-06-18 00:00:00');

--Add data to photo_tags table

INSERT INTO photo_tags (photo_id, tag_id)
VALUES (1, 3);
INSERT INTO photo_tags (photo_id, tag_id)
VALUES (1, 2);
INSERT INTO photo_tags (photo_id, tag_id)
VALUES (2, 4);
INSERT INTO photo_tags (photo_id, tag_id)
VALUES (2, 5);
INSERT INTO photo_tags (photo_id, tag_id)
VALUES (3, 3);
INSERT INTO photo_tags (photo_id, tag_id)
VALUES (2, 1);



-- Tìm năm người dùng sử dụng ứng dụng lâu nhất

SELECT 
    username,
    DATEDIFF(CURRENT_DATE(), created_at) AS days_difference 
FROM users 
    ORDER BY days_difference DESC 
    LIMIT 5;
    
-- Tìm 2 ngày trong tuần có lượt đăng ký nhiều nhất.

SELECT 
    DATE(created_at) AS register_day, COUNT(*) AS number_days
FROM
    users
	GROUP BY register_day
	ORDER BY number_days DESC
	LIMIT 2;
	
-- Xác định người dùng không hoạt động ( người dùng ko đăng ảnh )


