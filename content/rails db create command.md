---
title: rails db create command
description: 
aliases: []
tags: []
draft: true
date: 2024-09-13
---
The command `rails db:create` is used in Ruby on Rails applications to create the database(s) specified in your database configuration file (usually `config/database.yml`).

Here's what it does:

1. It reads your database configuration.
2. It creates the database(s) defined in that configuration if they don't already exist.
3. It typically creates both your development and test databases.

This command is usually one of the first steps when setting up a new Rails project or when you've added a new database to an existing project. It prepares the databases that your application will use, but it doesn't create any tables or load any data - that's typically done with migrations and seeds.

## Database level and file system level

t's completely normal and expected that no files were changed when you ran `rails db:create`. This command operates at the database level, not at the file system level. Let me explain:

1. Database creation, not file modification:
   `rails db:create` interacts with your database management system (like PostgreSQL, MySQL, etc.) to create new databases. It doesn't modify any files in your Rails project directory.

2. What it does affect:
   - It creates new databases on your database server.
   - These databases are empty structures ready to receive tables and data.

3. Where you might see changes:
   - In your database management tool (like pgAdmin for PostgreSQL or MySQL Workbench for MySQL), you would see new databases listed.
   - If you were to check your database server directly, you'd find new databases created.

4. When files do change:
   - Files typically change when you run migrations (`rails db:migrate`), which create or modify database tables.
   - Or when you generate new Rails components like models or controllers.

5. Confirmation of success:
   - Usually, you'll see output in your terminal indicating the databases were created successfully.
   - If the databases already existed, you might see a message saying so, or the command might complete silently.

If you want to verify that the databases were indeed created, you could check your database management tool or use a Rails console to try connecting to the database.