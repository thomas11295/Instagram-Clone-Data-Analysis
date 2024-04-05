-- 1 How many times does the average user post?


select u.id,username,count(p.user_id) as count_of_post from users u
join photos p on u.id = p.user_id
group by u.id
order by 3 desc;

-- 2 Find the top 5 most used hashtags


select t.id,t.tag_name,count(*) as most_used_tags from tags t
join photo_tags pt on t.id = pt.tag_id
group by t.id
order by 3 desc
limit 5;

-- 3 Find users who have liked every single photo on the site


with result_likes as (
select u.id,u.username,count(l.user_id) as like_on_every_post from users u
join likes l on u.id = l.user_id
group by u.id
order by 3 desc
)
select * from result_likes where like_on_every_post = 257;


-- 4 Retrieve a list of users along with their usernames and the rank of their 
-- account creation, ordered by the creation date in ascending order.


select username,created_at,
rank() over(order by created_at asc) as rank_of_creation_date
from users;


-- 5 List the comments made on photos with their comment texts, photo URLs, 
-- and usernames of users who posted the comments. 
-- Include the comment count for each photo

select c.comment_text,p.image_url,u.username,count(c.id) as comment_count from comments c
join photos p on c.photo_id = p.id
join users u on c.user_id = u.id
group by 1,2,3;


-- 6 For each tag, show the tag name and the number of photos associated with that tag. 
-- Rank the tags by the number of photos in descending order

select t.tag_name,count(p.image_url) as photo_ass_tag,
dense_rank() over(order by count(p.image_url) desc) as rank_of_tag from tags t
join photo_tags pt on t.id = pt.tag_id
join photos p on pt.photo_id = p.id
group by t.tag_name;


-- 7 List the usernames of users who have posted photos along with the count of photos they have posted. 
-- Rank them by the number of photos in descending order.


with user_count_photo as (
select u.username,count(p.id) as count_photos,
dense_rank() over (order by count(p.id)desc) as photos_rank
from users u
join photos p on u.id = p.user_id
group by 1)
select username,count_photos,photos_rank from user_count_photo;


-- 8 Display the username of each user along with the creation date of their 
-- first posted photo and the creation date of their next posted photo

select  u.username,p.image_url,p.created_at as first_posted_photo,
lead(p.created_at) over(partition by u.username order by p.created_at) as next_posted_photo
from users u
join photos p on u.id = p.user_id;


-- 9 For each comment, show the comment text, the username of the commenter, 
-- and the comment text of the previous comment made on the same photo

select u.username,p.image_url,c.comment_text,
lag(c.comment_text) over() as previous_comment from comments c
join users u on c.user_id = u.id
join photos p on u.id = p.user_id;


-- 10 Show the username of each user along with the number of photos they have posted and 
-- the number of photos posted by the user before them and after them, based on the creation date

select u.username,p.created_at,count(p.image_url) as number_of_photos,
lag(count(p.image_url)) over (order by u.username) as before_user,
lead(count(p.image_url)) over (order by u.username) as after_user from users u
join photos p on u.id = p.user_id
group by 1,2;








 




