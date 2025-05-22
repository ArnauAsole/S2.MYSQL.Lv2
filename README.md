# S2.MYSQL.Lv2
# 🎥 youtubeUnSueño

**youtubeUnSueño** is a simplified database model inspired by YouTube, created for educational purposes. It simulates the core features of a video-sharing platform using MySQL and allows practice with SQL queries, constraints, relationships, and data handling.

---

## 📚 Project Overview

This project includes:

- A normalized database schema with foreign key relationships
- Sample data for users, videos, channels, playlists, tags, and comments
- Use cases for likes/dislikes, subscriptions, and tagging
- SQL examples to query and manage the platform

---

## 🧱 Entity Overview

### 👤 Users
Each user has:
- Email (unique), password, username
- Birth date, gender, country, postal code

### 📺 Videos
Each video includes:
- Title, description, file name, size, duration
- Upload datetime, thumbnail, views, likes/dislikes
- Status: `public`, `unlisted`, `private`

### 🔖 Tags
- Videos can have multiple tags (many-to-many relationship)

### 📡 Channels
- Created by users
- Includes name, description, and creation date

### 🔔 Subscriptions
- Users can subscribe to channels

### 👍👎 Likes/Dislikes
- Users can like or dislike a video or a comment only once

### 📃 Playlists
- Created by users
- Can be `public` or `private`
- Contain ordered video lists

### 💬 Comments
- Users can comment on videos
- Comments can receive likes/dislikes

---

## 🗃️ Database Structure

Created using **MySQL**. Each entity is modeled in a separate table with proper constraints and indexes. 

You can view the structure in [`schema.sql`](#) and the sample data in [`seed_data.sql`](#) (if provided separately).

---

## 🚀 Getting Started

### 1. Create the Database

```
CREATE DATABASE youtubeUnSueño;
USE youtubeUnSueño;
2. Create Tables
Run the SQL script included (or provided above) to create all tables.

3. Insert Sample Data
Use the provided INSERT statements to populate the tables with initial data.
````

### 🔍 Example Queries

Top 5 most viewed videos:
```
SELECT title, views FROM videos ORDER BY views DESC LIMIT 5;
Users subscribed to 'Alice’s Adventures' channel:

SELECT u.username
FROM subscriptions s
JOIN users u ON s.subscriber_id = u.user_id
JOIN channels c ON s.channel_id = c.channel_id
WHERE c.name = 'Alice’s Adventures';
Videos liked by user 'CarlaStreams':

SELECT v.title
FROM video_likes_dislikes vl
JOIN videos v ON vl.video_id = v.video_id
JOIN users u ON vl.user_id = u.user_id
WHERE u.username = 'CarlaStreams' AND vl.action = 'like';
```

### 🛠️ Tools Used
DBeaver for database modeling and interaction

MySQL as the database engine

Markdown for documentation

Git Hub link: https://github.com/ArnauAsole/S2.MYSQL.Lv2.git
