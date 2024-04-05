# Instagram Clone Data :

In this project, we'll be working with a simplified version of an Instagram-like database schema. This schema represents the core components of a social media platform where users can post photos, like, comment, follow each other, and more.

As part of our learning journey, we'll be using a range of advanced SQL functions, including window functions, grouping, and subqueries, to perform intricate data analysis tasks on the provided database. These functions enable you to extract meaningful insights from complex datasets, enhancing your ability to work with real-world scenarios.



# Database Schema Overview:


## Here's a brief overview of the tables you'll be working with:


  users: Contains user information such as usernames and creation timestamps.

  photos: Stores details about posted photos, including image URLs and user IDs.

  comments: Stores comments made on photos, along with associated user and photo IDs.

  likes: Tracks user likes on photos.

  follows: Records users follow relationships.

  tags: Manages unique tag names for photos.

  photo_tags: Links photos with associated tags.


# Problem Statement : 

1. How many times does the average user post.
  
2. Find the top 5 most used hashtags.
   
3. Find users who have liked every single photo on the site.
 
4. Retrieve a list of users along with their usernames and the rank of their 
   account creation, ordered by the creation date in ascending order.
   
5. List the comments made on photos with their comment texts, photo URLs, and usernames of users who posted the comments. 
   Include the comment count for each photo.
   
6. For each tag, show the tag name and the number of photos associated with that tag. 
   Rank the tags by the number of photos in descending order.

7. List the usernames of users who have posted photos along with the count of photos they have posted. 
   Rank them by the number of photos in descending order.

8. Display the username of each user along with the creation date of their 
   first posted photo and the creation date of their next posted photo.

9. For each comment, show the comment text, the username of the commenter, 
   and the comment text of the previous comment made on the same photo.

10. Show the username of each user along with the number of photos they have posted and 
    the number of photos posted by the user before them and after them, based on the creation date              


