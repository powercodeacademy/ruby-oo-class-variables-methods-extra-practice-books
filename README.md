# Class Variables And Class Methods Lab

## Learning Goals

- Use class variables to keep track of data pertaining to a class
- Define class methods to expose data pertaining to a class

## Introduction

In this lab, we'll be dealing with a `Book` class. The `Book` class can produce
individual book. Each book has a `title`, an `author`, a `genre`, and a `page_count`. We need our
`Book` class to be able to keep track of the number of books that it creates.

```ruby
Book.count
# => 30
```

We need our `Book` class to be able to show us the total number of pages in the library:

```ruby
Book.total_pages
# => 9306
```

We need our `Book` class to be able to show us all of the authors of existing
books:

```ruby
Book.authors
# => ["bell hooks", "Angela Davis", "Alice Walker"]
```

We need our `Book` class to be able to show us all of the genres of existing
books:

```ruby
Book.genres
# => ["History", "Business"]
```

We also need our `Book` class to be able to keep track of the number of books of
each genre it creates.

In other words, calling:

```ruby
Book.genre_count
```

Should return something like this;

```ruby
{"history" => 5, "business" => 1, "fiction" => 3}
```

We'll accomplish this with the use of **class variables** and **class methods**.
