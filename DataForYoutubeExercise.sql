use youtubeUnSueño;

INSERT INTO users (email, password, username, birth_date, gender, country, postal_code)
VALUES
('alice@example.com', 'hashed_password1', 'AliceYT', '1995-04-12', 'female', 'USA', '90210'),
('bob@example.com', 'hashed_password2', 'BobbyVids', '1990-09-23', 'male', 'UK', 'W1D4EG'),
('carla@example.com', 'hashed_password3', 'CarlaStreams', '2000-01-01', 'female', 'Spain', '08001');

INSERT INTO channels (user_id, name, description, creation_date)
VALUES
(1, 'Alice’s Adventures', 'Fun videos about travel and food.', '2024-01-10'),
(2, 'Bob’s Builds', 'Engineering and building cool stuff.', '2023-11-20');

INSERT INTO videos (user_id, title, description, file_size_mb, file_name, duration_seconds, thumbnail_url, views, likes, dislikes, status, upload_datetime)
VALUES
(1, 'Barcelona Travel Vlog', 'Exploring Barcelona in 3 days.', 250.5, 'barcelona_trip.mp4', 600, 'thumb1.jpg', 12000, 300, 5, 'public', '2024-03-15 10:30:00'),
(2, 'DIY Wooden Table', 'How to build a stylish table.', 500, 'wood_table.mp4', 900, 'thumb2.jpg', 8500, 410, 8, 'public', '2024-02-05 14:00:00'),
(1, 'Barcelona Tips', 'Quick tips for travelers.', 150, 'tips.mp4', 300, 'thumb3.jpg', 4300, 110, 1, 'unlisted', '2024-03-16 18:00:00');

INSERT INTO tags (tag_name)
VALUES ('travel'), ('DIY'), ('woodworking'), ('Spain'), ('tips');

INSERT INTO video_tags (video_id, tag_id)
VALUES
(1, 1), (1, 4),
(2, 2), (2, 3),
(3, 1), (3, 5);

INSERT INTO subscriptions (subscriber_id, channel_id)
VALUES
(2, 1),
(3, 1),
(1, 2);

INSERT INTO video_likes_dislikes (user_id, video_id, action, action_datetime)
VALUES
(2, 1, 'like', '2024-03-16 12:00:00'),
(3, 1, 'like', '2024-03-17 08:45:00'),
(3, 2, 'dislike', '2024-02-06 10:10:00'),
(1, 2, 'like', '2024-02-07 13:22:00');

INSERT INTO playlists (user_id, name, creation_date, visibility)
VALUES
(1, 'My Travel Vids', '2024-04-01', 'public'),
(2, 'Build Ideas', '2024-03-01', 'private');

INSERT INTO playlist_videos (playlist_id, video_id, position_in_playlist)
VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1);

INSERT INTO comments (user_id, video_id, comment_text, comment_datetime)
VALUES
(3, 1, 'Awesome vlog! I loved the food scenes.', '2024-03-15 12:00:00'),
(1, 2, 'This was very helpful, thanks!', '2024-02-06 15:00:00');

INSERT INTO comment_likes_dislikes (user_id, comment_id, action, action_datetime)
VALUES
(2, 1, 'like', '2024-03-15 13:00:00'),
(3, 2, 'like', '2024-02-06 16:00:00');
