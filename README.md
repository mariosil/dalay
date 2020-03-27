# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## My notes

### About models
* There are many **Restaurants**.
  * A _Restaurant_ has many **Dishes**.    
    * A _Dish_ has an attribute _Dish Group_ which apparently its only a string.
      - This attribute could be extracted into a **Dish Group** model only to enforce semantic structure.
      - So this new model would have many _Dishes_ (group this ones).
* A _Restaurant_ sales _Dishes_ through **Orders**.
* An _Order_ has many **Items**.
* An _Item_ could be a model that references to a _Dish_ and indicates the quantity of dishes that have to be included in the _Order_.
