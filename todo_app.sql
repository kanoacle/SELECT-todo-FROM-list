-- deleting old info if it's there
DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;
-- creating the info i need to use
CREATE USER michael WITH PASSWORD 'kanojah';
CREATE DATABASE todo_app WITH OWNER michael;
\c todo_app;
-- creating my tasks table
CREATE TABLE IF NOT EXISTS tasks (
id SERIAL PRIMARY KEY,
title VARCHAR(100),
description VARCHAR(255),
created_at TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
completed_at TIMESTAMP DEFAULT NULL
);
-- inserting values into my table
INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES
('Study SQL', 'Complete this exercise', NOW(), NOW(), NULL),
('Study PostgreSQL', 'Read all the documentation', NOW(), NOW(), NULL);
-- selecting the titles of tasks which aren't completed
SELECT title
FROM tasks
WHERE completed_at IS NULL;
-- updating Study SQL to be completed now
UPDATE tasks
SET completed_at = NOW()
WHERE id = 1;
-- selecting titles and description of incomplete tasks
SELECT title, description
FROM tasks
WHERE completed_at IS NULL;
-- creating new tasks
INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES
('mistake 1', 'a test entry', NOW(), NOW(), NULL),
('mistake 2', 'another test entry', NOW(), NOW(), NULL),
('mistake 3', 'another test entry', NOW(), NOW(), NULL);
-- selecting task titles which include 'mistake'
SELECT title
FROM tasks
WHERE title LIKE '%mistake%';
-- deleting the task named 'mistake 1'
DELETE FROM tasks
WHERE title = 'mistake 1';
-- selecting titles and descriptions from 'mistake' tasks
SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';
-- deleting all 'mistake' tasks
DELETE FROM tasks
WHERE title LIKE '%mistake%';
-- getting all tasks in order by title
SELECT *
FROM tasks;