# README

##Welcome to Snappea, a restaurant api service.

This app was built using Ruby 2.3.1 and Rails 5.0.0.1 in api mode.

##Getting Started

###Download the repo
```
git clone https://github.com/peggyfox/snappea && cd snappea
```

###Install the Dependencies
```
bundle
```

###Setup the Database
```
rake db:migrate && rake db:seed
```

###Run the Tests
```
rspec spec
```

###Start the server
```
rails s
```


###Authentication
Accessing the api requires a valid token. To do so, you'll need to create a client in the database.

```
rails c

Client.create.api_key
```

###Sample Request
```
curl -H "Authorization: Token token=the-api-key-copied-from-the-console" http://localhost:3000/api/v1/restaurants
```

##Api Documentation

###Restaurants List
Provides a paginated list of all restaurants. Limit 5 restaurants per page.

```
GET /api/v1/restaurants
```

Sample Url (second page of restaurant results)
```
http://localhost:3000/api/v1/restaurants?page=2
```


Sample Response

```
[
  {
    name: "Portillos",
    description: "Chicago-based chain featuring delicious hot dogs.",
    rating: 5,
    address: "100 W Ontario St, Chicago, IL 60654"
  }
]
```

###Menu Items List for a Restaurant
Provides a list of menu items for a restaurant.
Categories are limited to: Entree, Appetizer, Side, Dessert, and Beverage.

```
GET /api/v1/restaurants/:restaurant_id/menu_items
```

Sample Response

```
[
  {
    name: "Hot Dog",
    description: "Chicago-style hot dog.",
    category: "Entree",
    tags: ["beef", "gluten"]
  },
  {
    name: "Fries",
    description: "Made from idaho potatoes",
    category: "Side",
    tags: ["potato", "fried"]
  }
]
```
