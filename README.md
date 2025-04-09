## 1. What is PostgreSQL?
### Ans:
PostgreSQL একটি ফ্রি ও ওপেন-সোর্জ ডাটাবেস সিস্টেম যেটা জটিল ডাটা সেভ করতে এবং ম্যানেজ করতে সাহায্য করে। এটা রিলেশনাল এবং অবজেক্ট-ভিত্তিক ডাটাবেস দুটোই সাপোর্ট করে।

## 2. What is the purpose of a database schema in PostgreSQL?
### Ans:
ডাটাবেস স্কিমা হলো ডাটাবেসের ভিতরে টেবিল, ভিউ ইত্যাদি সাজিয়ে রাখার মতো। এটি ডাটা গোছানো এবং পারমিশন কন্ট্রোলে সাহায্য করে।

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
### Ans:
Primary Key: প্রতিটি সারির জন্য একটি অনন্য পরিচয় দেয় (ডুপ্লিকেট বা খালি মান 허용 না)
Foreign Key: একটি টেবিলের ডাটা অন্য টেবিলের ডাটার সাথে কানেক্ট করে (রিলেশন তৈরি করে)

## 4. What is the difference between the VARCHAR and CHAR data types?
### Ans:
VARCHAR: শুধু প্রয়োজন মতো জায়গা নেয় (যতটুকু লেখা, ততটুকু জায়গা)
CHAR: সবসময় ফিক্সড জায়গা নেয় (যেমন CHAR(10) দিলে ১০ ক্যারাক্টার জায়গা নেবে, লেখা কম থাকলেও)

## 5. Explain the purpose of the WHERE clause in a SELECT statement.
### Ans:
WHERE ক্লজ ব্যবহার করে আমরা শুধু সেই ডাটাগুলো দেখবো যেগুলো নির্দিষ্ট শর্ত পূরণ করে। যেমন: ১০০ টাকার বেশি প্রাইসের বই খুঁজতে।

## 6. What are the LIMIT and OFFSET clauses used for?
### Ans:
LIMIT: কতগুলো রেজাল্ট দেখাবে সেটা সেট করে (যেমন প্রথম ৫টি রেজাল্ট)
OFFSET: কতগুলো রেজাল্ট স্কিপ করবে (যেমন প্রথম ৩টি রেজাল্ট না দেখিয়ে ৪র্থ থেকে দেখাবে)

## 7. How can you modify data using UPDATE statements?
### Ans:
UPDATE দিয়ে টেবিলের কোনো সারির মান পরিবর্তন করা যায়। উদাহরণ:
UPDATE customers 
SET email = 'new@email.com' 
WHERE id = 1;  -- আইডি ১ এর গ্রাহকের ইমেইল বদলালো

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
### Ans:
JOIN দিয়ে একাধিক টেবিলের ডাটা একসাথে দেখানো হয়। উদাহরণ:
SELECT * 
FROM books 
JOIN orders ON books.id = orders.book_id; -- বই এবং অর্ডার টেবিল একসাথে দেখাবে

## 9. Explain the GROUP BY clause and its role in aggregation operations.
### Ans:
GROUP BY একই মানের সারিগুলোকে গ্রুপ করে এবং গণনা করতে সাহায্য করে। যেমন প্রতিটি গ্রাহকের মোট অর্ডার সংখ্যা:
SELECT customer_id, COUNT(*) 
FROM orders 
GROUP BY customer_id;

## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
### Ans:
COUNT(): সারির সংখ্যা গণনা করে (SELECT COUNT(*) FROM orders;)
SUM(): সংখ্যার যোগফল বের করে (SELECT SUM(price) FROM books;)
AVG(): সংখ্যার গড় বের করে (SELECT AVG(price) FROM books;)

