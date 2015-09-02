# Support Hero API

My approach to this code challenge was to first break down the requirements document so I knew all the features I needed to deliver. The challenge is to create a somewhat simple scheduling system for a support team, called "Support Heroes".  

The requirements are:

* 1. Display today’s Support Hero. (Display the "on-call" support person).
* 2. Display a single user’s schedule showing the days they are assigned to Support Hero.
* 3. Display the full schedule for all users in the current month.
* 4. Users should be able to mark one of their days on duty as undoable
* - 4a. The system should reschedule accordingly
* - 4b. Should take into account weekends and California’s holidays.
* 5. Users should be able to swap duty with another user’s specific day

One other suggestion from the instructions was "Heavy emphasis pretending this is a system you would deploy". With this in mind, and using my imagination, I predicted that this application would grow to be needed not only on a the desktop but on mobile devices (iOS and Android, phone and tablet). To facilitate this and I choose to create a RESTful (mostly) API written in Ruby on Rails. The API would provide all of the requirements above to any client today and potentially in the future.

The API will have intuative and RESTful commands and serve up beautiful and useful JSON output. To help the future developers implementing the API I have provided thorough documentation in the form of a Wiki.

It has been my experience that first and foremost the business logic needs to be locked down in the back-end. Once that is solid the front-end will follow. This is why I have chosen to focus my time here.

To help demonstrate this challenge I have created a bare-bones web client which can be found <a href="#">here</a>. 

## API Installation
* clone repository
* bundle install
* rake db:create && rake db:migrate && rake db:seed
* start rails server with `rails s` you can optionally specify a port by adding `-p####`. For example `rails s -p3141` to run server on port 3141.

## Features
* RESTful API written in RoR
* Active Model Serializer to deliver the best JSON
* Tests written in Rspec
* FactoryGirl for mocking and Faker for diverse testing
