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

Creation of a visually appealling, easy to navigate website which would allow holiday makers to discover unique camping experiences within the UK.  Our target market of holiday makers are those at the premium end who appreciate luxurious, individual and intimate setting for their holiday. Our website allows this target market to easily find such accomodation to suit their needs in one place - which does not currently exist.

Because of the nature of the application, we felt it was equally important that vendors (i.e. campsite owners) could have ownership of how their sites would be marketed to this clientele.  This led to a flexible vendor management system which provided control of how their campsites were represented and how they could interact with interested customers.

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

Things you may want to cover:

* Configuration Rails should be installed via the cmd: gem install rails

* Ruby on Rails version 4.2.3

* GoogleMaps API  

* Gem installation
    bundle install
    
* Image respository: AWS S3

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

[Camping-app](https://...)


Images:
-------
