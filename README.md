== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.2.1
* Rails version
  4.2.4
* Setup

#### 1.Run this command to install necessary gems
  ```
    bundle install
  ```

#### 2.Run to import data
  ```
    rake db:create db:migrate db:seed
  ```

#### 3.Run application
  ```
    rails server
  ```
  and access ```http://localhost:3000``` to view result.

#### 3.Run to test
  ```
    bundle exec rspec spec
  ```
  maybe you need to create database for test environment before run test
  ```
    RAILS_ENV=test rake db:create db:migrate
  ```
