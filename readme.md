Campsite Air BnB
===================

Collaborators:
-----
[Elin Ng] (https://github.com/elinnet)

[Kate Wilkinson] (https://github.com/KateWilkinson)

[Lucy Hargrave] (https://github.com/triffanys101)

[Lucy Oliphant] (https://github.com/lroliphant)


Brief:
-----

Beyond Camping is a visually appealing website which allows premium holiday makers to search and book for unique camping experiences in the UK - a service which is currently lacking in the market. The service encourages holiday makers to explore the beauty of the British countryside whilst staying at memorable and luxurious lodgings - from sumptuous treehouses in the woods to oppulent yurts by the lake.

Due to the bespoke nature of the lodgings, it is important that vendors (i.e. campsite owners) have ownership of how their sites are marketed to this high value target market.  Hence, a flexible vendor management system has been developed to allow vendors to accurately list their sites, set prices, upload site images and manage bookings and interactions with interested customers.

Original pitch:
-----

Beyond Camping is a website app for users to find unique camping experiences in the UK.
Easy to use platform for campsite vendors to manage their bookings.

User stories:
-------

```
MVP 1 (done)

As a holiday-maker
So that I can explore the options available to me
I would like to see a list of campsites

As a holiday-maker
I want more information on the options I am interested in
So that I can make an informed choice

As a holiday maker
I want to see more details about each campsite (location, price, description)
so that I can compare different listings


MVP 2 (done)

As a vendor
I would like to sign up for an account
So that have permission to add/edit/delete my campsite

As a holiday maker
So that I can contact the owner
I would like to send a booking request to the campsite vendor


MVP 3 (done)

As a holiday maker
So that I can get a good idea of what the campsite will look like
I would like to see a pictures of that campsite

As a holiday maker
So that I can find a campsite that suits my needs
I would like to search campsites by location

As a holiday maker
I so that I can see more information on the listings page
I would like to see a name, location, image, a short description and price

As a holiday maker
So that I can find a campsite that suits my needs type
I would like to search campsites by another option, like camp

As a holiday maker
So that I can find the campsite
I would like to see a map pinpointing where they are

As a holiday maker
So that I can get more information
I would like to see year-round availability, full address and facilities

MVP 4 (work in progress)

As a holiday maker
I would like to see a reviews of a campsite
So that I can make a choice based on themselves

As a holiday maker
I would like to review campsites I have been to
So that I feedback

```

Technologies Used:
-------

* Ruby on Rails web application framework
    Rails chosen as ActiveRecord allows easy interaction with psql databases - our application has a number of models (sites,      vendors) which needed to interact with each other 
* ActiveRecord (database query interface) with PostgreSQL database
* Javascript
* jQuery
* Tested with RSpec, Capybara, Shoulda
* Photos saved to Amazon Web Services: S3 (Simple Storage Service)
* API calls made to GoogleMaps


Set-up Steps:
-----

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby on Rails version 4.2.3

* Gem installation
    bundle install

* Homebrew 
    brew install phantomjs

* Database creation
    bin/rake db:create
    bin/rake db:migrate

* How to run the test suite
    rspec

* Run application on local host
    bin/rails s
    go to http://localhost:3000/

Live demo on Heroku:
-------

https://beyond-camping.herokuapp.com
