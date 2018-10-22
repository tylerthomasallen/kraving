# Assessment 4

**Do not share this repo or post it publicly. We will take violations
very seriously.**

You have **2 hours** for the assessment. Do not worry if
you do not complete all the assessment; finish as much as you can.

This assessment will focus on a simple CRUD app with authentication. You will
have to model users, lists, and tasks, along with session management.

**Windows Users**: Please use one of our workstation machines for the
assessments.

## Schema

Users have a username, password_digest, and session_token.
Lists have a name and description; each belongs to a User.
Tasks have a body and are either completed or not; each belongs to a
List.

## Specs

Run the specs as you solve the assessment. The tests are intended to
be run in this order:

```
bundle exec rspec spec/models/user_spec.rb
bundle exec rspec spec/models/list_spec.rb
bundle exec rspec spec/models/task_spec.rb
bundle exec rspec spec/controllers/application_controller_spec.rb
bundle exec rspec spec/controllers/users_controller_spec.rb
bundle exec rspec spec/controllers/sessions_controller_spec.rb
bundle exec rspec spec/controllers/lists_controller_spec.rb
bundle exec rspec spec/controllers/tasks_controller_spec.rb
bundle exec rspec spec/features/auth_spec.rb
bundle exec rspec spec/features/lists_spec.rb
bundle exec rspec spec/features/tasks_spec.rb
```

Don't forget, you can run one specific spec by adding a corresponding
`:line_number` at the end. For example, `bundle exec rspec spec/controllers/application_controller_spec.rb:5`.

If a failing spec confuses you, look at the spec file to see if you
can discern what it is asking of you. You may also wish to add
`save_and_open_page` to a spec to see what Capybara sees.

Note that a common mistake relates to capitalization; Capybara needs
to have the text of links and buttons exactly match what it expects.

As ever, please ask your TAs any questions. If you get stuck or don't
know why something is failing; ask. TAs will let you know whether they
can answer your question, so ask anything. Don't use internet or prior
notes, please.

## Database Config

Every time you run `bundle exec rails db:migrate` run `bundle exec rails
db:test:load`. `db:migrate` only updates the development database;
`db:test:load` updates the test DB schema to mirror the development DB.

* **Use BCrypt**. You must not store passwords in the DB.
* `BCrypt::Password.create(password)` digests a password and builds a
  `Password` object.
* `BCrypt::Password.new(digest)` builds a `Password` object for the
  digest.
* `BCrypt::Password#is_password?(password)` checks if a password
  matches a digest.

## Submission

* Rename the directory `first_name_last_name`.
* ZIP it (you can use OS X's built in zip functionality)
* Use `.zip`; no boutique formats please :-)
* Upload to progress tracker (http://progress.appacademy.io/).

Good luck!

**Copyright App Academy, please do not post online**
