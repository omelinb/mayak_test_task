
Mayak Test Task
-----------

Simple service that collect feedbacks from public api.


System Dependencies
-------------------

- Ruby 2.7.1 (install with [rbenv](https://github.com/sstephenson/rbenv))
- Rails 6.0.3.7
- PostgreSQL

Project Install
-------------------
```shell
git clone git@github.com:omelinb/mayak_test_task.git
bundle install
```

Database creation
-----------------

Create database
```shell
bundle exec rails db:create  
bundle exec rails db:migrate  
```

Run tests
-----------------

```
bundle exec rspec spec
```


