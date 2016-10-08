# Privatt Agile Tracker

[![Build Status](https://travis-ci.org/privatt/privatt-agile-tracker.svg?branch=master)](https://travis-ci.org/privatt/privatt-agile-tracker)

Original Source Code: https://github.com/fulcrum-agile/fulcrum


Installation
------------

    # Checkout the project
    $ git clone https://github.com/privatt/privatt-agile-tracker.git
    $ cd privatt-agile-tracker

    # Install the project dependencies
    $ gem install bundler
    $ bundle install

    # Set up the development database
    $ bundle exec rake fulcrum:setup db:setup

    # Start the local web server
    $ rails server

You should then be able to navigate to `http://localhost:3000/` in a web browser.
You can log in with the test username `test@example.com`, password `testpass`.


Colophon
--------

Fulcrum is built with the following Open Source technologies:

* [Ruby on Rails](http://rubyonrails.org/)
* [Backbone.js](http://documentcloud.github.com/backbone/)
* [jQuery](http://jquery.com/)
* [Tango Icon Library](http://tango.freedesktop.org/Tango_Icon_Library)
* [Jasmine](http://jasmine.github.io/)
* [Sinon](http://sinonjs.org/)

License
-------
Copyright (c) Privatt Inc. 2016
Copyright 2011-2015, Malcolm Locke. Copyright (c) 2016 Jimmy Beaudoin

Privatt Agile Tracker is made available under the Affero GPL license version 3, see
LICENSE.txt.
