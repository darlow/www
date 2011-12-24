Darlow — a skeleton Sinatra project
=======================================

Darlow is a simple skeleton project for Sinatra, that makes a few basic assumptions:

* You're deploying on the [Heroku cedar stack](http://devcenter.heroku.com/articles/cedar) (ruby 1.9.2)
* You're using [DataMapper](http://datamapper.org/) as your ORM
* You're using a MySQL database locally, the Heroku-supplied Postgres database in production
* You're using [bundler](http://gembundler.com/) and [rvm](http://beginrescueend.com/)
* You're testing with [rspec2](http://relishapp.com/rspec) and [Qunit](http://docs.jquery.com/Qunit)
* You're using [pow](http://pow.cx/) to run locally on Mac OS X
* Additionally, if you're using ERB-based templates, it includes [Herbie](http://github.com/kapowaz/herbie) for HTML helpers.

Steps to set up:

1. Create a gemset called darlow (or your choice, editing .rvmrc)
2. bundle install
3. Create a copy of config/database.example.yml => config/database.yml with appropriate settings
4. rake db:setup
5. ln -s ~/Path/to/darlow ~/.pow/darlow