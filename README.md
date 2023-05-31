# README

This is a sample project that shows how to use _Ruby on Rails_ to create a very basic CRUD application.

In order to create quickly create files required to support those CRUD elements, I desided to use the Rails Scaffold generator.

## The concept of this demo project 
* Basicaly, this project present ot you a list of restaurants where you can find the _Name_, _Description_, _Address_ and _Phone_ of each one of these.
* For each one of these restaurants you can see there are three available actions to perform: _Show_, _Edit_ and _Destroy_.
  * If you click the _Show_ option for one of those restaurants, you will be redirected to other view where you will be able to see more details about the selected restaurant. In this case, the additional detail is the restaurant image logo.
    * From this view, you will have options available for _Edit_ the restaurant information or just going _back_ to the previous list of restaurants.
    * If you clicked _Edit_ from this view, you will be redirected to other view where an editable form will be displayed with current information about selected restaurant.
      * From here, you are able to edit and update any information about selected restaurant. Even the brand logo can be changed from this edit view.
      * Also, from this edit view, you will be able to click on _Back_ link to return to previous list of restaurants.
  * If you click the _Edit_ option for one of those restaurants, you will be directly redirected to the _edit_ view.
  * If you click the _Destroy_ option for one of those restaurants, you will be prompted for confirmation. The restaurant will be deleted if you confirm this action and flash confirmation message will be displayed at the top of list.
* At the botom of this list of restaurants you can find a _New Restaurant_ link that will redirects you to other view where an empty form will be displayed. This form allows to fill in information about the new restaurant that you want to create.
  * From here, you will be able to add a new restaurant by clicking on "Create Restaurant" button, or just going _back_ to the previuos list of restaurants. 

### About models
* There are many **Restaurants**.
  * A _Restaurant_ has many **Dishes**.    
    * A _Dish_ belongs to a _Dish Group_ which can be "Entrees", "Soups & Salads", "Deserts" and "Drinks".
* A _Restaurant_ sales _Dishes_ through **Orders**.
  * An _Order_ has many **Items**.
  * An _Item_ is a model that references to a _Dish_ and indicates the quantity of dishes that have to be included in the _Order_.

## This project was recently dockerized
In order to run this app throung docker-compose you have to move into `dev-compose` and run:
```sh
docker-compose run web yarn install --ckeck-files
```

```sh
docker-compose run web bundle install
```

```sh
docker-compose run web rails db:setup
```

```sh
docker-compose build
```

```sh
docker-compose up
```

...after that, you hsould be able to go to http://localhost:3000 and see the Restaurants list.
