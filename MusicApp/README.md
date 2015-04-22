README
=====

This is a simple Rails app that has user authentication via email, and
allows signed-in users to track bands, albums, and tracks for the music
they listen to.

The app is currently in progress (authentication is done, but ownership
of music not yet implemented).

Setup:
Create/seed the database (PostgreSQL) with:

- `rake db:setup` (Rails 4+)
- `rake db:create && rake db:migrate && rake db:seed` (Rails 3 or less).

How to use:

- Start the rails server with `rails s` in the terminal.
- Navigate to http://localhost:3000/bands.
- Users must be logged in as this is a music-managing software, so all
bands, albums, and tracks are tied to the current user.
