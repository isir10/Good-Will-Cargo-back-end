# README

This README documents the steps necessary to get the
application up and running.

* Ruby version
```ruby 2.7.4```

* Database creation
```rails db:reset```
pg & sqlite
* Database initialization
```rails s```
* ...
* Live Link
  ```https://good-will-cargo-spark-production.up.railway.app/```

* Authentication in headers ```{ 'Authorization': 'Bearer <token>' }```

>Create/Signup a user `../signup` method `POST`

>Show/Login a user `../login` method `POST`

>Edit user details `../me` method ``PATCH``

>Delete user details `../me` method ``DELETE``

>Create a user_cargo `../user_cargos` method ``POST``

>Update a user_cargo `../user_cargos/:id` method ``PATCH``

>Delete a user_cargo `../user_cargos/:id` method ``DELETE``
