-- 1. Вывести пользователей, которые не являются создателями чатов
use vk;
select u.username from users as u left join chats as c 
on u.id = c.owner_id where c.id is null;
#___________________________________________________________________________________

-- 2. Вывести пользователей, которых нет ни в одном чате
select u.username from users as u left join user_to_chats as utc 
on u.id = utc.user_id 
where utc.user_id is null;
#___________________________________________________________________________________
-- 3. Для каждого пользователя отдельно. Узнать названия и описание чатов, 
-- в которых они находятся. Упорядочить по названию чата в обратном порядке
select c.title, c.description from chats as c join user_to_chats as utc
on c.id = utc.chat_id and utc.user_id = 1;
-- Значение utc.user_id можно менять, смотря какого пользователя вы хотите просмотреть.
#___________________________________________________________________________________
-- 4. Для каждого пользователя отдельно. Узнать название и дату вступления в чат, 
-- в которых они находятся. Упорядочить по дате вступления в чат

select c.title, utc.enter_datatime from chats as c join user_to_chats as utc
on c.id = utc.chat_id and utc.user_id = 4;
-- Значение utc.user_id можно менять, смотря какого пользователя вы хотите просмотреть.
#___________________________________________________________________________________
