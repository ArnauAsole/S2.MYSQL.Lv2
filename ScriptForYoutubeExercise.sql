CREATE DATABASE youtubeUnSueño;
USE youtubeUnSueño;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('male', 'female', 'other') NOT NULL,
    country VARCHAR(100),
    postal_code VARCHAR(20)
);

CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    file_size_mb FLOAT,
    file_name VARCHAR(255) NOT NULL,
    duration_seconds INT,
    thumbnail_url VARCHAR(255),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    status ENUM('public', 'unlisted', 'private') DEFAULT 'public',
    upload_datetime DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE tags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE video_tags (
    video_id INT,
    tag_id INT,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);

CREATE TABLE channels (
    channel_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    creation_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE subscriptions (
    subscriber_id INT,
    channel_id INT,
    subscription_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (subscriber_id, channel_id),
    FOREIGN KEY (subscriber_id) REFERENCES users(user_id),
    FOREIGN KEY (channel_id) REFERENCES channels(channel_id)
);

CREATE TABLE video_likes_dislikes (
    user_id INT,
    video_id INT,
    action ENUM('like', 'dislike') NOT NULL,
    action_datetime DATETIME NOT NULL,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    creation_date DATE NOT NULL,
    visibility ENUM('public', 'private') DEFAULT 'private',
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE playlist_videos (
    playlist_id INT,
    video_id INT,
    position_in_playlist INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    comment_text TEXT NOT NULL,
    comment_datetime DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

CREATE TABLE comment_likes_dislikes (
    user_id INT,
    comment_id INT,
    action ENUM('like', 'dislike') NOT NULL,
    action_datetime DATETIME NOT NULL,
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (comment_id) REFERENCES comments(comment_id)
);






