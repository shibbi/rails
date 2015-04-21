
README
=====

This is a simple clone of Reddit made with Rails.

Setup:
Create/seed the database (PostgreSQL) with:

- `rake db:setup` (Rails 4+)
- `rake db:create && rake db:migrate && rake db:seed` (Rails 3 or less).

How to use:

- Start the rails server with `rails s` in the terminal.
- Navigate to http://localhost:3000/subs.
- Anyone can browse existing subs/posts, but you must create an account or
log in before you can create/edit subs or posts.
