# Test case for [rails/rails #42380](https://github.com/rails/rails/issues/42380)

```none
$ rails generate model Foo::Bar
      invoke  active_record
      create    db/migrate/20210603203750_create_foo_bars.rb
      create    app/models/foo/bar.rb
      create    app/models/foo.rb
$ rails generate model Foo::Baz bar:references
      invoke  active_record
      create    db/migrate/20210603203914_create_foo_bazs.rb
      create    app/models/foo/baz.rb
   identical    app/models/foo.rb
$ rails db:create
Created database 'pgns-dev'
Created database 'pgns-test'
$ rails db:migrate
== 20210603203750 CreateFooBars: migrating ====================================
-- create_table(:foo_bars)
   -> 0.0063s
== 20210603203750 CreateFooBars: migrated (0.0064s) ===========================

== 20210603203914 CreateFooBazs: migrating ====================================
-- create_table(:foo_bazs)
rails aborted!
StandardError: An error has occurred, this and all later migrations canceled:

PG::UndefinedTable: ERROR:  relation "bars" does not exist
/Users/david/Work/Scratch/pgns/db/migrate/20210603203914_create_foo_bazs.rb:3:in `change'

Caused by:
ActiveRecord::StatementInvalid: PG::UndefinedTable: ERROR:  relation "bars" does not exist
/Users/david/Work/Scratch/pgns/db/migrate/20210603203914_create_foo_bazs.rb:3:in `change'

Caused by:
PG::UndefinedTable: ERROR:  relation "bars" does not exist
/Users/david/Work/Scratch/pgns/db/migrate/20210603203914_create_foo_bazs.rb:3:in `change'
Tasks: TOP => db:migrate
(See full trace by running task with --trace)
```
