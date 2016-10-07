# Agile Tracker

[![Build Status](https://travis-ci.org/jimbeaudoin/agile-tracker.svg)](https://travis-ci.org/jimbeaudoin/agile-tracker)

This project is a fork of https://github.com/fulcrum-agile/fulcrum

## New Development Path

- [ ] The rails application is going to become an API only
- [ ] The back end is going to be separated from the front end. There is going to be two separate repos.
- [ ] The Backbone application is going to be removed and replaced by an Ember application.


Installation
------------

    # Checkout the project
    $ git clone git://github.com/fulcrum-agile/fulcrum.git
    $ cd fulcrum

    # Install the project dependencies
    $ gem install bundler
    $ bundle install

    # Set up the development database
    $ bundle exec rake fulcrum:setup db:setup

    # Start the local web server
    $ rails server

You should then be able to navigate to `http://localhost:3000/` in a web browser.
You can log in with the test username `test@example.com`, password `testpass`.


Heroku setup
------------

If you wish to host a publicly available copy of Fulcrum, the easiest option is
to host it on [Heroku](http://heroku.com/).

To deploy it to Heroku, make sure you have a local copy of the project; refer
to the previous section for instructions. Then:

    $ gem install heroku

    # Create your app. Replace APPNAME with whatever you want to name it.
    $ heroku create APPNAME --stack cedar-14

    # Set APP_HOST heroku config so outbound emails have a proper host
    # Replace APPNAME below with the value from `heroku create`
    $ heroku config:set APP_HOST=APPNAME.herokuapp.com

    # Define where the user emails will be coming from
    # (This email address does not need to exist)
    $ heroku config:set MAILER_SENDER=noreply@example.org

    # Tell Heroku to exclude parts of the Gemfile
    $ heroku config:set BUNDLE_WITHOUT='development:test:travis:mysql:sqlite'

    # Allow emails to be sent
    $ heroku addons:add sendgrid:starter

    # Deploy the first version
    $ git push heroku master

    # Set up the database
    $ heroku run rake db:setup

Once that's done, you will be able to view your site at
`http://APPNAME.herokuapp.com`.

Deploying to other platforms
----------------------------

Fulcrum can be deployed to any platform that can host Rails.  Setting this
up is beyond the scope of this document, but for the most part Fulcrum does
not have any special operational requirements and can be deployed as a normal
Rails application.

You will need to set up some custom configuration, to do this copy the file
`config/fulcrum.example.rb` to `config/fulcrum.rb` and edit to your
requirements, or ensure the relevant environment variables are set for the
application as described in the file above.

Translating
-----------

Below is an example of how you might go about translating Fulcrum to German.

* Find the name of your locale, in this case we are using `de`
* Copy the `config/locales/en.yml` file to `config/locales/de.yml`
* Edit the file and update all the translated strings in quotes on the right
  hand side.
* Add your new locale to `config.i18n.available_locales` in
  `config/application.rb`
* Run `rake i18n:js:export` to build the Javascript translations.

Thats it!  Ideally you should send your translation as a pull request so you
get credit for it, but if you do not wish to do this please send the file to
one of the mailing lists.

If Fulcrum has already been translated for your language, please take the time
to check the translation database is complete for your language.  You can do
this by running the `rake i18n:missing_keys` task.  If you find any missing
keys for your language please add them.

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
Copyright 2011-2015, Malcolm Locke. Copyright (c) 2016 Jimmy Beaudoin

Fulcrum is made available under the Affero GPL license version 3, see
LICENSE.txt.
