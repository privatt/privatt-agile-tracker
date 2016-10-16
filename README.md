# Privatt Agile Tracker

[![Build Status](https://travis-ci.org/privatt/privatt-agile-tracker.svg?branch=master)](https://travis-ci.org/privatt/privatt-agile-tracker)

Original Source Code: https://github.com/fulcrum-agile/fulcrum

## Database Prerequisite

This application is using UUID as identifier.

You must add the following extension to your PostgreSQL installation:

    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

OR, you can execute this command:

    bundle exec rake db:setup

You must be a superuser on your PostgreSQL database to execute the above
command. With `psql`, you can add or remove the superuser role for a user
with the following commands:

    ALTER ROLE <username> WITH SUPERUSER;
    # After the setup, remove the role
    ALTER ROLE <username> WITH NOSUPERUSER;

You can list existing roles with `\du` while using `psql`.

Installation
------------

    # Checkout the project
    $ git clone https://github.com/privatt/privatt-agile-tracker.git
    $ cd privatt-agile-tracker

    # Install the project dependencies
    $ gem install bundler
    $ bundle install

    rails generate symmetric_encryption:config keys
    mkdir keys
    rails generate symmetric_encryption:new_keys development

    # Set up the development database
    $ bundle exec rake fulcrum:setup db:setup

    # Start the local web server
    $ rails server

You should then be able to navigate to `http://localhost:3000/` in a web browser.
You can log in with the test username `test@example.com`, password `testpass`.


Tests
-----

To execute the tests on a server without GUI:

    sudo apt-get install firefox=45.0.2+build1-0ubuntu1
    sudo apt-get install xvfb

    # Start the virtual screen
    /sbin/start-stop-daemon --start --quiet --pidfile /tmp/custom_xvfb_99.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -ac -screen 0 1280x1024x16

    # Execute the tests
    bundle exec rake spec && bundle exec rake --trace spec:javascripts
    OR
    bundle exec rake travis

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

Copyright (c) 2015-2016 Jimmy Beaudoin

Copyright 2011-2015, Malcolm Locke.

Privatt Agile Tracker is made available under the Affero GPL license version 3, see
LICENSE.txt.
