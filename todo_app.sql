--Write a query to delete a user named michael if it exists
DROP USER IF EXISTS michael;

--Write a query to create a user named michael with an encrypted password stonebreaker
CREATE USER "michael" WITH ENCRYPTED PASSWORD 'stonebreaker';

--Write a query to drop a database named todo_app if it exists
DROP DATABASE IF EXISTS todo_app;

--Write a query to create a database named todo_app
CREATE DATABASE "todo_app";

--Connect to the newly created database
\c todo_app;

--Write a query to create a table named tasks
CREATE TABLE "tasks"
(
  id SERIAL PRIMARY KEY NOT NULL, --Define column id as the table's primary key
  title varchar(255) NOT NULL,
  description varchar(255) NULL,
  created_at timestamp NOT NULL DEFAULT now(),
  updated_at timestamp NULL,
  completed boolean NOT NULL DEFAULT false
);

--remove the column named completed
ALTER TABLE "tasks" DROP COLUMN "completed";

--add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL
ALTER TABLE "tasks" ADD "completed_at" timestamp NULL;

--change the updated_at column to not allow NULL values, and have a default value of now()
ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET NOT NULL;
ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET DEFAULT now();

--create a new task, by only setting values (not defining which columns) id = default value
INSERT INTO "tasks" (id, title, description, created_at, updated_at, completed_at) VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

--create a new task
INSERT INTO "tasks" (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

-- select all the titles of tasks that are not yet completed
SELECT tasks.title FROM "tasks" WHERE tasks.completed_at IS NULL;

--update the task with a title of 'Study SQL' to be completed as of now
UPDATE "tasks" SET "completed_at" = NOW() WHERE title = 'Study SQL';

-- select all titles and descriptions of tasks that are not yet completed
SELECT tasks.title, tasks.description FROM "tasks" WHERE tasks.completed_at IS NULL;

-- select all fields of every task sorted by creation date in descending order
SELECT * FROM "tasks" ORDER BY completed_at DESC;

-- create a new task
INSERT INTO "tasks" (title, description) VALUES ('mistake 1', 'a test entry');

-- create a new task
INSERT INTO "tasks" (title, description) VALUES ('mistake 2', 'another test entry');

-- create a new task
INSERT INTO "tasks" (title, description) VALUES ('third mistake', 'another test entry');

-- select title fields of all tasks with a title that includes the word 'mistake'
SELECT title FROM "tasks" WHERE title LIKE '%mistake%';

--delete the task that has a title of mistake 1
DELETE FROM "tasks" where title = 'mistake 1';

--select title and description fields of all tasks with a title that includes the word 'mistake'
SELECT title, description FROM "tasks" WHERE title LIKE '%mistake%';

--delete all tasks that includes the word 'mistake' in the title
DELETE FROM "tasks" WHERE title LIKE '%mistake%';

--select all fields of all tasks sorted by title in ascending order
SELECT * FROM "tasks" ORDER BY title ASC;

SELECT * FROM "tasks";
